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
    private HttpSession httpSession;

    @OnOpen
    public void onOpen(Session session, EndpointConfig config) throws IOException {
        httpSession = (HttpSession) config.getUserProperties().get("httpSession");
    }

    @OnMessage
    public void onMessage(Session session, String message) throws IOException {
        String s = httpSession.getServletContext().getAttribute("Contact").toString();
        session.getBasicRemote().sendText(s);
    }

    @OnClose
    public void onClose(Session session) throws IOException {
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        // Do error handling here
    }

}