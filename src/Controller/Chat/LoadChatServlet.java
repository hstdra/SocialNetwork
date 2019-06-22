package Controller.Chat;

import Model.Chat.Message;
import Model.Chat.MessageDB;
import Model.GSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoadChatServlet", urlPatterns = "/loadChat")
public class LoadChatServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String chatID = request.getParameter("chatID");
        String messID = request.getParameter("messID");
        String json = GSON.toJson(MessageDB.loadChat(chatID, messID));

        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
