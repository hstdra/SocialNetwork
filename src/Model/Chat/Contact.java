package Model.Chat;

import java.util.List;

public class Contact {
    private String userID;
    private String name;
    private String firstName;
    private String avatar;
    private String lastOnline;
    private String lastMessage;

    public static List<Contact> getContact() {
        return ContactDB.getContact();
    }

    public Contact(String userID, String name, String firstName, String ava, String lastOnline, String lastMessage) {
        this.userID = userID;
        this.name = name;
        this.firstName = firstName;
        this.avatar = ava;
        this.lastOnline = lastOnline;
        this.lastMessage = lastMessage;
    }
}
