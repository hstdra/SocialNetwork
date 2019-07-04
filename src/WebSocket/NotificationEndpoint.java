package WebSocket;

import Model.Library.GSON;
import Model.Main.User;
import Model.Socket.NotificationSK;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;


@ServerEndpoint(value = "/notification", configurator = ServletAwareConfig.class)
public class NotificationEndpoint {
    private static final HashMap<String, List<Session>> userSessions = new HashMap<>();
    private String userID;

    @OnOpen
    public void onOpen(Session session, EndpointConfig config) throws IOException {
        HttpSession httpSession = (HttpSession) config.getUserProperties().get("httpSession");
        userID = ((User) httpSession.getAttribute("user")).getUserID();

        if (userSessions.containsKey(userID)) {
            userSessions.get(userID).add(session);
        } else {
            List<Session> list = new LinkedList<>();
            list.add(session);
            userSessions.put(userID, list);
        }
    }

    @OnMessage
    public void onMessage(Session session, String message) throws IOException {
        NotificationSK m = GSON.fromJson(message, NotificationSK.class);
        try {
            for (Session s : userSessions.get(m.to)) {
                s.getBasicRemote().sendText(GSON.toJson(m));
            }
        } catch (Exception ignored) {
        }
    }

    @OnClose
    public void onClose(Session session) throws IOException {
        List<Session> list = userSessions.get(userID);
        list.remove(session);
        if (list.isEmpty()){
            userSessions.remove(userID);
        }
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        // Do error handling here
    }

    private synchronized void broadcast(String message) throws IOException, EncodeException {

    }

}