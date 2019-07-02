package Model.Main;

public class Comment {
    private String userID;
    private String name;
    private String content;
    private String avatar;

    public static void newComment(String sid, String uid, String content) {
        CommentDB.newComment(sid, uid, content);
    }

    public Comment(String userID, String name, String content, String avatar) {
        this.userID = userID;
        this.name = name;
        this.content = content;
        this.avatar = avatar;
    }

    public String getUserID() {
        return userID;
    }

    public String getName() {
        return name;
    }

    public String getContent() {
        return content;
    }

    public String getAvatar() {
        return avatar;
    }
}
