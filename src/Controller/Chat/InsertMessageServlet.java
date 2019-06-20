package Controller.Chat;

import Model.Chat.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "InsertMessageServlet", urlPatterns = "/insertMessage")
public class InsertMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String chatID = request.getParameter("chatID");
        String userID = request.getParameter("userID");
        String content = request.getParameter("content");
        Message.insertMessage(chatID, userID, content);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
