package Model.Main;

import Model.Library.ConnectDatabase;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

class NotificationDB {
    static LinkedList<Notification> getNotifications(String nid, String uid) {
        LinkedList<Notification> list = new LinkedList<>();
        try {
            PreparedStatement ps = ConnectDatabase.preparedStatement("{CALL getNotifications(?,?)}");
            assert ps != null;
            ps.setString(1, nid);
            ps.setString(2, uid);
            ps.execute();
            ResultSet rs = ps.getResultSet();

            while (rs.next()) {
                String id = rs.getString("NID");
                String type = rs.getString("Type");
                String userID = rs.getString("UserID");
                String name = rs.getString("Name");
                String avatar = rs.getString("Avatar");
                String storyID = rs.getString("StoryID");
                String commentID = rs.getString("CommentID");
                String reactType = rs.getString("ReactType");
                String seen = rs.getString("Seen");

                list.add(new Notification(id, type, userID, name, avatar, storyID, commentID, reactType, seen));

            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    static String newNotification(String type, String uid, String sid, String cid, String rt) {
        PreparedStatement ps = ConnectDatabase.preparedStatement("{CALL newNotification(?,?,?,?,?)}");
        try {
            assert ps != null;
            ps.setString(1, type);
            ps.setString(2, uid);
            ps.setString(3, sid);
            ps.setString(4, cid);
            ps.setString(5, rt);
            ps.execute();

            ResultSet rs = ps.getResultSet();
            rs.next();
            return rs.getString(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    static void seenNotification(String nid) {
        PreparedStatement ps = ConnectDatabase.preparedStatement("{CALL seenNotification(?)}");
        try {
            assert ps != null;
            ps.setString(1, nid);

            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
