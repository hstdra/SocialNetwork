package Model.Chat;

import Model.ConnectDatabase;
import Model.UTCDate;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class ContactDB {
    private static final List<Contact> listContact = new LinkedList<>();

    public static List<Contact> getContact() {
        listContact.clear();
        Date date = UTCDate.getUTCDate();
        try {
            ResultSet rs = ConnectDatabase.executeQuery("Select * from Users order by LastOnline Desc");
            assert rs != null;
            while (rs.next()) {
                String userID = rs.getString("UserID");
                String name = rs.getString("LastName") + " " + rs.getString("FirstName");
                String avatar = rs.getString("Avatar");
                Date lastOnline = rs.getTimestamp("LastOnline");
                long time = (date.getTime() - lastOnline.getTime()) / 60000;
                String last;
                if (time < 60) {
                    last = time + "M";
                } else if (time < 1440) {
                    last = time / 60 + "H";
                } else {
                    last = time / 60 / 24 + "D";
                }

                Contact contact = new Contact(userID, name, avatar, last, null);
                listContact.add(contact);
            }
            return listContact;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String getChatID(String u1, String u2){
        CallableStatement cs = ConnectDatabase.prepareCall("{CALL getCoupleChatID(?,?)}");
        try {
            cs.setString(1, u1);
            cs.setString(2, u2);
            cs.execute();
            ResultSet rs = cs.getResultSet();
            rs.next();
            return rs.getString(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {

    }
}
