package Controller;

import Model.Main.User;

import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String email = request.getParameter("email");
        String passWord = request.getParameter("passWord");
        User user = User.login(email, passWord);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("");
        } else request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null){
            response.sendRedirect("");
        } else {
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }
}
