package Model.Main;

import java.util.LinkedList;

public class Notification {
    private String NID;
    private String type;
    private String userID;
    private String name;
    private String avatar;
    private String storyID;
    private String commentID;
    private String reactType;
    private String seen;

    public static String newNotification(String type, String uid, String sid, String cid, String rt) {
        return NotificationDB.newNotification(type, uid, sid, cid, rt);
    }

    public static LinkedList<Notification> getNotifications(String nid, String uid) {
        return NotificationDB.getNotifications(nid, uid);
    }

    public static void seenNotification(String nid){
        NotificationDB.seenNotification(nid);
    }

    public Notification(String NID, String type, String userID, String name, String avatar, String storyID, String commentID, String reactType, String seen) {
        this.NID = NID;
        this.type = type;
        this.userID = userID;
        this.name = name;
        this.avatar = avatar;
        this.storyID = storyID;
        this.commentID = commentID;
        this.reactType = reactType;
        this.seen = seen;
    }

    public String getNID() {
        return NID;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public String getUserID() {
        return userID;
    }

    public String getAvatar() {
        return avatar;
    }

    public String getStoryID() {
        return storyID;
    }

    public String getCommentID() {
        return commentID;
    }

    public String getReactType() {
        return reactType;
    }

    public String getSeen() {
        return seen;
    }
}
