// Declare host and main variable
const host = $("body").attr("host");
const userID = $("#task-bar-name").attr("userID");
const avatar = $("#task-bar-ava").attr("src");
const audio = new Audio('../assets/audio/new_mess.mp3');
const promise = audio.play();
if (promise) {
    //Older browsers may not return a promise, according to the MDN website
    promise.catch(function (error) {
        console.error(error);
    });
}

let set = new Set();
let arr = [];
let chatid = "0";
let to;

// =====================================================================

//React render Contact
const contactSocket = new WebSocket('ws://' + host + '/contact');
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
}, 20000);

class ListCMPeople extends React.Component {
    constructor(props) {
        super(props);
        this.state = {data: contact};
    }

    componentDidMount() {
        this.timerID = setInterval(
            () => this.updateList(),
            20000
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
    const openTab = () => {
        $.ajax({
            type: 'POST',
            url: 'http://' + host + '/getChatID',
            data: {
                u1: userID,
                u2: props.user.userID
            },
            success: function (data) {
                if (data === 'null') {
                    $.ajax({
                        type: 'POST',
                        url: 'http://' + host + '/newChat',
                        data: {
                            u1: userID,
                            u2: props.user.userID
                        },
                        success: function (d) {
                            loadChatTab(d, props.user.userID, props.user.firstName, props.user.avatar);

                            $('.chat_tab[chatid="undefined"]').dblclick();

                            // loadChatTab(d, props.user.userID, props.user.firstName, props.user.avatar);
                            // changeChatTab();

                            $(".chat_tab[chatid=" + d + "]").click();
                            newRecentTab(d, props.user.userID, props.user.firstName, props.user.avatar);
                        }
                    });
                } else {
                    $('.chat_tab[chatid="undefined"]').dblclick();
                    loadChatTab(data, props.user.userID, props.user.firstName, props.user.avatar);
                    $(".chat_tab[chatid=" + data + "]").click();
                }
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
        <div userid={props.user.userID} firstname={props.user.firstName} onClick={openTab}
             className="contact-main-people">
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


// For couple chat
const coupleSocket = new WebSocket('ws://' + host + '/chat');

coupleSocket.onmessage = function (e) {
    const data = JSON.parse(e.data);
    const chat_region = $('.chat_region[chatid="' + data.chatID + '"]');
    const chat_tab = $('.contact-main-people[chatid="' + data.chatID + '"]');

    if (chat_tab.length === 0) {
        newRecentTab(data.chatID, data.userID, $('.contact-main-people[userid="' + data.userID + '"]').attr("firstname"), data.avatar);
    }


    chat_region.append('                <div class="other_chat">\n' +
        '                    <div class="other_chat_ava">\n' +
        '                        <img class="mid" src="' + data.avatar + '" alt="">\n' +
        '                    </div>\n' +
        '                    <div class="other_chat_mess">\n' +
        '                        <p class="mid">' + data.content + '</p>\n' +
        '                    </div>\n' +
        '                </div>\n');
    $('#chat_body').scrollTop(9999999);

    //Update recent tab
    $("div.contact-main-people[chatid=" + data.chatID + "]").prependTo('#contact-main-recent');
    $("div.contact-main-people[chatid=" + data.chatID + "] div:nth-child(2) p:nth-child(2)").text(data.content.length > 25 ? data.content.substring(0, 21) + '...' : data.content);
    $("div.contact-main-people[chatid=" + data.chatID + "] div:nth-child(2) p:nth-child(2)").attr("class", "contact-main-people-message ma b");
    $("div.contact-main-people[chatid=" + data.chatID + "] div:nth-child(2) p:nth-child(2)").css("font-weight", "bolder");
    $("div.contact-main-people[chatid=" + data.chatID + "]").find("i").attr("class", "far fa-bell fa-lg ma");

    //Update some addition
    updateCountRecent();
    audio.play();
};
coupleSocket.onopen = function (e) {
};


// =====================================================================

// For all chat
const allSocket = new WebSocket('ws://' + host + '/chatAll');

allSocket.onmessage = function (e) {
    const data = JSON.parse(e.data);
    const chat_region = $('.chat_region[chatid="0"]');

    chat_region.append('                <div class="other_chat">\n' +
        '                    <div class="other_chat_ava">\n' +
        '                        <img class="mid" src="' + data.avatar + '" alt="">\n' +
        '                    </div>\n' +
        '                    <div class="other_chat_mess">\n' +
        '                        <p class="mid">' + data.content + '</p>\n' +
        '                    </div>\n' +
        '                </div>\n');
    $('#chat_body').scrollTop(9999999);
};
allSocket.onopen = function (e) {
};


// =====================================================================

//Ham auto
let typing = 0;
$('#chat_box').on('input', function (e) {
    if (typing === 0) {
        updateLSMessage();
    }
    if ($('#chat_box').val() !== "") {
        typing = 1;
    } else {
        typing = 0;
    }
});

$('#input_chat_send').click(function () {
    const content = $('#chat_box').val();
    if (content !== "") {
        $('#chat_box').val("");
        if (chatid === "0") {
            sendAllMessage(userID, content, avatar);
        } else {
            sendMessage(chatid, userID, to, content, avatar);
        }
    }
    $('#chat_body').scrollTop(9999999);
    typing = 0;
});

$('#chat_box').keypress(function (event) {
    const keycode = (event.keyCode ? event.keyCode : event.which);
    if (keycode == '13') {
        $('#input_chat_send').click();
    }
});

$('#chat_body').scroll(function () {
    const pos = $('#chat_body').scrollTop();
    if (pos < 100) {
        const chat_region = $('.chat_region[chatid="' + chatid + '"]');
        const messid = chat_region.attr("lmess");
        if (messid !== '0') {
            chat_region.attr("lmess", "0");
            loadChat(chatid, messid);
            $('#chat_body').scrollTop(200);
        }
    }
});

// Function for chat

function recentTabOnClick() {
    $('.contact-main-people').click(function (e) {
        const ele = $(this);
        const cid = ele.attr("chatid");
        const uid = ele.attr("userid");
        const name = ele.find("p:eq(0)").text();
        const ava = ele.find("img").attr("src");

        loadChatTab(cid, uid, name, ava);
    });
}

function sendAllMessage(userID, content, avatar) {
    const data = JSON.stringify({
        messID: null,
        chatID: null,
        userID: userID,
        to: null,
        content: content,
        avatar: avatar
    });
    allSocket.send(data);

    //Update view
    const chat_region = $('.chat_region[chatid="' + chatid + '"]');
    chat_region.append('                <div class="your_chat">\n' +
        '                    <div class="your_chat_mess">\n' +
        '                        <p>' + content + '</p>\n' +
        '                    </div>\n' +
        '                    <div class="your_chat_ava">\n' +
        '                        <img src="' + avatar + '" alt="">\n' +
        '                    </div>\n' +
        '                </div>');
}

function sendMessage(chatID, userID, to, content, avatar) {
    const data = JSON.stringify({
        messID: null,
        chatID: chatID,
        userID: userID,
        to: to,
        content: content,
        avatar: avatar
    });
    coupleSocket.send(data);

    //Update recent tab
    $("div.contact-main-people[chatid=" + chatID + "]").prependTo('#contact-main-recent');
    $("div.contact-main-people[chatid=" + chatID + "] div:nth-child(2) p:nth-child(2)").text(content.length > 25 ? content.substring(0, 21) + '...' : content);
    $("div.contact-main-people[chatid=" + chatID + "] div:nth-child(2) p:nth-child(2)").attr("class", "contact-main-people-message ma");
    $("div.contact-main-people[chatid=" + chatID + "] div:nth-child(2) p:nth-child(2)").css("font-weight", "500");
    $("div.contact-main-people[chatid=" + chatID + "]").find("i").attr("class", "far fa-comment fa-lg ma");

    //Update view
    const chat_region = $('.chat_region[chatid="' + chatid + '"]');
    chat_region.append('                <div class="your_chat">\n' +
        '                    <div class="your_chat_mess">\n' +
        '                        <p>' + content + '</p>\n' +
        '                    </div>\n' +
        '                    <div class="your_chat_ava">\n' +
        '                        <img src="' + avatar + '" alt="">\n' +
        '                    </div>\n' +
        '                </div>');

    //Write database
    $.ajax({
        type: 'POST',
        url: 'http://' + host + '/insertMessage',
        data: {
            chatID: chatID,
            userID: userID,
            content: content
        },
        success: function (data) {
            updateLSMessage();
        }
    });
}

function loadChat(chatID, messID) {
    $.ajax({
        type: 'POST',
        url: 'http://' + host + '/loadChat',
        data: {
            chatID: chatID,
            messID: messID
        },
        success: function (data) {
            const chat_region = $('.chat_region[chatid="' + chatID + '"]');
            const list = JSON.parse(data);
            const lmess = list.length === 0 ? 0 : list[list.length - 1].messID;
            chat_region.attr("lmess", lmess);

            list.map(chat => {
                if (chat.userID !== userID) {
                    chat_region.prepend('                <div class="other_chat">\n' +
                        '                    <div class="other_chat_ava">\n' +
                        '                        <img class="mid" src="' + chat.avatar + '" alt="">\n' +
                        '                    </div>\n' +
                        '                    <div class="other_chat_mess">\n' +
                        '                        <p class="mid">' + chat.content + '</p>\n' +
                        '                    </div>\n' +
                        '                </div>\n')
                } else {
                    chat_region.prepend('                <div class="your_chat">\n' +
                        '                    <div class="your_chat_mess">\n' +
                        '                        <p>' + chat.content + '</p>\n' +
                        '                    </div>\n' +
                        '                    <div class="your_chat_ava">\n' +
                        '                        <img src="' + chat.avatar + '" alt="">\n' +
                        '                    </div>\n' +
                        '                </div>')
                }
            });
            if (messID === -1) {
                $('#chat_body').scrollTop(1000);
            }
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
        setActiveTab(chatid);
        $('#chat_body').scrollTop(9999999);
        $('#chat_box').val("");
    });
}

function loadChatTab(cid, uid, name, ava) {
    const chat_region = '<div chatid="' + cid + '" userid="' + uid + '" class="chat_region"></div>';
    const chat_tab = '<div chatid="' + cid + '" userid="' + uid + '" class="chat_tab"><div class="chat_tab_ava"><img src="' + ava + '" alt=""></div><div class="chat_tab_name"><p>' + name + '</p></div></div>';

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
        loadChat(chatid, -1);
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
        loadChat(chatid, -1);
    }
    setActiveTab(chatid);
    changeChatTab();
    removeChat();
}

function removeChat() {
    $(".chat_tab").dblclick(function (e) {
        const cid = $(this).attr("chatid");
        if (cid !== '0') {
            $('.chat_region[chatid="' + cid + '"]').remove();
            $(this).remove();
            set.delete(cid);
            arr = jQuery.grep(arr, function (value) {
                return value != cid;
            });
            const x = arr.length > 0 ? arr[arr.length - 1] : 0;
            $('.chat_tab[chatid="' + x + '"]').click();
        }
    });
}

function setActiveTab(cid) {
    $('.chat_tab').css("background-color", "#cdcdcd");
    $('.chat_tab[chatid="' + cid + '"]').css("background-color", "#ececec");
    // updateLSMessage();
}

function newRecentTab(chatid, userid, firstname, avatar) {
    const tab = '<div class="contact-main-people" chatid="' + chatid + '" userid="' + userid + '">\n' +
        '                        <div class="col-sm-3 if">\n' +
        '                            <img class="contact-main-people-img ma" src="' + avatar + '" alt="">\n' +
        '                        </div>\n' +
        '                        <div class="col-sm-7">\n' +
        '                            <p class="contact-main-people-name1 ma">' + firstname + '</p>\n' +
        '                            \n' +
        '                            \n' +
        '                                <p class="contact-main-people-message ma"></p>\n' +
        '                            \n' +
        '                        </div>\n' +
        '                        \n' +
        '                        \n' +
        '                            <i class="far fa-comment fa-lg ma"></i>\n' +
        '                        \n' +
        '                    </div>'
    $('#contact-main-recent').prepend(tab);
    recentTabOnClick();
}

function updateCountRecent() {
    const x = $('.contact-main-people-message.ma.b').length;
    $('#count-recent').text(x);
    if (x > 0) $('#count-recent').show(); else $('#count-recent').hide();
}

function updateCountContact() {
    const x = $('.contact-main-people-online').length;
    $('#count-online').text(x);
    if (x > 0) $('#count-online').show(); else $('#count-online').hide();
}

function updateLSMessage() {
    $("div.contact-main-people[chatid=" + chatid + "] div:nth-child(2) p:nth-child(2)").attr("class", "contact-main-people-message ma");
    $("div.contact-main-people[chatid=" + chatid + "] div:nth-child(2) p:nth-child(2)").css("font-weight", "500");
    $("div.contact-main-people[chatid=" + chatid + "]").find("i").attr("class", "far fa-comment fa-lg ma");
    $.ajax({
        type: 'POST',
        url: 'http://' + host + '/updateLSMessage',
        data: {
            chatID: chatid,
            userID: userID,
        }
    });
    updateCountRecent();
}

function updateMainUserOnline() {
    $.ajax({
        type: 'POST',
        url: 'http://' + host + '/updateOnline',
        data: {
            userID: userID,
        }
    });
}

// ====================
setActiveTab(0);
$('#chat_body').scrollTop(9999999);

recentTabOnClick();
updateCountRecent();
updateCountContact();

setInterval(function () {
    updateMainUserOnline();
    updateCountContact();
}, 20000);