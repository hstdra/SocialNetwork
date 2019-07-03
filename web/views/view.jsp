<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:if test="${not empty requestScope.input}">
    <div class="main_container">
        <div class="main_content">
            <div style="display: inline-flex">
                <img class="avatar" src="${sessionScope.user.avatar}"/>
                <p class="user_name">${sessionScope.user.getFullName()}</p>
            </div>
            <div id="w_status">
                <textarea id="status_content" placeholder="Cập nhật trạng thái của bạn?"></textarea>
            </div>
            <div id="div_story_img" style="width: 518px; display: none">
                <img id="story_img" src=""
                     style="width: 100%;">
            </div>
            <div id="status_button">
                <button type="button" class="but" id="story_img_button">
                    <span class="addPic"><i class="fas fa-images"></i></span></button>
                <button type="button" class="but" id="post_button">
                    <span class="post"><i class="fas fa-paper-plane"></i></span></button>
            </div>
        </div>
    </div>
</c:if>

<c:forEach items="${requestScope.listAllStories}" var="story">
    <div sid="${story.storyID}" uid="${story.userID}" class="main_container">
        <c:forEach items="${story.listReact}" var="react">
            <c:if test="${react.userID == sessionScope.user.userID}">
                <div class="react-story-display" type="${react.type}"></div>
            </c:if>
        </c:forEach>
        <div class="main_content">
            <div class="story_user_infor" style="display: inline-flex; cursor: pointer">
                <img class="avatar" src="${story.avatar}"/>
                <p class="user_name">${story.name}</p>
            </div>
            <div class="newFeedTime" time="${story.time}"></div>
            <hr style="border-top: 1px solid #929292;">

            <c:if test="${not empty story.content}">
                <div>
                    <p class="para">
                            ${story.content}
                    </p>
                </div>
            </c:if>
            <c:if test="${not empty story.image}">
                <div class="square" style="width: 518px;">
                    <img src="${story.image}"
                         style="width: 100%;">
                </div>
            </c:if>
            <hr style="margin: 0; border-top: 1px solid #929292; margin-top: 16px;">
            <div class="div_for_reactBtn">
                <button class="reaction_Button reactBtn">
                    <span class="react react_font "><i class="fab fa-react"></i></span>
                </button>
                <button class="reaction_Button thumbs-upBtn"><span class="thumbs react_font "><i
                        class="far fa-thumbs-up"></i></span></button>
                <button class="reaction_Button thumbs-downBtn"><span class="thumbs react_font "><i
                        class="far fa-thumbs-down"></i></span></button>
                <button class="reaction_Button heartBtn"><span class="heart react_font "><i
                        class="fas fa-heart"></i></span>
                </button>
                <button class="reaction_Button laughBtn"><span class="face react_font "><i
                        class="far fa-laugh-squint"></i></span>
                </button>
                <button class="reaction_Button cryBtn"><span class="face react_font "><i
                        class="far fa-sad-cry"></i></span>
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
                <%--            <div class="div_for_more_comment">--%>
                <%--                <span class="react_announce more_comment">Nhấn để xem thêm...</span>--%>
                <%--            </div>--%>
            <c:forEach items="${story.comments}" var="comment">
                <div uid="${comment.userID}" class="each_comment">
                    <div><img class="ava_in_comment" src="${comment.avatar}"></div>
                    <div class="comment_field">
                        <span class="username_in_comment"> ${comment.name}</span>
                            ${comment.content}
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="div_to_comment">
            <div><img class="ava_in_comment" src="${sessionScope.user.avatar}"></div>
            <input type="text" class="field_to_write_comment comment_field" placeholder="Nhập bình luận của bạn...">
            <button class="add_commentBtn"><span class="thumbs react_font"><i class="far fa-edit"></i></span></button>
        </div>

        <div class="cover">
            <div class="react_announce_box">
                <div class="div_for_reactBtns_count">
                    <div class="each_reactBtn_hole">
                        <button class="reactBtns_count"><span class="react reactBtn_count_font "><i
                                class="fab fa-react"></i></span></button>
                        <p class="display_numb background_numb_react"></p></div>
                    <div class="each_reactBtn_hole">
                        <button class="reactBtns_count"><span class="heart reactBtn_count_font "><i
                                class="fas fa-heart"></i></span></button>
                        <p class="display_numb background_numb_heart"></p></div>
                    <div class="each_reactBtn_hole">
                        <button class="reactBtns_count"><span class="thumbs reactBtn_count_font "><i
                                class="far fa-thumbs-up"></i></span></button>
                        <p class="display_numb background_numb_thumbs"></p></div>
                    <div class="each_reactBtn_hole">
                        <button class="reactBtns_count"><span class="thumbs reactBtn_count_font "><i
                                class="far fa-thumbs-down"></i></span></button>
                        <p class="display_numb background_numb_thumbs"></p></div>
                    <div class="each_reactBtn_hole">
                        <button class="reactBtns_count"><span class="face reactBtn_count_font "><i
                                class="far fa-laugh-squint"></i></span></button>
                        <p class="display_numb background_numb_face"></p></div>
                    <div class="each_reactBtn_hole">
                        <button class="reactBtns_count"><span class="face reactBtn_count_font "><i
                                class="far fa-sad-cry"></i></span></button>
                        <p class="display_numb background_numb_face"></p></div>
                </div>
                <div class="div_for_line_color">
                    <div class="moving_line"></div>
                </div>
                <div class="react_announce_detail">
                    <c:forEach items="${story.listReact}" var="react">
                        <div uid="${react.userID}" type="${react.type}" class="child_announce_detail">
                            <img class="child_announce_detail_img"
                                 src="${react.avatar}"
                                 alt="">
                            <p class="child_announce_detail_name">${react.name}</p>
                            <c:set var="type" value="${react.type}"/>
                            <c:choose>
                                <c:when test='${type.equals("1")}'>
                                    <span class="heart reactBtn_count_font list-react-icon"><i class="fas fa-heart"></i></span>
                                </c:when>
                                <c:when test='${type.equals("2")}'>
                                    <span class="thumbs reactBtn_count_font list-react-icon"><i
                                            class="far fa-thumbs-up"></i></span>
                                </c:when>
                                <c:when test='${type.equals("3")}'>
                                    <span class="thumbs reactBtn_count_font list-react-icon"><i
                                            class="far fa-thumbs-down"></i></span>
                                </c:when>
                                <c:when test='${type.equals("4")}'>
                                    <span class="face chile_react_font list-react-icon"><i
                                            class="far fa-laugh-squint"></i></span>
                                </c:when>
                                <c:when test='${type.equals("5")}'>
                                    <span class="face chile_react_font list-react-icon"><i
                                            class="fa-sad-cry"></i></span>
                                </c:when>
                            </c:choose>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
