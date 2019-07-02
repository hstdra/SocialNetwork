package Model.Main;

import Model.ConnectDatabase;
import Model.UTCDate;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedList;

class StoryDB {
    static LinkedList<Story> getAllStories(String sid) {
        LinkedList<Story> list = new LinkedList<>();
        try {
            Date date = UTCDate.getUTCDate();
            PreparedStatement ps = ConnectDatabase.preparedStatement("{CALL getAllStories(?)}");
            assert ps != null;
            ps.setString(1, sid);
            ps.execute();
            ResultSet rs = ps.getResultSet();

            while (rs.next()) {
                String storyID = rs.getString("StoryID");
                String content = rs.getString("Content");
                String userID = rs.getString("UserID");
                String name = rs.getString("Name");
                String avatar = rs.getString("Avatar");
                String image = rs.getString("Image");
                Date lastOnline = rs.getTimestamp("Time");
                long time = 0;
                try {
                    assert date != null;
                    time = (date.getTime() - lastOnline.getTime()) / 60000;
                } catch (Exception exx) {

                }

                list.add(new Story(storyID, content, time, userID, name, avatar, image, ReactStoryDB.getReacts(storyID), CommentDB.getComments(storyID)));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    static String newStory(String uid, String content, String image) {
        PreparedStatement ps = ConnectDatabase.preparedStatement("{CALL newStory(?,?,?)}");
        try {
            assert ps != null;
            ps.setString(1, uid);
            ps.setNString(2, content);
            ps.setNString(3, image);
            ps.execute();

            ResultSet rs = ps.getResultSet();
            rs.next();
            return rs.getString(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(getAllStories("-1").get(1).getImage());
    }
}
