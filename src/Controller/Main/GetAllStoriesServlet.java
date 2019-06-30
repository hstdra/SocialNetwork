package Controller.Main;

import Model.Main.Story;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetAllStoriesServlet", urlPatterns = "/getAllStories")
public class GetAllStoriesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listAllStories", Story.getAllStories());
        request.getRequestDispatcher("/views/view.jsp").forward(request, response);
    }
}
