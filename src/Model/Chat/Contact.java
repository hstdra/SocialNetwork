package Model.Chat;

public class Contact {
    private String userID;
    private String name;
    private String avatar;
    private String lastOnline;
    private String lastMessage;

    public Contact(String userID, String name, String ava, String lastOnline, String lastMessage) {
        this.userID = userID;
        this.name = name;
        this.avatar = ava;
        this.lastOnline = lastOnline;
        this.lastMessage = lastMessage;
    }
}
