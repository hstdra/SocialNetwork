package Controller.Chat;

import Model.Chat.ContactDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetChatIDServlet", urlPatterns = "/getChatID")
public class GetChatIDServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String u1 = request.getParameter("u1");
        String u2 = request.getParameter("u2");
        response.getWriter().print(ContactDB.getChatID(u1, u2));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
