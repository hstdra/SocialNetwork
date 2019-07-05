package Controller.Chat;

import Model.Chat.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CheckSeenMessage", urlPatterns = "/checkSeenMessage")
public class CheckSeenMessage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("ChatID");
        String uid1 = request.getParameter("UserID1");
        String uid2 = request.getParameter("UserID2");
        response.getWriter().print(Message.checkSeenMessage(cid, uid1, uid2));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
