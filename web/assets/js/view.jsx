const host = $("body").attr("host");
const userID = $("#task-bar-name").attr("userID");
const name = $("#task-bar-name").text();
const avatar = $("#task-bar-ava").attr("src");

let uid_view = 0;
let KEY = Math.random().toString();
let xhrPool = [];

const section = $('#main-section');
const view = $('#view');
const ntf = $('#notification-zone-include');

view.attr("key", KEY);
loadMoreStories(-1, KEY);
loadNotification(-1);

//LISTENER FUNCTION
view.scroll(function () {
    const sid = view.attr("sid");
    if (view[0].scrollHeight - view.scrollTop() < view[0].clientHeight + 500 && sid !== "1") {
        view.attr("sid", "1");
        if (uid_view === 0) {
            loadMoreStories(sid, view.attr("key"));
        } else {
            loadMoreStoriesByUser(sid, uid_view, view.attr("key"));
        }
    }
});

ntf.scroll(function () {
    const nid = ntf.attr("nid");
    if (ntf[0].scrollHeight - ntf.scrollTop() < ntf[0].clientHeight + 100 && nid !== "0") {
        view.attr("nid", "0");
        loadNotification(nid);
    }
});

function allListener() {
    updateStoryTime();
    mainReactListener();
    updateCountReacts();
    updateUserReacts();
    addCommentListener();
    addStoryListener();
    userHomePageListener();
}

function addCommentListener() {
    $('.add_commentBtn').click(function () {
        const main_container = $(this).parent().parent();
        const sid = main_container.attr("sid");
        const uid = main_container.attr("uid");
        const input = main_container.find('.field_to_write_comment');

        if (input.val().trim() !== '') {
            addUserCommentToView(sid, userID, null, name, avatar, input.val());
            writeComment(sid, userID, input.val(), uid);

            input.val("");
            input.focus();
        }
    });

    $('.field_to_write_comment').keypress(function (event) {
        const keycode = (event.keyCode ? event.keyCode : event.which);
        if (keycode == '13') {
            $(this).parent().find('.add_commentBtn').click();
        }
    });
}

function addStoryListener() {
    $('#post_button').click(function () {
        const input = $('#status_content');
        const img = $('#story_img').attr("src");
        if (input.val().trim() !== '' || typeof img !== 'undefined') {
            addUserStoryToView(userID, name, avatar, img, input.val());
            input.val("");
        }
    });
}

function seenNotificationListener() {
    $('.notification-child').click(function () {
        const nid = $(this).attr("nid");
        $(this).removeClass('nseen').addClass('seen');
        seenNotification(nid);
    });

    $('#notification-zone-mark').click(function () {
        $('.notification-child').each(function () {
            const nid = $(this).attr("nid");
            $(this).removeClass('nseen').addClass('seen');
            seenNotification(nid);
        });
    });

}

