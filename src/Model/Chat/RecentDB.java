package Model.Chat;

import Model.ConnectDatabase;
import Model.UTCDate;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class RecentDB {
    private static List<Recent> listRecent = new LinkedList<>();

    public synchronized static List<Recent> getListRecent(String userid) {
        listRecent.clear();
        CallableStatement cs = ConnectDatabase.prepareCall("{CALL getContactRecent(?)}");
        try {
            cs.setString(1, userid);
            cs.execute();
            ResultSet rs = cs.getResultSet();
            while (rs.next()) {
                String chatID = rs.getString("ChatID");
                String userID = rs.getString("UserID");
                String lSMessID = rs.getString("LSMessID");
                String messID = rs.getString("MessID");
                String content = rs.getString("Content");
                String name = rs.getString("Name");
                String avatar = rs.getString("Avatar");
                Date lastOnline = rs.getTimestamp("LastOnline");

                long time = (UTCDate.getUTCDate().getTime() - lastOnline.getTime()) / 60000;
                String last;
                if (time < 60) {
                    last = time + "M";
                } else if (time < 1440) {
                    last = time / 60 + "H";
                } else {
                    last = time / 60 / 24 + "D";
                }


                Recent recent = new Recent(chatID, userID, lSMessID, messID, content, name, avatar, last);
                listRecent.add(recent);
            }
            return listRecent;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
