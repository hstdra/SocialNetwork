<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
      integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../assets/css/view.css">
<link rel="stylesheet" type="text/css" href="../assets/css/reactBtns.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="../assets/js/react_effect.js"></script>

<c:forEach items="${requestScope.listAllStories}" var="story">
    <div class="main_container">
        <div class="main_content">
            <div style="display: inline-flex">
                <img class="avatar" src="${story.avatar}"/>
                <p class="user_name">${story.name}</p>
            </div>
            <div class="newFeedTime"> 1 minute ago</div>
            <hr>
            <div>
                <p class="para">
                    ${story.content}
                </p>
            </div>
            <div class="div_for_reactBtn">
                <button class="reaction_Button reactBtn"><span class="react react_font "><i class="fab fa-react"></i></span>
                </button>
                <button class="reaction_Button thumbs-upBtn"><span class="thumbs react_font "><i
                        class="far fa-thumbs-up"></i></span></button>
                <button class="reaction_Button thumbs-downBtn"><span class="thumbs react_font "><i
                        class="far fa-thumbs-down"></i></span></button>
                <button class="reaction_Button heartBtn"><span class="heart react_font "><i class="fas fa-heart"></i></span>
                </button>
                <button class="reaction_Button laughBtn"><span class="face react_font "><i class="far fa-laugh-squint"></i></span>
                </button>
                <button class="reaction_Button cryBtn"><span class="face react_font "><i class="far fa-sad-cry"></i></span>
                </button>
            </div>
            <div class="div_for_users_react thumbs">
                <span class="react_announce">Crush and 11 other had Laugh....</span>
                <div class="react_announce_content react_announce_font ">
                    <div class="child_announce"><span class="face react_font "><i class="far fa-laugh-squint"></i></span>
                        Crush
                    </div>
                    <div class="child_announce"><span class="face react_font "><i class="far fa-laugh-squint"></i></span>
                        Smile
                    </div>
                    <div class="child_announce"><span class="face react_font "><i class="far fa-laugh-squint"></i></span>
                        Porn
                    </div>
                    <div class="child_announce"><span class="face react_font "><i class="far fa-laugh-squint"></i></span>
                        HiuCan
                    </div>
                    <div class="child_announce">And 7 other....</div>
                </div>
            </div>
            <div class="div_for_comment_btn">
                <button class="commentBtn"><span class="thumbs react_font"><i class="far fa-comment-alt"></i></span>
                </button>
            </div>
        </div>
        <div class="cover">
            <div class="react_announce_box">
                <div class="div_for_reactBtns_count">
                    <div class="each_reactBtn_hole">
                        <button class="reactBtns_count"><span class="react reactBtn_count_font "><i
                                class="fab fa-react"></i></span></button>
                        <p class="display_numb background_numb_react">120</p></div>
                    <div class="each_reactBtn_hole">
                        <button class="reactBtns_count"><span class="heart reactBtn_count_font "><i
                                class="fas fa-heart"></i></span></button>
                        <p class="display_numb background_numb_heart">120</p></div>
                    <div class="each_reactBtn_hole">
                        <button class="reactBtns_count"><span class="thumbs reactBtn_count_font "><i
                                class="far fa-thumbs-up"></i></span></button>
                        <p class="display_numb background_numb_thumbs">120</p></div>
                    <div class="each_reactBtn_hole">
                        <button class="reactBtns_count"><span class="thumbs reactBtn_count_font "><i
                                class="far fa-thumbs-down"></i></span></button>
                        <p class="display_numb background_numb_thumbs">120</p></div>
                    <div class="each_reactBtn_hole">
                        <button class="reactBtns_count"><span class="face reactBtn_count_font "><i
                                class="far fa-laugh-squint"></i></span></button>
                        <p class="display_numb background_numb_face">120</p></div>
                    <div class="each_reactBtn_hole">
                        <button class="reactBtns_count"><span class="face reactBtn_count_font "><i
                                class="far fa-sad-cry"></i></span></button>
                        <p class="display_numb background_numb_face">120</p></div>
                </div>
                <div class="div_for_line_color">
                    <div class="moving_line"></div>
                </div>
                <div class="react_announce_detail">
                    <div class="child_announce_detail">
                        <img class="child_announce_detail_img"
                             src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Blue_rose-artificially_coloured.jpg/220px-Blue_rose-artificially_coloured.jpg"
                             alt="">
                        <p>HST</p>
                        <span class="face chile_react_font "><i class="far fa-laugh-squint"></i></span>
                    </div>
                    <div class="child_announce_detail">
                        <img class="child_announce_detail_img"
                             src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Blue_rose-artificially_coloured.jpg/220px-Blue_rose-artificially_coloured.jpg"
                             alt="">
                        <p>HST</p>
                        <span class="face chile_react_font "><i class="far fa-laugh-squint"></i></span>
                    </div>
                    <div class="child_announce_detail">
                        <img class="child_announce_detail_img"
                             src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Blue_rose-artificially_coloured.jpg/220px-Blue_rose-artificially_coloured.jpg"
                             alt="">
                        <p>HST</p>
                        <span class="face chile_react_font "><i class="far fa-laugh-squint"></i></span>
                    </div>
                    <div class="child_announce_detail">
                        <img class="child_announce_detail_img"
                             src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Blue_rose-artificially_coloured.jpg/220px-Blue_rose-artificially_coloured.jpg"
                             alt="">
                        <p>HST</p>
                        <span class="face chile_react_font "><i class="far fa-laugh-squint"></i></span>
                    </div>
                    <div class="child_announce_detail">
                        <img class="child_announce_detail_img"
                             src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Blue_rose-artificially_coloured.jpg/220px-Blue_rose-artificially_coloured.jpg"
                             alt="">
                        <p>HST</p>
                        <span class="face chile_react_font "><i class="far fa-laugh-squint"></i></span>
                    </div>
                    <div class="child_announce_detail">
                        <img class="child_announce_detail_img"
                             src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Blue_rose-artificially_coloured.jpg/220px-Blue_rose-artificially_coloured.jpg"
                             alt="">
                        <p>HST</p>
                        <span class="face chile_react_font "><i class="far fa-laugh-squint"></i></span>
                    </div>
                    <div class="child_announce_detail">
                        <img class="child_announce_detail_img"
                             src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Blue_rose-artificially_coloured.jpg/220px-Blue_rose-artificially_coloured.jpg"
                             alt="">
                        <p>HST</p>
                        <span class="face chile_react_font "><i class="far fa-laugh-squint"></i></span>
                    </div>

                </div>
            </div>
        </div>
    </div>
</c:forEach>
