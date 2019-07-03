package Model.Main;

import java.util.LinkedList;

public class Story {
    private String storyID;
    private String content;
    private long time;
    private String userID;
    private String name;
    private String avatar;
    private String image;
    private LinkedList<ReactStory> listReact;
    private LinkedList<Comment> comments;

    public static LinkedList<Story> getAllStories(String sid) {
        return StoryDB.getAllStories(sid);
    }

    public static LinkedList<Story> getAllStoriesByUser(String sid, String uid) {
        return StoryDB.getAllStoriesByUser(sid, uid);
    }

    public static String newStory(String uid, String content, String image) {
        return StoryDB.newStory(uid, content, image);
    }

    public Story(String storyID, String content, long time, String userID, String name, String avatar, String image, LinkedList<ReactStory> listReact, LinkedList<Comment> comments) {
        this.storyID = storyID;
        this.content = content;
        this.time = time;
        this.userID = userID;
        this.name = name;
        this.avatar = avatar;
        this.image = image;
        this.listReact = listReact;
        this.comments = comments;
    }

    public String getStoryID() {
        return storyID;
    }

    public String getContent() {
        return content;
    }

    public long getTime() {
        return time;
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

    public LinkedList<ReactStory> getListReact() {
        return listReact;
    }

    public LinkedList<Comment> getComments() {
        return comments;
    }

    public String getImage() {
        return image;
    }
}
