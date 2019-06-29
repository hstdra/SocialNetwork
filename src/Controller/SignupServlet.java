package Controller;

import Model.MD5;
import Model.Main.User;
import Model.UPLOAD;

import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "SignupServlet", urlPatterns = "/signup")
public class SignupServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String email = request.getParameter("email");
        String password = MD5.hash(request.getParameter("password"));
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String dob = request.getParameter("dob");

        Boolean success = User.signup(email, password, firstname, lastname, dob, null);
        request.getSession().setAttribute("user", User.login(email, password));

        response.getWriter().write(String.valueOf(success));
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null){
            response.sendRedirect("");
        } else {
            request.getRequestDispatcher("/views/inout/signup.jsp").forward(request, response);
        }
    }
}
