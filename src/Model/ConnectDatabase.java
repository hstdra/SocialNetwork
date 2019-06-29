package Model;

import java.sql.*;
import java.util.Objects;

public class ConnectDatabase {
    private static String user, password, host, database;
    private static final Connection connection = connection();

    //Make function for execute sql query from another model
    public static ResultSet executeQuery(String query) {
        try {
            return Objects.requireNonNull(statement()).executeQuery(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //Make function for execute sql update from another model
    public static int executeUpdate(String query) {
        try {
            return Objects.requireNonNull(statement()).executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    //Make function for execute sql callable from another model
    public static CallableStatement prepareCall(String query) {
        try {
            assert connection != null;
            return connection.prepareCall(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //Make function for prepare sql from another model
    public static PreparedStatement preparedStatement(String query) {
        try {
            return Objects.requireNonNull(connection).prepareStatement(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //Make statement
    private static Statement statement() {
        try {
            assert connection != null;
            return connection.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Make connection
    private static Connection connection() {
        config();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://" + host + "/" + database+"?useSSL=false", user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Declare parameter for database connection
    private static void config() {
        host = "root.ciodxqutvgb3.ap-southeast-1.rds.amazonaws.com";
        user = "root";
        password = "123456789";
        database = "dungxoanua";
    }

}
