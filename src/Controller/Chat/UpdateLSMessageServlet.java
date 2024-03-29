package Controller.Chat;

import Model.Chat.ContactDB;
import Model.Chat.Recent;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateLSMessageServlet", urlPatterns = "/updateLSMessage")
public class UpdateLSMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String chatID = request.getParameter("chatID");
        Recent.updateLSMessage(chatID, userID);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
