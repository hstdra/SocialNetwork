package WebSocket;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;


@ServerEndpoint(value = "/contact", configurator=ServletAwareConfig.class)
public class ContactEndpoint {
    private Session session;
    private static Set<Session> users = Collections.synchronizedSet(new HashSet<>());
    private HttpSession httpSession;
    @OnOpen
    public void onOpen(Session session, EndpointConfig config) throws IOException, EncodeException {
        this.session = session;
        users.add(session);
        httpSession = (HttpSession) config.getUserProperties().get("httpSession");
    }

    @OnMessage
    public void onMessage(Session session, String message) throws IOException, EncodeException {
        String s = httpSession.getServletContext().getAttribute("Contact").toString();
        //System.out.println(s);
        session.getBasicRemote().sendText(s);
    }

    @OnClose
    public void onClose(Session session) throws IOException, EncodeException {
        users.remove(session);
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        // Do error handling here
    }

    private synchronized void broadcast(String message) throws IOException, EncodeException {
        this.session.getBasicRemote().sendObject(message);
    }

}