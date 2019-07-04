package Controller.Main;

import Model.Main.Notification;
import Model.Main.Story;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "NewNotification", urlPatterns = "/newNotification")
public class NewNotification extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("Type");
        String uid = request.getParameter("UserID");
        String sid = request.getParameter("StoryID");
        String cid = request.getParameter("CommentID");
        String rt = request.getParameter("ReactType");
        response.getWriter().write(Notification.newNotification(type,uid, sid, cid, rt));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
