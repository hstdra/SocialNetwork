// Declare host and main variable
const host = $("body").attr("host");
const userID = $("#task-bar-name").attr("userID");
const avatar = $("#task-bar-ava").attr("src");
let set = new Set();
let arr = [];
let chatid;
let to;

// =====================================================================

//React render Contact
let contactSocket = new WebSocket('ws://' + host + '/contact');
let contact;

contactSocket.onmessage = function (e) {
    contact = JSON.parse(e.data);
    ReactDOM.render(
        <ListCMPeople/>,
        document.getElementById('contact-main-online')
    );
};
contactSocket.onopen = function (e) {
    contactSocket.send('');
};

setInterval(function () {
    contactSocket.send('updateRecent');
}, 10000);


class ListCMPeople extends React.Component {
    constructor(props) {
        super(props);
        this.state = {data: contact};
    }

    componentDidMount() {
        this.timerID = setInterval(
            () => this.updateList(),
            10000
        );
    }

    componentWillUnmount() {
        clearInterval(this.timerID);
    }

    updateList() {
        this.setState({data: contact});
    }

    render() {
        return (
            <div>
                {this.state.data.map((user) => user.userID !== userID ? <CMPeople user={user}/> : <div/>)}
            </div>
        )
    }
}

const CMPeople = (props) => {
    const cc = () => {
        $.ajax({
            type: 'POST',
            url: 'http://' + host + '/getChatID',
            data: {
                u1: userID,
                u2: props.user.userID
            },
            success: function (data) {
                loadChatTab(data, props.user.userID, props.user.name, props.user.avatar);
                changeChatTab();
            }
        });
    };

    const online = (props.user.lastOnline === '0M') ?
        <img className="contact-main-people-online"
             src="https://cdn.clipart.email/33e1f7cb7397d141c79db0c12ad1ac75_filegreen-light-iconsvg-wikimedia-commons_232-232.png"
             alt=""/> :
        <div className="contact-main-people-offline if">
            <p className="ma">{props.user.lastOnline}</p>
        </div>;


    return (
        <div userid={props.user.userID} onClick={cc} className="contact-main-people">
            <div className="col-sm-3 if">
                <img className="contact-main-people-img ma" src={props.user.avatar} alt=""/>
                {online}
            </div>
            <div className="col-sm-7 if">
                <p className="contact-main-people-name ma">{props.user.name}</p>
            </div>
            <i className="far fa-comment fa-lg ma"></i>
        </div>
    );
};
//=====================================================================


// For chat
let con = new WebSocket('ws://' + host + '/chat');

con.onmessage = function (e) {
    const data = JSON.parse(e.data);


    const chat_region = $('.chat_region[chatid="' + data.chatID + '"]');

    chat_region.append('                <div class="other_chat">\n' +
        '                    <div class="other_chat_ava">\n' +
        '                        <img class="mid" src="' + data.avatar + '" alt="">\n' +
        '                    </div>\n' +
        '                    <div class="other_chat_mess">\n' +
        '                        <p class="mid">' + data.content + '</p>\n' +
        '                    </div>\n' +
        '                </div>\n');

    //Update recent tab
    $("div.contact-main-people[chatid=" + data.chatID + "]").prependTo('#contact-main-recent');
    $("div.contact-main-people[chatid=" + data.chatID + "] div:nth-child(2) p:nth-child(2)").text(data.content);
    $("div.contact-main-people[chatid=" + data.chatID + "] div:nth-child(2) p:nth-child(2)").attr("class", "contact-main-people-message ma b");
    $("div.contact-main-people[chatid=" + data.chatID + "]").find("i").attr("class", "far fa-bell fa-lg ma");
};
con.onopen = function (e) {

};


// =====================================================================

//Bam nut send
$('#input_chat_send').click(function () {
    const mess = $('#chat_box').val();
    if (mess !== "") {
        $('#chat_box').val("");
        sendMessage(chatid, userID, to, mess, avatar);

        const chat_region = $('.chat_region[chatid="' + chatid + '"]');
        chat_region.append('                <div class="your_chat">\n' +
            '                    <div class="your_chat_mess">\n' +
            '                        <p>' + mess + '</p>\n' +
            '                    </div>\n' +
            '                    <div class="your_chat_ava">\n' +
            '                        <img src="' + avatar + '" alt="">\n' +
            '                    </div>\n' +
            '                </div>');
    }
});

