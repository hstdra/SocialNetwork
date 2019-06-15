package Controller;

import Model.Chat.Recent;
import Model.Chat.RecentDB;
import Model.Main.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "IndexServlet", urlPatterns = "")
public class IndexServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = ((User) request.getSession().getAttribute("user")).getUserID();
        List<Recent> listRecent = RecentDB.getListRecent(userID);

        request.getSession().setAttribute("listrecent", listRecent);
        request.getRequestDispatcher("/views/index.jsp").forward(request, response);
    }
}
