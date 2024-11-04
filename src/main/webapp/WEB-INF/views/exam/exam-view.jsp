<%@ page import="java.time.LocalDateTime" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:formatDate value="${today}" pattern="yyyyMMdd" var="nowDate"/>
<%@ page import="bgaebalja.exsherpa.exam.domain.GetExamResponse" %>
<%@ page import="bgaebalja.exsherpa.collection.domain.GetCollectionsResponse" %>
<%@ page import="bgaebalja.exsherpa.util.FormatValidator" %>
<%@ page import="bgaebalja.exsherpa.passage.domain.GetPassagesResponse" %>
<%@ page import="bgaebalja.exsherpa.question.domain.GetQuestionsResponse" %>
<%@ page import="bgaebalja.exsherpa.passage.domain.GetPassageResponse" %>

<%
    GetExamResponse getExamResponse = (GetExamResponse) request.getAttribute("getExamResponse");
%>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EX셀파 테스트</title>
    <link rel="icon" href="/img/fav.png">
    <link rel="stylesheet" href="/css/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/css/reset.css?ver=20241103"/>
    <link rel="stylesheet" href="/css/paper.css?ver=20241103"/>
    <link rel="stylesheet" href="/css/class.css?ver=20241103"/>
    <script src="/js/swiper-bundle.min.js"></script>
    <!-- <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css"> -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.0.0-alpha1.js"></script> -->
    <script src="/js/line.js?ver=20241103"></script>
    <script src="/js/paper.js?ver=20241103"></script>
    <script type="text/javascript" src="/js/itemRenderer/AnswerExtractor.js?ver=20241103"></script>
    <script type="text/javascript" src="/js/itemRenderer/AnswerSetting.js?ver=20241103"></script>
    <script src="https://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
    <script type="text/x-mathjax-config">
        MathJax.Hub.Config({
            jax: ["input/TeX","output/SVG"],
            showProcessingMessages: false,
            tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]},
            ignoreClass: "[a-zA-Z1-9]*",
            processClass:'question',
            messageStyle: "none",
            "SVG": {linebreaks: { automatic: true }},
            TeX: {
                Macros: {
                longdiv: ["{\\overline{\\smash{)}#1}}", 1]
                },
                extensions: ["color.js"],
            },
            "HTML-CSS": {
                linebreaks: { automatic: true }
           },
            "CommonHTML": { linebreaks: { automatic: true } }
        });


    </script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js?config=TeX-MML-AM_CHTML'></script>
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-FQ19XPZ5J7"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }

        gtag('js', new Date());

        gtag('config', 'G-FQ19XPZ5J7');

    </script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-236784786-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }

        gtag('js', new Date());

        gtag('config', 'UA-236784786-1');
    </script>
    </style>
    <style>
        .fa-volume-high::before {
            font-size: 20px;
            margin-right: 5px;
        }

        .send-btn {
            cursor: default;
        }

    </style>
