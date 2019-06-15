const CMPeople = (props) => {

    const online = (props.user.lastOnline === '0M') ?
        <img className="contact-main-people-online"
                        src="https://cdn.clipart.email/33e1f7cb7397d141c79db0c12ad1ac75_filegreen-light-iconsvg-wikimedia-commons_232-232.png"
                        alt=""/> :
        <div className="contact-main-people-offline if">
            <p className="ma">{props.user.lastOnline}</p>
        </div>;


    return (
        <div className="contact-main-people">
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

const ListCMPeople = (props) => {
    return (
        <div>
            {props.data.map((user) => <CMPeople user={user}/>)}
        </div>
    );
};

// ========================================
let update = (list) => {
    ReactDOM.render(
        <ListCMPeople data={list}/>,
        document.getElementById('contact-main-online')
    );
};
let list = "cc";
let conn = new WebSocket('ws://localhost:8080/contact');
conn.onmessage = function (e) {
    let d = JSON.parse(e.data);
    update(d);
};
conn.onopen = function (e) {
    conn.send('');
};
setInterval(function () {
    conn.send('connect');
}, 5000);

