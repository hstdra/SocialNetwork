package Model.Main;

import Model.ConnectDatabase;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

class CommentDB {
    static LinkedList<Comment> getComments(String sid){
        LinkedList<Comment> comments = new LinkedList<>();
        PreparedStatement ps = ConnectDatabase.preparedStatement("{CALL getComments(?)}");
        assert ps != null;
        try {
            ps.setString(1, sid);
            ps.execute();
            ResultSet rs = ps.getResultSet();
            while (rs.next()){
                String userID = rs.getString("UserID");
                String name = rs.getString("Name");
                String content = rs.getString("Content");
                String avatar = rs.getString("Avatar");

                comments.add(new Comment(userID, name, content, avatar));
            }
            return comments;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    static void newComment(String sid, String uid, String content) {
        PreparedStatement ps = ConnectDatabase.preparedStatement("{CALL newComment(?,?,?)}");
        try {
            assert ps != null;
            ps.setString(1, sid);
            ps.setString(2, uid);
            ps.setNString(3, content);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
