package Model.Main;

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

    public static void changeAvatar(String email, String avatar){
        UserDB.changeAvatar(email, avatar);
    }

    public static boolean signup(String email, String passWord, String firstName, String lastName, String dob, String avatar) {
       return UserDB.signup(email, passWord, firstName, lastName, dob, avatar);
    }

    public static User login(String email, String passWord) {
        return UserDB.login(email, passWord);
    }

    public static void updateOnline(String userID) {
        UserDB.updateOnline(userID);
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

    public String getFullName() {
        return (lastName + " " + firstName + "           ").substring(0, 12);
    }
}
