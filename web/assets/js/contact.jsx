let conn = new WebSocket('ws://localhost:8080/contact');
let d;

conn.onmessage = function (e) {
    d = JSON.parse(e.data);
    update();
};
conn.onopen = function (e) {
    conn.send('');
};
setInterval(function () {
    conn.send('connect');
}, 5000);

const userID = $("#task-bar-name").attr("userID");
let set = new Set();
let chatid;
let to;

const CMPeople = (props) => {
    const cc = () => {
        $.ajax({
            type: 'POST',
            url: 'http://localhost:8080/getChatID',
            data: {
                u1: userID,
                u2: props.user.userID
            },
            success: function (data) {
                const chat_region = '<div chatid="' + data + '" userid="' + props.user.userID + '" class="chat_region"></div>';
                const chat_tab = '<div chatid="' + data + '" userid="' + props.user.userID + '" class="chat_tab"><div class="chat_tab_ava"><img src=' + props.user.avatar + ' alt=""></div><div class="chat_tab_name"><p>' + props.user.name + '</p></div></div>';

                if (!set.has(data) && set.size < 3) {
                    chatid = data;
                    to = props.user.userID;

                    set.add(data);
                    $('.chat_region').hide();
                    $('#chat_body').append(chat_region);
                    $('#chat_bar').append(chat_tab);
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

class ListCMPeople extends React.Component {
    constructor(props) {
        super(props);
        this.state = {data: d};
    }

    componentDidMount() {
        this.timerID = setInterval(
            () => this.tick(),
            10000
        );
    }

    componentWillUnmount() {
        clearInterval(this.timerID);
    }

    tick() {
        this.setState({data: d});
    }

    render() {
        return (
            <div>
                {this.state.data.map((user) => <CMPeople user={user}/>)}
            </div>
        )
    }
}

// ========================================
let i = 0;
const update = () => {
    if (i === 0) {
        ReactDOM.render(
            <ListCMPeople/>,
            document.getElementById('contact-main-online')
        );
        i = 1;
    }
};


let con = new WebSocket('ws://localhost:8080/chat');

con.onmessage = function (e) {
    const data = JSON.parse(e.data);

    //Update recent tab
    $("div.contact-main-people[chatid=" + data.chatID + "]").prependTo('#contact-main-recent');
    $("div.contact-main-people[chatid=" + data.chatID + "] div:nth-child(2) p:nth-child(2)").text(data.content);
    $("div.contact-main-people[chatid=" + data.chatID + "] div:nth-child(2) p:nth-child(2)").attr("class", "contact-main-people-message ma b");
    $("div.contact-main-people[chatid=" + data.chatID + "]").find("i").attr("class", "far fa-bell fa-lg ma");
};
con.onopen = function (e) {

};

function sendMessage(chatID, userID, to, content) {
    const data = JSON.stringify({
        chatID: chatID,
        userID: userID,
        to: to,
        content: content
    });
    con.send(data);
    console.log(data);
};

$('#input_chat_send').click(function () {

    const mess = $('#chat_box').val();
    $('#chat_box').val("");
    sendMessage(chatid, userID, to, mess);
});