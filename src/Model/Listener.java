package Model;

import Model.Chat.Contact;
import Model.Chat.Message;
import com.google.gson.Gson;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.LinkedList;

@WebListener()
public class Listener implements ServletContextListener,
        HttpSessionListener, HttpSessionAttributeListener {
    private static final Gson gson = new Gson();

    // Public constructor is required by servlet spec
    public Listener() {
    }

    // -------------------------------------------------------
    // ServletContextListener implementation
    // -------------------------------------------------------
    public void contextInitialized(ServletContextEvent sce) {

        //Update Contact User Each 30s
        Thread t = new Thread(() -> {
            while (true) {
                String contactJsonString = gson.toJson(Contact.getContact());
                sce.getServletContext().setAttribute("Contact", contactJsonString);
                try {
                    Thread.sleep(20000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        });
        t.start();

        //ChatAll message list
        LinkedList<Message> listAllMess = new LinkedList<>();
        listAllMess.add(new Message("0", "Hi all...", "https://yt3.ggpht.com/a/AGF-l79eoN7hD8o5vbcSSMi2xg9MkbUqrwPJMIbq=s900-mo-c-c0xffffffff-rj-k-no"));
        listAllMess.add(new Message("0", "Hi all...", "https://yt3.ggpht.com/a/AGF-l79eoN7hD8o5vbcSSMi2xg9MkbUqrwPJMIbq=s900-mo-c-c0xffffffff-rj-k-no"));
        listAllMess.add(new Message("0", "Hi all...", "https://yt3.ggpht.com/a/AGF-l79eoN7hD8o5vbcSSMi2xg9MkbUqrwPJMIbq=s900-mo-c-c0xffffffff-rj-k-no"));
        sce.getServletContext().setAttribute("ListAllMess", listAllMess);

    }

    public void contextDestroyed(ServletContextEvent sce) {
      /* This method is invoked when the Servlet Context 
         (the Web application) is undeployed or 
         Application Server shuts down.
      */
    }

    // -------------------------------------------------------
    // HttpSessionListener implementation
    // -------------------------------------------------------
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
    }

    // -------------------------------------------------------
    // HttpSessionAttributeListener implementation
    // -------------------------------------------------------

    public void attributeAdded(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute 
         is added to a session.
      */
    }

    public void attributeRemoved(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute
         is removed from a session.
      */
    }

    public void attributeReplaced(HttpSessionBindingEvent sbe) {
      /* This method is invoked when an attribute
         is replaced in a session.
      */
    }

}
