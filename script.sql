create table if not exists ChatGroups
(
    ChatID int(20) auto_increment
        primary key,
    Name   varchar(50) null
);

create table if not exists Users
(
    UserID     int auto_increment
        primary key,
    FirstName  varchar(15) not null,
    LastName   varchar(20) not null,
    Email      char(30)    not null,
    Password   char(30)    not null,
    Dob        date        not null,
    Avatar     text        null,
    LastOnline datetime    null,
    constraint Users_Email_uindex
        unique (Email)
);

create table if not exists ChatMessages
(
    MessID  int(25) auto_increment
        primary key,
    ChatID  int(20)  not null,
    UserID  int(10)  not null,
    Content text     not null,
    Time    datetime not null,
    constraint ChatMessages_ChatGroups_ChatID_fk
        foreign key (ChatID) references ChatGroups (ChatID),
    constraint ChatMessages_Users_UserID_fk
        foreign key (UserID) references Users (UserID)
);

create table if not exists ChatMembers
(
    ChatID   int(20)     not null,
    UserID   int(10)     not null,
    LSMessID int(25)     null,
    Name     varchar(50) not null,
    primary key (ChatID, UserID),
    constraint ChatMembers_ChatGroups_ChatID_fk
        foreign key (ChatID) references ChatGroups (ChatID),
    constraint ChatMembers_ChatMessages_MessID_fk
        foreign key (LSMessID) references ChatMessages (MessID),
    constraint ChatMembers_Users_UserID_fk
        foreign key (UserID) references Users (UserID)
);

create table if not exists Stories
(
    StoryID int(13) auto_increment
        primary key,
    UserID  int(10)  not null,
    Content text     not null,
    Time    datetime not null,
    constraint Stories_Users_UserID_fk
        foreign key (UserID) references Users (UserID)
);

create table if not exists Comments
(
    CommentID int(16) auto_increment
        primary key,
    StoryID   int(13)  not null,
    UserID    int(10)  not null,
    Content   text     not null,
    Time      datetime not null,
    constraint Comments_Stories_StoryID_fk
        foreign key (StoryID) references Stories (StoryID),
    constraint Comments_Users_UserID_fk
        foreign key (UserID) references Users (UserID)
);

create table if not exists ReactComments
(
    RCID      int(20) auto_increment
        primary key,
    CommentID int(16) not null,
    UserID    int(10) not null,
    Type      int(2)  not null,
    constraint ReactComments_Comments_CommentID_fk
        foreign key (CommentID) references Comments (CommentID)
);

create table if not exists ReactStories
(
    RSID    int(18) auto_increment
        primary key,
    StoryID int(13) not null,
    UserID  int(10) not null,
    Type    int(2)  not null,
    constraint ReactStories_Stories_StoryID_fk
        foreign key (StoryID) references Stories (StoryID)
);

create table if not exists Announcements
(
    UserID int(10)  not null,
    AID    int(25)  not null,
    Type   int(2)   not null,
    Time   datetime not null,
    constraint Announcements_Comments_CommentID_fk
        foreign key (AID) references Comments (CommentID),
    constraint Announcements_ReactComments_RCID_fk
        foreign key (AID) references ReactComments (RCID),
    constraint Announcements_ReactStories_RSID_fk
        foreign key (AID) references ReactStories (RSID),
    constraint Announcements_Users_UserID_fk
        foreign key (UserID) references Users (UserID)
);


