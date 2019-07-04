package WebSocket;

import Model.Chat.Message;
import Model.Library.GSON;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashSet;
import java.util.LinkedList;


@ServerEndpoint(value = "/chatAll", configurator = ServletAwareConfig.class)
public class ChatAllEndpoint {
    private static final HashSet<Session> SESSIONS = new HashSet<>();
    private HttpSession httpSession;

    @OnOpen
    public void onOpen(Session session, EndpointConfig config) throws IOException {
        httpSession = (HttpSession) config.getUserProperties().get("httpSession");
        SESSIONS.add(session);
    }

    @OnMessage
    public void onMessage(Session session, String message) throws IOException {
        LinkedList<Message> listAllMess = (LinkedList<Message>) httpSession.getServletContext().getAttribute("ListAllMess");
        Message mess = GSON.fromJson(message, Message.class);
        if (listAllMess.size() >= 20) {
            listAllMess.removeFirst();
        }
        listAllMess.add(mess);

        SESSIONS.forEach(s -> {
            if (s != session) {
                try {
                    s.getBasicRemote().sendText(message);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });
    }

    @OnClose
    public void onClose(Session session) throws IOException {
        SESSIONS.remove(session);
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        // Do error handling here
    }

}