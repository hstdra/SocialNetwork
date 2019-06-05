package Model;

import java.sql.*;
import java.util.Collections;
import java.util.Objects;

class ConnectDatabase {
    private static String user, password, database;

    //Make function for execute sql query from another model
    static ResultSet executeQuery(String query) {
        try {
            return Objects.requireNonNull(ConnectDatabase.statement()).executeQuery(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //Make function for execute sql update from another model
    static int executeUpdate(String query) {
        try {
            return Objects.requireNonNull(ConnectDatabase.statement()).executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    //Make statement
    private static Statement statement() {
        try {
            return Objects.requireNonNull(connection()).createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Make connection
    private static Connection connection() {
        config();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://35.240.187.148:3306/mxh", user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Declare parameter for database connection
    private static void config() {
        user = "hst";
        password = "123456";
    }

    public static void main(String[] args) {
        ConnectDatabase.executeQuery("Select * from Users");
    }
}