$('.contact-main-people').click(function (e) {
    const ele = $(this);
    const cid = ele.attr("chatid");
    const uid = ele.attr("userid");
    const name = ele.find("p:eq(0)").text();
    const ava = ele.find("img").attr("src");

    loadChatTab(cid, uid, name, ava);
});

// Function for chat

function sendMessage(chatID, userID, to, content, avatar) {
    const data = JSON.stringify({
        chatID: chatID,
        userID: userID,
        to: to,
        content: content,
        avatar: avatar
    });
    con.send(data);

    $.ajax({
        type: 'POST',
        url: 'http://' + host + '/insertMessage',
        data: {
            chatID: chatID,
            userID: userID,
            content: content
        },
        success: function (data) {
        }
    });
}

function loadChat(chatID) {
    $.ajax({
        type: 'POST',
        url: 'http://' + host + '/loadChat',
        data: {
            chatID: chatID,
            messID: -1
        },
        success: function (data) {
            const chat_region = $('.chat_region[chatid="' + chatID + '"]');
            const list = JSON.parse(data);

            list.map(chat => {
                if (chat.userID !== userID) {
                    chat_region.append('                <div class="other_chat">\n' +
                        '                    <div class="other_chat_ava">\n' +
                        '                        <img class="mid" src="' + chat.avatar + '" alt="">\n' +
                        '                    </div>\n' +
                        '                    <div class="other_chat_mess">\n' +
                        '                        <p class="mid">' + chat.content + '</p>\n' +
                        '                    </div>\n' +
                        '                </div>\n')
                } else {
                    chat_region.append('                <div class="your_chat">\n' +
                        '                    <div class="your_chat_mess">\n' +
                        '                        <p>' + chat.content + '</p>\n' +
                        '                    </div>\n' +
                        '                    <div class="your_chat_ava">\n' +
                        '                        <img src="' + chat.avatar + '" alt="">\n' +
                        '                    </div>\n' +
                        '                </div>')
                }
            });
        }
    });

}

function changeChatTab() {
    $(".chat_tab").click(function (e) {
        let chat_tab = $(e.target);
        chat_tab = typeof chat_tab.attr("chatid") === 'undefined' ? $(e.target).parent().parent() : chat_tab;

        chatid = chat_tab.attr("chatid");
        to = chat_tab.attr("userid");

        $('.chat_region').hide();
        $('.chat_region[chatid="' + chatid + '"]').show();
    });
}

function loadChatTab(cid, uid, name, ava) {
    const chat_region = '<div chatid="' + cid + '" userid="' + uid + '" class="chat_region"></div>';
    const chat_tab = '<div chatid="' + cid + '" userid="' + uid + '" class="chat_tab"><div class="chat_tab_ava"><img src=' + ava + ' alt=""></div><div class="chat_tab_name"><p>' + name + '</p></div></div>';

    if (set.has(cid)) {
        chatid = cid;
        to = uid;

        $('.chat_region').hide();
        $('.chat_region[chatid="' + cid + '"]').show();
    } else if (!set.has(cid) && set.size < 3) {
        chatid = cid;
        to = uid;

        set.add(cid);
        arr.push(cid);
        $('.chat_region').hide();
        $('#chat_body').append(chat_region);
        $('#chat_bar').append(chat_tab);
        loadChat(chatid);
    } else {
        chatid = cid;
        to = uid;

        const first = arr.shift();
        set.add(cid);
        set.delete(first);
        arr.push(cid);

        $('.chat_region').hide();
        $('#chat_body').append(chat_region);
        $('#chat_bar').append(chat_tab);
        $('.chat_region[chatid="' + first + '"]').remove();
        $('.chat_tab[chatid="' + first + '"]').remove();
        loadChat(chatid);
    }
}


// ====================