</head>
<body>
<div class="wrap










        class2-science ui-class2-science





























    ">
    <div class="header">
        <div class="logo" style="display: flex; align-items: center;">

            <a href="/" style="width:100%;color: white;"><img src="../../../img/logo2.png" alt="logo"
                                                              style="width: 20%; margin-left: 11px"><span
                    style="margin-left: 11px;font-size: 24px;vertical-align: middle;">온라인 학업성취도 평가</span></a>
        </div>
        <div class="top-area">
            <!-- s: 220711 추가 -->
            <div class="btn-wrap">


                <button type="button" class="clear-btn">지우기</button>
            </div>
            <!-- e: 220711 추가 -->
            <div class="time-box">
                <span class="txt">남은<br>시간</span>
                <span class="time-txt" id="timer">60:00</span>
            </div>
            <a href="javascript:completeExam('010-6369-2379');" class="btn-submit">최종제출</a>
        </div>
    </div>
    <div class="container">
        <div class="viewer-omr">
            <div class="swiper-pagination"></div>
        </div>
        <div class="viewer-paper">
            <div class="head">
                <span class="txt">중3과학(1회)</span>
                <i class="enterFullscreenBtn">
                    <img src="https://enaea.kice.re.kr/js/site/viewer/css/images/fullscreen_icon-icons.com_71635.png"
                         alt="">
                </i>
                <div class="btn-wrap">
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </div>

            <input type="hidden" name="currentId" value="">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">

                    <%
                        int previousIndex = 0;
                        GetCollectionsResponse getCollectionsResponse = getExamResponse.getGetCollectionsResponse();
                        for (int i = 0; i < getCollectionsResponse.size(); i++) {
                            GetPassagesResponse getPassagesResponse
                                    = getCollectionsResponse.get(i).getGetPassagesResponse();
                            GetQuestionsResponse getQuestionsResponse
                                    = getCollectionsResponse.get(i).getGetQuestionsResponse();

                            if (FormatValidator.hasValue(getPassagesResponse)) {
                    %>
                    <div class="swiper-slide" id="item153">
                        <input type="hidden" name="item_id" value="153">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT01">
                        <input type="hidden" name="student_answer"
                               value='{}'/>
                        <div class="page type01">
                            <div class="inner">
                                <div class="question type01">
                                    <div class="left">
                                        <div class="txt">
                                            <%
                                                for (int j = 0; j < getPassagesResponse.size(); j++) {
                                            %>
                                            <img src="<%= getCollectionsResponse.get(i).getGetPassagesResponse().get(j).getUrl()%>">
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                    <div class="right">
                                        <%
                                            for (int j = 0; j < getQuestionsResponse.size(); j++) {
                                        %>
                                        <div class="top">
                                            <span class="num"><%= ++previousIndex %></span>
                                            <span class="txt"><%= getQuestionsResponse.get(j).getContent() %> <i> [5점]</i></span>
                                        </div>
                                        <%
                                            }
                                        %>
                                        <ul class="answer-input-type radio horizontal-type">
                                            <li>
                                                <input type="radio" name="answer_153" id="answer_radio08_1" value="1">
                                                <label for="answer_radio08_1">1</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="answer_153" id="answer_radio08_2" value="2">
                                                <label for="answer_radio08_2">2</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="answer_153" id="answer_radio08_3" value="3">
                                                <label for="answer_radio08_3">3</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="answer_153" id="answer_radio08_4" value="4">
                                                <label for="answer_radio08_4">4</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="answer_153" id="answer_radio08_5" value="5">
                                                <label for="answer_radio08_5">5</label>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>
                    <%
                    } else {
                        for (int j = 0; j < getQuestionsResponse.size(); j++) {
                    %>
                    <div class="swiper-slide" id="item278">
                        <input type="hidden" name="item_id" value="278">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT01">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num"><%= ++previousIndex %></span>
                                        <span class="txt"><%= getQuestionsResponse.get(j).getContent() %> <i> [4점]</i> </span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img01_1.jpg" alt="" class="w60">
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img01_2.jpg" alt="" class="w60">
                                    </div>
                                    <ul class="answer-input-type radio">
                                        <li>
                                            <input type="radio" name="answer_278" id="answer_radio01_1" value="1">
                                            <label for="answer_radio01_1">1</label>
                                            <span class="txt">ㄱ, ㄴ</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_278" id="answer_radio01_2" value="2">
                                            <label for="answer_radio01_2">2</label>
                                            <span class="txt">ㄱ, ㄷ</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_278" id="answer_radio01_3" value="3">
                                            <label for="answer_radio01_3">3</label>
                                            <span class="txt">ㄴ, ㄹ</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_278" id="answer_radio01_4" value="4">
                                            <label for="answer_radio01_4">4</label>
                                            <span class="txt">ㄷ, ㄹ</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_278" id="answer_radio01_5" value="5">
                                            <label for="answer_radio01_5">5</label>
                                            <span class="txt">ㄹ, ㅁ</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>
                    <%
                                }
                            }
                        }
                    %>
                    <div class="swiper-slide" id="item301">
                        <input type="hidden" name="item_id" value="301">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT10">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">서답형5</span>
                                        <span class="txt">그림 (가)와 (나)는 포화 수증기량과 실제 수증기량을 비교한 모식도이며, 각각 겨울철 문과 창문을 모두 닫은 방에 난방기를 켜기 전과 후를 순서에 관계없이 나타낸 것이다. </span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img24.jpg" alt="">
                                    </div>
                                    <div class="answer-textarea-type">
                                        ⑴ (가)와 (나)의 상대 습도를 비교하고, 그 까닭을 서술하시오.
                                        <textarea name="" placeholder="입력" id="" cols="20" rows="5"></textarea>
                                    </div>
                                    <div class="answer-textarea-type">
                                        ⑵ 맑은 날 새벽과 한낮의 모식도는 (가)와 (나) 중 각각 어디에 가까운지 쓰고, 그 까닭을 서술하시오.
                                        <textarea name="" placeholder="입력" id="" cols="20" rows="5"></textarea>
                                    </div>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer"></div>
    <div class="pop-memo">
        <div class="pop-header">
            <span class="txt">Memo</span>
            <button type="button" class="pop-close">
                <span class="hbar"></span>
                <span class="hbar"></span>
            </button>
        </div>
        <div class="pop-cnt">
            <textarea name="" id="" cols="30" rows="10"></textarea>
        </div>
    </div>

    <input type="hidden" value="" id="examId" name="examId">
    <input type="hidden" value="0" id="start_number">
</body>
<script>

    console.log('-339');

    let saveTime =
        45 *
        60 + -339;
    let time =
        45 *
        60 + -339;

    const x = setInterval(function () {
        const min = parseInt(time / 60);
        const sec = parseInt(time % 60);
        document.getElementById('timer').innerText = min + ':' + leadingZeros(sec, 2);
        time--;
        if (time < 0) {
            clearInterval(x);
            fetch('/user/exam/complete-exam', {
                method: 'PUT',
                cache: 'no-cache',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({'examResultId': 5558})
            }).then(response => {
                return response.json();
            }).then(data => {
                if (data.result === true) {
                    alert("시험이 종료되었습니다.");
                    location.href = "/user/exam/report?school_level=SL02&exam_round=1&subject_id=18";
                } else {
                    console.log(data.message);
                }
            });
        }
    }, 1000);

    function testItem(element, itemType) {
        const answerExtractor = new AnswerExtractor({
            el: element,
            itemType: itemType
        });
        return answerExtractor.test();
    }

    function completeExam(studentId) {
        let itemDiv = document.querySelector('.swiper-slide-active > div.page')
        let itemId = document.querySelector('.swiper-slide-active').querySelector('input[name=item_id]').value;
        let itemType = document.querySelector('.swiper-slide-active').querySelector('input[name=item_type]').value;
        let studentAnswer = testItem(itemDiv, itemType);
        document.querySelector('.swiper-slide-active').querySelector('input[name=student_answer]').value = studentAnswer;
        let message = '';
        if (checkCompleteExam() === true) {
            message = '최종 제출하시겠습니까?\n최종 제출하시면, 정답 수정이 불가합니다.'
        } else {
            message = '최종 제출하시겠습니까?\n최종 제출하시면, 정답 수정이 불가합니다.';
        }
        if (confirm(message)) {
            fetch('/user/item/user-item-result', {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    examResultId: 5558,
                    itemId: itemId,
                    studentId: studentId,
                    studentAnswer: studentAnswer,
                    itemProgressTime: saveTime - time
                }),
            }).then(response => {
                return response.json();
            }).then((data) => {
                fetch('/user/exam/complete-exam', {
                    method: 'PUT',
                    cache: 'no-cache',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({'examResultId': 5558})
                }).then((response) => response.json())
                    .then((data) => {
                        location.href = '/user/exam/report?school_level=SL02&exam_round=1&subject_id=18&year=2022';
                    });
            });
        }

    }

    function leadingZeros(n, digits) {
        var zero = '';
        n = n.toString();
        if (n.length < digits) {
            for (var i = 0; i < digits - n.length; i++)
                zero += '0';
        }
        return zero + n;
    }

    function insertItemResult(index, saveTime) {

        let itemDiv = document.querySelector('.swiper-slide-active > div.page')
        let itemId = document.querySelector('.swiper-slide-active').querySelector('input[name=item_id]').value;
        let itemType = document.querySelector('.swiper-slide-active').querySelector('input[name=item_type]').value;
        let studentAnswer = testItem(itemDiv, itemType);
        document.querySelector('.swiper-slide-active').querySelector('input[name=student_answer]').value = studentAnswer;
        fetch('/user/item/user-item-result', {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                examResultId: 5558,
                itemId: itemId,
                studentId: '010-6369-2379',
                studentAnswer: studentAnswer,
                itemProgressTime: saveTime
            }),
        }).then((response) => response.json()
        ).then((data) => {
            console.log(data);
        });
        if (studentAnswer !== "{}" && studentAnswer !== "{\"answer\":[\"\"]}" && studentAnswer !== "선택") {
            $("#swiper" + index).css("background-color", "#255897");
        } else {
            $("#swiper" + index).css("background-color", "#3b434a");
        }
    }

    const audioList = document.querySelectorAll('audio');
    if (audioList.length > 0) {
        // alert("듣기는 한 번만 재생할 수 있으며, 페이지 이동 시 연계 문제가 아닐 경우 듣기가 자동으로 중지됩니다.");
    }
    audioList.forEach((item, index) => {
        item.controlsList.add('noplaybackrate');
        item.addEventListener('play', (ev) => {
            item.currentTime = 0;
            item.style.pointerEvents = "none";
            item.muted = false;
        });
    });

    const videoList = document.querySelectorAll('video');
    videoList.forEach((item, index) => {
        item.controlsList.add('noplaybackrate');
        item.controlsList.add('nodownload');
        item.disablePictureInPicture = true;
    });

    function checkCompleteExam() {
        let result = true;
        const slideList = document.querySelectorAll('input[name=student_answer]');
        for (let item of slideList) {
            if (item.value === '{}' || item.value === '') {
                result = false;
            }
        }
        return result;
    }

    /*
        function doNotAudio() {
            if(koreanAudioEnded === true){
                koreanAudio.pause();
                koreanAudio.style.pointerEvents="none";
            }
        }

        koreanAudio.addEventListener("canplaythrough", () =>{
            alert("듣기는 한 번만 재생할 수 있으며, 페이지 이동 시 연계 문제가 아닐 경우 듣기가 자동으로 중지됩니다.")
        });

        koreanAudio.addEventListener("ended", () =>{
            koreanAudio.pause();
            koreanAudioEnded = true;
            doNotAudio(this);
        });
    */
</script>
</html>