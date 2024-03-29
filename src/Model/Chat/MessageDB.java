package Model.Chat;

import Model.Library.ConnectDatabase;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

class MessageDB {
    static String checkSeenMessage(String chatID, String uidSeen, String uidHaveMess){
        PreparedStatement ps = ConnectDatabase.preparedStatement("CALL checkSeenMessage(?,?,?)");
        try {
            assert ps != null;
            ps.setString(1, chatID);
            ps.setString(2, uidSeen);
            ps.setString(3, uidHaveMess);
            ps.execute();

            ResultSet rs = ps.getResultSet();
            rs.next();
            return rs.getString(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    static void insertMessage(String chatID, String userID, String content) {
        PreparedStatement ps = ConnectDatabase.preparedStatement("INSERT INTO ChatMessages(ChatID, UserID, Content, Time) VALUES (?,?,?,NOW())");
        try {
            assert ps != null;
            ps.setString(1, chatID);
            ps.setString(2, userID);
            ps.setNString(3, content);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    static LinkedList<Message> loadChat(String chatID, String messID) {
        LinkedList<Message> list = new LinkedList<>();
        CallableStatement cs = ConnectDatabase.prepareCall("{CALL getChatBox(?,?)}");
        try {
            assert cs != null;
            cs.setString(1, chatID);
            cs.setString(2, messID);
            cs.execute();
            ResultSet rs = cs.getResultSet();
            while (rs.next()) {
                String mID = rs.getString("MessID");
                String userID = rs.getString("UserID");
                String content = rs.getString("Content");
                String avatar = rs.getString("Avatar");
                list.add(new Message(mID ,chatID, userID, null, content, avatar));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}