function mainReactListener() {
    $('.div_for_users_react').click(function () {
        const container = $(this).parent().parent();
        container.find(".cover").fadeIn();
    });


    /*For React Buttons*/
    const reactClass = ["react", "fab", "fa-react"];
    const heartClass = ["heart", "fas", "fa-heart"]; //1
    const upClass = ["thumbs", "far", "fa-thumbs-up"]; //2
    const downClass = ["thumbs", "far", "fa-thumbs-down"]; //3
    const lolClass = ["face", "far", "fa-laugh-squint"]; //4
    const cryClass = ["face", "far", "fa-sad-cry"]; //5
    const font = "react_font";

    $(document).ready(function () {
        $(".reactBtn").mouseenter(function () {
            $(this).parent().find(".heartBtn").fadeIn();
            $(this).parent().find(".thumbs-upBtn").fadeIn();
            $(this).parent().find(".thumbs-downBtn").fadeIn();
            $(this).parent().find(".laughBtn").fadeIn();
            $(this).parent().find(".cryBtn").fadeIn();
        });
        $(".reactBtn").mouseleave(function () {
            $(this).parent().find(".heartBtn").fadeOut(2000);
            $(this).parent().find(".thumbs-upBtn").fadeOut(2000);
            $(this).parent().find(".thumbs-downBtn").fadeOut(2000);
            $(this).parent().find(".laughBtn").fadeOut(2000);
            $(this).parent().find(".cryBtn").fadeOut(2000);
        });
        $(".heartBtn").click(function () {
            writeReactStory($(this).parent().parent().parent().attr("sid"), userID, 1);
            addUserReactToView($(this).parent().parent().parent().attr("sid"), userID, name, avatar, 1);
            writeNotification(2, userID, $(this).parent().parent().parent().attr("sid"), 0, 1, $(this).parent().parent().parent().attr("uid"));

            $(this).parent().find(".reactBtn span")
                .removeClass()
                .addClass(font)
                .addClass(heartClass[0]);
            $(this).parent().find(".reactBtn span i")
                .removeClass()
                .addClass(heartClass[1])
                .addClass(heartClass[2]);
        });
        $(".thumbs-upBtn").click(function () {
            writeReactStory($(this).parent().parent().parent().attr("sid"), userID, 2);
            addUserReactToView($(this).parent().parent().parent().attr("sid"), userID, name, avatar, 2);
            writeNotification(2, userID, $(this).parent().parent().parent().attr("sid"), 0, 2, $(this).parent().parent().parent().attr("uid"));

            $(this).parent().find(".reactBtn span")
                .removeClass()
                .addClass(font)
                .addClass(upClass[0]);
            $(this).parent().find(".reactBtn span i")
                .removeClass()
                .addClass(upClass[1])
                .addClass(upClass[2]);
        });
        $(".thumbs-downBtn").click(function () {
            writeReactStory($(this).parent().parent().parent().attr("sid"), userID, 3);
            addUserReactToView($(this).parent().parent().parent().attr("sid"), userID, name, avatar, 3);
            writeNotification(2, userID, $(this).parent().parent().parent().attr("sid"), 0, 3, $(this).parent().parent().parent().attr("uid"));

            $(this).parent().find(".reactBtn span")
                .removeClass()
                .addClass(font)
                .addClass(downClass[0]);
            $(this).parent().find(".reactBtn span i")
                .removeClass()
                .addClass(downClass[1])
                .addClass(downClass[2]);
        });
        $(".laughBtn").click(function () {
            writeReactStory($(this).parent().parent().parent().attr("sid"), userID, 4);
            addUserReactToView($(this).parent().parent().parent().attr("sid"), userID, name, avatar, 4);
            writeNotification(2, userID, $(this).parent().parent().parent().attr("sid"), 0, 4, $(this).parent().parent().parent().attr("uid"));


            $(this).parent().find(".reactBtn span")
                .removeClass()
                .addClass(font)
                .addClass(lolClass[0]);
            $(this).parent().find(".reactBtn span i")
                .removeClass()
                .addClass(lolClass[1])
                .addClass(lolClass[2]);
        });
        $(".cryBtn").click(function () {
            writeReactStory($(this).parent().parent().parent().attr("sid"), userID, 5);
            addUserReactToView($(this).parent().parent().parent().attr("sid"), userID, name, avatar, 5);
            writeNotification(2, userID, $(this).parent().parent().parent().attr("sid"), 0, 5, $(this).parent().parent().parent().attr("uid"));

            $(this).parent().find(".reactBtn span")
                .removeClass()
                .addClass(font)
                .addClass(cryClass[0]);
            $(this).parent().find(".reactBtn span i")
                .removeClass()
                .addClass(cryClass[1])
                .addClass(cryClass[2]);
        });
        $(".reactBtn").click(function () {
            writeReactStory($(this).parent().parent().parent().attr("sid"), userID, 0);
            addUserReactToView($(this).parent().parent().parent().attr("sid"), userID, name, avatar, 0);


            $(this).parent().find(".reactBtn span")
                .removeClass()
                .addClass(font)
                .addClass(reactClass[0]);
            $(this).parent().find(".reactBtn span i")
                .removeClass()
                .addClass(reactClass[1])
                .addClass(reactClass[2]);
        });
    });


    let current = 0;
    let previous = 0;
    let result;

    $('.cover').on("click", function (e) {
        if ($(e.target).closest(".react_announce_box").length) {

        } else {
            $('.cover').fadeOut();
            $("button.reactBtns_count span.react").click();
        }
    });
    $("button.reactBtns_count span.heart").click(function () {
        previous = current;
        current = 1;
        result = 16.67 * (current - previous);
        $(".div_for_line_color .moving_line")
            .animate({'left': '+=' + result + '%'})
            .css({'background-color': '#ff133d'});

        $('.child_announce_detail').hide();
        $('.child_announce_detail[type="1"]').show();
    });
    $("button.reactBtns_count span.thumbs i.fa-thumbs-up").click(function () {
        previous = current;
        current = 2;
        result = 16.67 * (current - previous);
        $(".div_for_line_color .moving_line")
            .animate({'left': '+=' + result + '%'})
            .css({'background-color': '#3176ff'});

        $('.child_announce_detail').hide();
        $('.child_announce_detail[type="2"]').show();
    });
    $("button.reactBtns_count span.thumbs i.fa-thumbs-down").click(function () {
        previous = current;
        current = 3;
        result = 16.67 * (current - previous);
        $(".div_for_line_color .moving_line")
            .animate({'left': '+=' + result + '%'})
            .css({'background-color': '#3176ff'});

        $('.child_announce_detail').hide();
        $('.child_announce_detail[type="3"]').show();
    });
    $("button.reactBtns_count span.face i.fa-laugh-squint").click(function () {
        previous = current;
        current = 4;
        result = 16.67 * (current - previous);
        $(".div_for_line_color .moving_line")
            .animate({'left': '+=' + result + '%'})
            .css({'background-color': '#d8b019'});

        $('.child_announce_detail').hide();
        $('.child_announce_detail[type="4"]').show();
    });
    $("button.reactBtns_count span.face i.fa-sad-cry").click(function () {
        previous = current;
        current = 5;
        result = 16.67 * (current - previous);
        $(".div_for_line_color .moving_line")
            .animate({'left': '+=' + result + '%'})
            .css({'background-color': '#d8b019'});

        $('.child_announce_detail').hide();
        $('.child_announce_detail[type="5"]').show();
    });
    $("button.reactBtns_count span.react").click(function () {
        previous = current;
        current = 0;
        result = 16.67 * (current - previous);
        $(".div_for_line_color .moving_line")
            .animate({'left': '+=' + result + '%'})
            .css({'background-color': 'forestgreen'});

        $('.child_announce_detail').show();
    });
}

