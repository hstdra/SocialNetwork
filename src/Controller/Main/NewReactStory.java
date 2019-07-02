package Controller.Main;

import Model.Chat.ContactDB;
import Model.Main.ReactStory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "NewReactStory", urlPatterns = "/newReactStory")
public class NewReactStory extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sid = request.getParameter("StoryID");
        String uid = request.getParameter("UserID");
        String t = request.getParameter("Type");
        ReactStory.newReactStory(sid, uid, t);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
