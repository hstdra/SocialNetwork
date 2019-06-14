package Model;

import java.sql.*;
import java.util.Objects;

class ConnectDatabase {
    private static String user, password, host, database;

    //Make function for execute sql query from another model
    static ResultSet executeQuery(String query) {
        try {
            return Objects.requireNonNull(statement()).executeQuery(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //Make function for execute sql update from another model
    static int executeUpdate(String query) {
        try {
            return Objects.requireNonNull(statement()).executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    //Make function for execute sql callable from another model
    static CallableStatement prepareCall(String query) {
        try {
            return Objects.requireNonNull(connection()).prepareCall(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //Make function for prepare sql from another model
    static PreparedStatement preparedStatement(String query) {
        try {
            return Objects.requireNonNull(connection()).prepareStatement(query);
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
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://" + host + "/" + database+"?useSSL=false", user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //Declare parameter for database connection
    private static void config() {
//        host = "35.240.187.148:3306";
//        user = "hst";
//        password = "123456";
//        database = "mxh";

        host = "hst.ciodxqutvgb3.ap-southeast-1.rds.amazonaws.com";
        user = "root";
        password = "123456789";
        database = "root";
    }
}