function uploadListener() {
    $('#story_img_button').click(function () {
        uploadImage();
    });
    $('#story_img').attr("src", null);
}

function userHomePageListener() {
    $('.story_user_infor').click(function () {
        uid_view = $(this).parent().parent().attr("uid");
        KEY = Math.random().toString();
        view.attr("key", KEY);
        loadMoreStoriesByUser(-1, uid_view, KEY);
    });
    $('.username_in_comment').click(function () {
        uid_view = $(this).parent().parent().attr("uid");
        KEY = Math.random().toString();
        view.attr("key", KEY);
        loadMoreStoriesByUser(-1, uid_view, KEY);
    });
    $('.ava_in_comment').click(function () {
        uid_view = $(this).parent().parent().attr("uid");
        KEY = Math.random().toString();
        view.attr("key", KEY);
        loadMoreStoriesByUser(-1, uid_view, KEY);
    });
    $('.child_announce_detail').click(function () {
        uid_view = $(this).attr("uid");
        KEY = Math.random().toString();
        view.attr("key", KEY);
        loadMoreStoriesByUser(-1, uid_view, KEY);
    });

}

//////////////////////////////////////////

//MAIN FUNCTION
function loadMoreStories(sid, key) {
    $.ajax({
        type: 'POST',
        url: 'http://' + host + '/getAllStories',
        data: {
            StoryID: sid
        },
        beforeSend: function (jqXHR, settings) {
            xhrPool.push(jqXHR);
            if (sid === -1) {
                view.html("");
            }
        },
        success: function (data) {
            if (sid === -1) {
                view.html("");
            }
            if (key === view.attr("key")) {
                view.append(data);
            }
            view.attr("sid", $(".main_container").last().attr("sid"));
            $(".cover").hide();

            allListener();

            if (sid === -1) {
                uploadListener();
            }
        }
    });
}

