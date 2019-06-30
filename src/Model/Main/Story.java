package Model.Main;

import java.util.Date;
import java.util.LinkedList;

public class Story {
    private String storyID;
    private String content;
    private Date time;
    private String userID;
    private String name;
    private String avatar;

    public static LinkedList<Story> getAllStories() {
        return StoryDB.getAllStories();
    }

    public Story(String storyID, String content, Date time, String userID, String name, String avatar) {
        this.storyID = storyID;
        this.content = content;
        this.time = time;
        this.userID = userID;
        this.name = name;
        this.avatar = avatar;
    }

    public String getStoryID() {
        return storyID;
    }

    public String getContent() {
        return content;
    }

    public Date getTime() {
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

}
