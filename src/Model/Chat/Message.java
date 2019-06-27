package Model.Chat;

public class Message {
    private String messID;
    private String chatID;
    private String userID;
    private String to;
    private String content;
    private String avatar;

    public Message(String messID, String chatID, String userID, String to, String content, String avatar) {
        this.chatID = chatID;
        this.messID = messID;
        this.userID = userID;
        this.to = to;
        this.content = content;
        this.avatar = avatar;
    }

    public Message(String userID, String content, String avatar) {
        this.chatID = null;
        this.messID = null;
        this.userID = userID;
        this.to = null;
        this.content = content;
        this.avatar = avatar;
    }

    public static void insertMessage(String chatID, String userID, String content){
        MessageDB.insertMessage(chatID, userID, content);
    }

    public String getChatID() {
        return chatID;
    }

    public void setChatID(String chatID) {
        this.chatID = chatID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}