function loadMoreStoriesByUser(sid, uid, key) {
    $.ajax({
        type: 'POST',
        url: 'http://' + host + '/getAllStoriesByUser',
        data: {
            StoryID: sid,
            UserID: uid
        },
        beforeSend: function (jqXHR, settings) {
            xhrPool.push(jqXHR);
            if (sid === -1) {
                view.html("");
            }
        },
        success: function (data) {
            if (sid === -1) {
                view.html("");
            }
            if (key === view.attr("key")) {
                view.append(data);
            }
            view.attr("sid", $(".main_container").last().attr("sid"));
            $(".cover").hide();

            allListener();

            if (sid === -1) {
                uploadListener();
            }
        }
    });
}

function loadNotification(id) {
    $.ajax({
        type: 'POST',
        url: 'http://' + host + '/getNotifications',
        data: {
            ID: id,
            UserID: userID,
        }, success: function (data) {
            const notifications = JSON.parse(data);
            notifications.forEach(n => {
                ntf.append(notification(n.NID, n.type, n.userID, n.name, n.avatar, n.storyID, n.commentID, n.reactType, n.seen));
            });
            ntf.attr("nid", notifications.length > 0 ? notifications[0].NID : 0);
            updateCountNotification();
            seenNotificationListener();
        }
    });
}

function updateStoryTime() {
    $(".newFeedTime").each(function () {
        let time = parseInt($(this).attr("time"));
        if (time < 60) {
            time = time + " phút trước";
        } else if (time < 1440) {
            time = ~~(time / 60) + " giờ trước";
        } else {
            time = ~~(time / 60 / 24) + " ngày trước";
        }
        $(this).text(time);
    })
}

function updateCountReacts() {
    $('.main_container').each(function () {
        const numb = $(this).find('.display_numb');
        numb.eq(0).text($(this).find('.child_announce_detail').length);
        numb.eq(1).text($(this).find('.child_announce_detail[type="1"]').length);
        numb.eq(2).text($(this).find('.child_announce_detail[type="2"]').length);
        numb.eq(3).text($(this).find('.child_announce_detail[type="3"]').length);
        numb.eq(4).text($(this).find('.child_announce_detail[type="4"]').length);
        numb.eq(5).text($(this).find('.child_announce_detail[type="5"]').length);

        $(this).find(".react_announce").text($(this).find('.child_announce_detail').length + ' người đã bày tỏ cảm xúc');
    })
}

function updateUserReacts() {
    const heartClass = ["heart", "fas", "fa-heart"]; //1
    const upClass = ["thumbs", "far", "fa-thumbs-up"]; //2
    const downClass = ["thumbs", "far", "fa-thumbs-down"]; //3
    const lolClass = ["face", "far", "fa-laugh-squint"]; //4
    const cryClass = ["face", "far", "fa-sad-cry"]; //5
    const font = "react_font";

    $('.react-story-display').each(function () {
        const div = $(this).parent().find(".div_for_reactBtn");
        switch ($(this).attr("type")) {
            case "1":
                div.find(".reactBtn span")
                    .removeClass()
                    .addClass(font)
                    .addClass(heartClass[0]);
                div.find(".reactBtn span i")
                    .removeClass()
                    .addClass(heartClass[1])
                    .addClass(heartClass[2]);
                break;
            case "2":
                div.find(".reactBtn span")
                    .removeClass()
                    .addClass(font)
                    .addClass(upClass[0]);
                div.find(".reactBtn span i")
                    .removeClass()
                    .addClass(upClass[1])
                    .addClass(upClass[2]);
                break;
            case "3":
                div.find(".reactBtn span")
                    .removeClass()
                    .addClass(font)
                    .addClass(downClass[0]);
                div.find(".reactBtn span i")
                    .removeClass()
                    .addClass(downClass[1])
                    .addClass(downClass[2]);
                break;
            case "4":
                div.find(".reactBtn span")
                    .removeClass()
                    .addClass(font)
                    .addClass(lolClass[0]);
                div.find(".reactBtn span i")
                    .removeClass()
                    .addClass(lolClass[1])
                    .addClass(lolClass[2]);
                break;
            case "5":
                div.find(".reactBtn span")
                    .removeClass()
                    .addClass(font)
                    .addClass(cryClass[0]);
                div.find(".reactBtn span i")
                    .removeClass()
                    .addClass(cryClass[1])
                    .addClass(cryClass[2]);
                break;
        }
    })
}

