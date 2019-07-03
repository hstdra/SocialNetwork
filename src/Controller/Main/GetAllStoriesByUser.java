package Controller.Main;

import Model.Main.Story;
import Model.Main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetAllStoriesByUser", urlPatterns = "/getAllStoriesByUser")
public class GetAllStoriesByUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sid = request.getParameter("StoryID");
        String uid = request.getParameter("UserID");
        if (sid.equals("-1") && uid.equals(((User) request.getSession().getAttribute("user")).getUserID())) {
            request.setAttribute("input", "yes");
        }
        request.setAttribute("listAllStories", Story.getAllStoriesByUser(sid, uid));
        request.getRequestDispatcher("/views/view.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
