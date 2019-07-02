package Model.Main;

import Model.ConnectDatabase;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

class ReactStoryDB {
    static LinkedList<ReactStory> getReacts(String sid) {
        LinkedList<ReactStory> reacts = new LinkedList<>();
        PreparedStatement ps = ConnectDatabase.preparedStatement("{CALL getReactStories(?)}");
        assert ps != null;
        try {
            ps.setString(1, sid);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()) {
                String userID = rs.getString("UserID");
                String name = rs.getString("Name");
                String avatar = rs.getString("Avatar");
                String type = rs.getString("Type");

                reacts.add(new ReactStory(userID, name, avatar, type));
            }
            return reacts;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    static void newReactStory(String sid, String uid, String t) {
        PreparedStatement ps = ConnectDatabase.preparedStatement("{CALL newReactStory(?,?,?)}");
        try {
            assert ps != null;
            ps.setString(1, sid);
            ps.setString(2, uid);
            ps.setString(3, t);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