////////////////////////////////////////////////////////////


//MICRO SERVICES FUNCTION
function addUserReactToView(sid, uid, nm, ava, t) {
    const main_container = view.find('.main_container[sid="' + sid + '"]');
    const container = main_container.find('.react_announce_detail');
    container.find('.child_announce_detail[uid="' + uid + '"]').remove();

    if (t !== 0) {
        let icon;
        switch (t) {
            case 1:
                icon = '<span class="heart reactBtn_count_font list-react-icon"><i class="fas fa-heart"></i></span>';
                break;
            case 2:
                icon = '<span class="thumbs reactBtn_count_font list-react-icon"><i class="far fa-thumbs-up"></i></span>';
                break;
            case 3:
                icon = '<span class="thumbs reactBtn_count_font list-react-icon"><i class="far fa-thumbs-down"></i></span>';
                break;
            case 4:
                icon = '<span class="face chile_react_font list-react-icon"><i class="far fa-laugh-squint"></i></span>';
                break;
            case 5:
                icon = '<span class="face chile_react_font list-react-icon"><i class="far fa-sad-cry"></i></span>';
                break;
        }

        const child = '<div uid="' + uid + '" type="' + t + '" class="child_announce_detail">\n' +
            '        <img class="child_announce_detail_img"\n' +
            '             src="' + ava + '"\n' +
            '             alt="">\n' +
            '            <p class="child_announce_detail_name">' + nm + '</p>\n' +
            icon +
            '    </div>';

        container.append(child);
    }

    updateCountReacts();
    userHomePageListener();
}

function addUserCommentToView(sid, uid, cid, nm, ava, ct) {
    const main_container = view.find('.main_container[sid="' + sid + '"]');

    const comment = `<div uid="${uid}" cid="${cid}" class="each_comment">
                    <div><img class="ava_in_comment" src="${ava}"></div>
                    <div class="comment_field">
                        <span class="username_in_comment">${nm}</span>
                            ${ct}
                    </div>
                </div>`;

    main_container.find('.display_comment').append(comment);
}

