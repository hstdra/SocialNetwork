package Model.Chat;

import java.util.List;

public class Recent {
    private String chatID;
    private String userID;
    private String lSMessID;
    private String messID;
    private String content;
    private String name;
    private String avatar;
    private String lastOnline;

    public Recent(String chatID, String userID, String lSMessID, String messID, String content, String name, String avatar, String lastOnline) {
        this.chatID = chatID;
        this.userID = userID;
        this.lSMessID = lSMessID;
        this.messID = messID;
        this.content = content;
        this.name = name;
        this.avatar = avatar;
        this.lastOnline = lastOnline;
    }

    public static List<Recent> getListRecent(String userid) {
        return RecentDB.getListRecent(userid);
    }

    public String getChatID() {
        return chatID;
    }

    public String getUserID() {
        return userID;
    }

    public String getlSMessID() {
        return lSMessID;
    }

    public String getContent() {
        return content;
    }

    public String getName() {
        return name;
    }

    public String getAvatar() {
        return avatar;
    }

    public String getLastOnline() {
        return lastOnline;
    }

    public String getMessID() {
        return messID;
    }
}
