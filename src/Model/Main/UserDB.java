package Model.Main;

import Model.ConnectDatabase;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

class UserDB {
    private static final List<User> listUser = new LinkedList<>();

    static void changeAvatar(String email, String avatar) {
        PreparedStatement ps = ConnectDatabase.preparedStatement("UPDATE Users SET Avatar = ? WHERE Email = ?");
        try {
            assert ps != null;
            ps.setString(2, email);
            ps.setString(1, avatar);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    static boolean signup(String email, String passWord, String firstName, String lastName, String dob, String avatar) {
        PreparedStatement ps = ConnectDatabase.preparedStatement("INSERT INTO Users (Email, Password, FirstName, LastName, Dob, Avatar, LastOnline) VALUES (?,?,?,?,?,?,NOW())");
        try {
            assert ps != null;
            ps.setString(1, email);
            ps.setString(2, passWord);
            ps.setNString(3, firstName);
            ps.setNString(4, lastName);
            ps.setString(5, dob);
            ps.setString(6, avatar);

            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    static User login(String email, String passWord) {
        try {
            PreparedStatement ps = ConnectDatabase.preparedStatement("Select * from Users where Email=? and Password=?");
            assert ps != null;
            ps.setString(1, email);
            ps.setString(2, passWord);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String userID = rs.getString("UserID");
                String firstName = rs.getString("FirstName");
                String lastName = rs.getString("LastName");
                String avatar = rs.getString("Avatar");
                Date dob = null;
                Date lastOnline = null;

                return new User(userID, email, firstName, lastName, avatar, dob, lastOnline);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    static void updateOnline(String userID) {
        PreparedStatement ps = ConnectDatabase.preparedStatement("UPDATE Users SET LastOnline = NOW() WHERE UserID = ?");
        try {
            assert ps != null;
            ps.setString(1, userID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    static List<User> getListUsers() {
        listUser.clear();
        try {
            ResultSet rs = ConnectDatabase.executeQuery("Select * from Users");
            assert rs != null;
            while (rs.next()) {
                String userID = rs.getString("UserID");
                String email = rs.getString("Email");
                String firstName = rs.getString("FirstName");
                String lastName = rs.getString("LastName");
                String avatar = rs.getString("Avatar");
                Date dob = rs.getDate("Dob");
                Date lastOnline = rs.getTimestamp("LastOnline");

                listUser.add(new User(userID, email, firstName, lastName, avatar, dob, lastOnline));
            }
            return listUser;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
    }
}