function addUserStoryToView(uid, nm, ava, img, ct) {
    $.ajax({
        type: 'POST',
        url: 'http://' + host + '/newStory',
        data: {
            UserID: uid,
            Content: ct,
            Image: img
        }, success: function (sid) {
            const post_container = $('.main_container').eq(0);
            let image = '';
            let content = ct.trim() === '' ? '' : `<div><p class="para">${ct}</p></div>`;
            if (typeof img !== 'undefined') {
                image = `<div class="square" style="width: 518px;">
                    <img src="${img}" style="width: 100%;">
                </div>`;
            }
            const story = `<div sid="${sid}" class="main_container">
                <div class="main_content">
                    <div style="display: inline-flex">
                        <img class="avatar" src="${ava}">
                        <p class="user_name">${nm}</p>
                    </div>
                    <div class="newFeedTime" time="0">0 phút trước</div>
                    <hr style="border-top: 1px solid #929292;">
                    ${content}
                    ${image}
                    <hr style="margin: 0; border-top: 1px solid #929292; margin-top: 16px;">            <div class="div_for_reactBtn">
                        <button class="reaction_Button reactBtn">
                            <span class="react react_font "><i class="fab fa-react"></i></span>
                        </button>
                        <button class="reaction_Button thumbs-upBtn"><span class="thumbs react_font "><i class="far fa-thumbs-up"></i></span></button>
                        <button class="reaction_Button thumbs-downBtn"><span class="thumbs react_font "><i class="far fa-thumbs-down"></i></span></button>
                        <button class="reaction_Button heartBtn"><span class="heart react_font "><i class="fas fa-heart"></i></span>
                        </button>
                        <button class="reaction_Button laughBtn"><span class="face react_font "><i class="far fa-laugh-squint"></i></span>
                        </button>
                        <button class="reaction_Button cryBtn"><span class="face react_font "><i class="far fa-sad-cry"></i></span>
                        </button>
                    </div>
                    <div class="div_for_users_react thumbs">
                        <span class="react_announce"></span>
                    </div>
                    <div class="div_for_comment_btn">
                        <button class="commentBtn"><span class="thumbs react_font"><i class="far fa-comment-alt"></i></span>
                        </button>
                    </div>
                    <hr style="margin: 0; border-top: 1px solid #929292;">
                </div>
                <div class="display_comment">
                </div>
                <div class="div_to_comment">
                    <div><img class="ava_in_comment" src="https://upload.wikimedia.org/wikipedia/commons/b/ba/St_Philip%27s_Marsh_-_GWR_43002_Sir_Kenneth_Grange.JPG"></div>
                    <input type="text" class="field_to_write_comment comment_field" placeholder="Nhập bình luận của bạn...">
                    <button class="add_commentBtn"><span class="thumbs react_font"><i class="far fa-edit"></i></span></button>
                </div>
                <div class="cover" style="display: none;">
                    <div class="react_announce_box">
                        <div class="div_for_reactBtns_count">
                            <div class="each_reactBtn_hole">
                                <button class="reactBtns_count"><span class="react reactBtn_count_font "><i class="fab fa-react"></i></span></button>
                                <p class="display_numb background_numb_react"></p></div>
                            <div class="each_reactBtn_hole">
                                <button class="reactBtns_count"><span class="heart reactBtn_count_font "><i class="fas fa-heart"></i></span></button>
                                <p class="display_numb background_numb_heart"></p></div>
                            <div class="each_reactBtn_hole">
                                <button class="reactBtns_count"><span class="thumbs reactBtn_count_font "><i class="far fa-thumbs-up"></i></span></button>
                                <p class="display_numb background_numb_thumbs"></p></div>
                            <div class="each_reactBtn_hole">
                                <button class="reactBtns_count"><span class="thumbs reactBtn_count_font "><i class="far fa-thumbs-down"></i></span></button>
                                <p class="display_numb background_numb_thumbs"></p></div>
                            <div class="each_reactBtn_hole">
                                <button class="reactBtns_count"><span class="face reactBtn_count_font "><i class="far fa-laugh-squint"></i></span></button>
                                <p class="display_numb background_numb_face"></p></div>
                            <div class="each_reactBtn_hole">
                                <button class="reactBtns_count"><span class="face reactBtn_count_font "><i class="far fa-sad-cry"></i></span></button>
                                <p class="display_numb background_numb_face"></p></div>
                        </div>
                        <div class="div_for_line_color">
                            <div class="moving_line"></div>
                        </div>
                        <div class="react_announce_detail">
                        </div>
                    </div>
                </div>
            </div>`;

            $('#story_img').attr("src", null);
            $('#div_story_img').hide();

            view.prepend(story);
            post_container.prependTo("#view");
            mainReactListener();
            updateCountReacts();
            addCommentListener();
        }
    });
}

function notification(nid, type, userID, name, avatar, storyID, commentID, reactType, seen) {
    let icon;
    switch (type) {
        case '1':
            icon = `<i class="fa fa-comment-alt"></i>`;
            break;
        case '2':
            switch (reactType) {
                case '1':
                    icon = `<i class="fa fa-heart heart"></i>`;
                    break;
                case '2':
                    icon = `<i class="fa fa-thumbs-up thumbs"></i>`;
                    break;
                case '3':
                    icon = `<i class="fa fa-thumbs-down thumbs"></i>`;
                    break;
                case '4':
                    icon = `<i class="fa fa-laugh-squint face"></i>`;
                    break;
                case '5':
                    icon = `<i class="fa fa-sad-cry face"></i>`;
                    break;

            }
    }

    return `    <div type="${type}" nid="${nid}" sid="${storyID}" cid="${commentID}" class="notification-child ${seen === '1' ? 'seen' : 'nseen'}">
                                <div class="nt-avatar">
                                    <img src="${avatar}" alt="">
                                </div>
                                <div class="nt-content">
                                    <p><b>${name}</b> ${type === '1' ? 'đã bình luận vào bài viết của bạn' : 'đã bày tỏ cảm xúc về bài viết của bạn'}</p>
                                </div>
                                <div class="nt-icon">
                                    ${icon}
                                </div>
                             </div>`;
}

