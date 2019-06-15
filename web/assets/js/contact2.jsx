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

class ListCMPeople extends React.Component {
    constructor(props) {
        super(props);
        this.state = {data: d};
    }

    componentDidMount() {
        this.timerID = setInterval(
            () => this.tick(),
            5000
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
    console.log(data);
};
con.onopen = function (e) {

};
setInterval(function () {
    const data = JSON.stringify({
        from: '1',
        to: '4',
        content: 'cc'
    });
    con.send(data);
}, 3000);
