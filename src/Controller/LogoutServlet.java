package Controller;

import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "LogoutServlet", urlPatterns = "/logout")
public class LogoutServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.getSession().invalidate();
        response.sendRedirect("");
    }
}
