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
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection("jdbc:sqlserver://DESKTOP-NJ2B10D;databaseName=" + database + ";", user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Declare parameter for database connection
    private static void config() {
        user = "hst";
        password = "123456";
        database = "FuLib";
    }

}
