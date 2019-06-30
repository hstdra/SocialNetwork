package Model.Main;

import Model.ConnectDatabase;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.Objects;

class StoryDB {
    static LinkedList<Story> getAllStories() {
        LinkedList<Story> list = new LinkedList<>();
        try {
            PreparedStatement ps = ConnectDatabase.preparedStatement("{CALL getAllStories()}");
            assert ps != null;
            ps.execute();
            ResultSet rs = ps.getResultSet();

            while (rs.next()) {
                String storyID = rs.getString("StoryID");
                String content = rs.getString("Content");
                String userID = rs.getString("UserID");
                String name = rs.getString("Name");
                String avatar = rs.getString("Avatar");

                list.add(new Story(storyID, content, null, userID, name, avatar));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        Objects.requireNonNull(getAllStories()).forEach(story -> System.out.println(story.getContent()));
    }
}