function updateCountNotification() {
    const x = $('.nseen').length;
    $('#count-notification').text(x);
    if (x > 0) $('#count-notification').show(); else $('#count-notification').hide();
}

////////////////////////////////////////////////////////////

//CALL DATABASE FUNCTION
function writeReactStory(sid, uid, t) {
    $.ajax({
        type: 'POST',
        url: 'http://' + host + '/newReactStory',
        data: {
            StoryID: sid,
            UserID: uid,
            Type: t
        }
    });
}

function writeComment(sid, uid, ct, toUserID) {
    $.ajax({
        type: 'POST',
        url: 'http://' + host + '/newComment',
        data: {
            StoryID: sid,
            UserID: uid,
            Content: ct
        }, success: function (cid) {
            view.find('.main_container[sid="' + sid + '"]').find('.each_comment[cid="null"]').attr("cid", cid);
            writeNotification(1, userID, sid, cid, 0, toUserID);
        }
    });
}

function writeNotification(t, uid, sid, cid, rt, toUserID) {
    $.ajax({
        type: 'POST',
        url: 'http://' + host + '/newNotification',
        data: {
            Type: t,
            UserID: uid,
            StoryID: sid,
            CommentID: cid,
            ReactType: rt
        }, success: function (nid) {
            sendNotificationSK(nid, 1, sid, cid, 0, toUserID);
        }
    });
}

function seenNotification(nid) {
    $.ajax({
        type: 'POST',
        url: 'http://' + host + '/seenNotification',
        data: {
            NID: nid,
        }
    });
    updateCountNotification();
}

/////////////////////////////////////////////////


//IMAGE FUNCTION
function uploadImage() {
    $('#file-input').trigger('click');
    $('#file-input').change(function () {
        let data = new FormData();

        $.each($('#file-input')[0].files, function (i, file) {
            data.append('file-' + i, file);
        });

        $.ajax({
            url: 'http://localhost:8080/uploadImage',
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            success: function (data) {
                $('#story_img').attr("src", data);
                $('#div_story_img').show();
            }
        });
    });
}

//////////////////////////

$('#main-task-bar-info').click(function () {
    $.each(xhrPool, function (idx, jqXHR) {
        jqXHR.abort();
    });

    uid_view = 0;
    KEY = Math.random().toString();
    view.attr("key", KEY);
    loadMoreStories(-1, KEY);
});

$('#homepage').click(function () {
    $.each(xhrPool, function (idx, jqXHR) {
        jqXHR.abort();
    });

    uid_view = userID;
    KEY = Math.random().toString();
    view.attr("key", KEY);
    loadMoreStoriesByUser(-1, uid_view, KEY);
});


setInterval(function () {
    userHomePageListener();
}, 2000);


// Notification Socket
const notificationSocket = new WebSocket('ws://' + host + '/notification');

notificationSocket.onmessage = function (e) {
    const data = JSON.parse(e.data);
    const n = data.notification;
    const nt = notification(n.NID, n.type, n.userID, n.name, n.avatar, n.storyID, n.commentID, n.reactType, n.seen);
    $('#notification-zone-include').prepend(nt);
    updateCountNotification();
};

notificationSocket.onopen = function (e) {
};

function sendNotificationSK(nid, t, sid, cid, rt, toUserID) {
    const data = JSON.stringify({
        notification: {
            NID: nid,
            type: t,
            userID: userID,
            name: name,
            avatar: avatar,
            storyID: sid,
            commentID: cid,
            reactType: rt,
            seen: 0
        },
        to: toUserID
    });
    notificationSocket.send(data);
}

/////////////////////////////////////////////////////

