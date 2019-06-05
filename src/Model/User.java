package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class User {
    private String userID;
    private String email;
    private String firstName;
    private String lastName;
    private String avatar;
    private Date dob;
    private Date lastOnline;

    public User(String userID, String email, String firstName, String lastName, String avatar, Date dob, Date lastOnline) {
        this.userID = userID;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.avatar = avatar;
        this.dob = dob;
        this.lastOnline = lastOnline;
    }

    public static User login(String email, String passWord) {
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

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Date getLastOnline() {
        return lastOnline;
    }

    public void setLastOnline(Date lastOnline) {
        this.lastOnline = lastOnline;
    }
}
