package Model.Main;

public class ReactStory {
    private String userID;
    private String name;
    private String avatar;
    private String type;

    public static void newReactStory(String sid, String uid, String t){
        ReactStoryDB.newReactStory(sid, uid, t);
    }

    public ReactStory(String userID, String name, String avatar, String type) {
        this.userID = userID;
        this.name = name;
        this.avatar = avatar;
        this.type = type;
    }

    public String getUserID() {
        return userID;
    }

    public String getName() {
        return name;
    }

    public String getAvatar() {
        return avatar;
    }

    public String getType() {
        return type;
    }
}
