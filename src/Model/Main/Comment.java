package Model.Main;

public class Comment {
    private String commentID;
    private String userID;
    private String name;
    private String content;
    private String avatar;

    public static String newComment(String sid, String uid, String content) {
        return CommentDB.newComment(sid, uid, content);
    }

    public Comment(String commentID, String userID, String name, String content, String avatar) {
        this.commentID = commentID;
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

    public String getCommentID() {
        return commentID;
    }
}
