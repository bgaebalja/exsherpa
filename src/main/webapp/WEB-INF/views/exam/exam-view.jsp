<%@ page import="java.time.LocalDateTime" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:formatDate value="${today}" pattern="yyyyMMdd" var="nowDate"/>

<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-07-11
  Time: 오후 5:42
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온라인 학업성취도 평가
        (<c:choose
        ><c:when test="${schoolLevel eq 'SL01'}">초6_</c:when
        ><c:when test="${schoolLevel eq 'SL02'}">중3_</c:when
        ><c:when test="${schoolLevel eq 'SL03'}">고2_</c:when
        ></c:choose
        ><c:choose
        ><c:when test="${exam.subjectId eq 14}">국어_</c:when
        ><c:when test="${exam.subjectId eq 15}">영어_</c:when
        ><c:when test="${exam.subjectId eq 16}">수학_</c:when
        ><c:when test="${exam.subjectId eq 17}">사회_</c:when
        ><c:when test="${exam.subjectId eq 18}">과학_</c:when
        ></c:choose
        ><c:choose
        ><c:when test="${exam.examRound eq 1}">1회</c:when
        ><c:when test="${exam.examRound eq 2}">2회</c:when
        ></c:choose
        >)</title>
    <link rel="icon" href="/img/fav.png">
    <link rel="stylesheet" href="/css/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="<c:url value="/css/reset.css"><c:param name="ver" value="${nowDate}"/></c:url>"/>
    <link rel="stylesheet" href="<c:url value="/css/paper.css"><c:param name="ver" value="${nowDate}"/></c:url>"/>
    <link rel="stylesheet" href="<c:url value="/css/class.css"><c:param name="ver" value="${nowDate}"/></c:url>"/>
    <script src="/js/swiper-bundle.min.js"></script>
    <!-- <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css"> -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.0.0-alpha1.js"></script> -->
    <script src="<c:url value="/js/line.js"><c:param name="ver" value="${nowDate}"/></c:url>"></script>
    <script src="<c:url value="/js/paper.js"><c:param name="ver" value="${nowDate}"/></c:url>"></script>
    <script type="text/javascript"
            src="<c:url value="/js/itemRenderer/AnswerExtractor.js"><c:param name="ver" value="${nowDate}"/></c:url>"></script>
    <script type="text/javascript"
            src="<c:url value="/js/itemRenderer/AnswerSetting.js"><c:param name="ver" value="${nowDate}"/></c:url>"></script>
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
<div class="wrap <c:choose>
        <c:when test="${exam.examRound eq 0 and exam.schoolLevel eq '0' and exam.subjectId eq 0}">class-math</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 14}">class1-korean</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 15}">class-english</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 16}">class-math</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 17}">class1-social</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 18}">class1-science</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 14}">class2-korean ui-class2-korean</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 15}">class-english ui-class2-english</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 16}">class-math ui-class2-math</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 17}">class-social ui-class2-social</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 18}">class2-science ui-class2-science</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL03' and exam.subjectId eq 14}">class3-korean ui-class3-korean</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL03' and exam.subjectId eq 15}">class3-english ui-class3-english</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL03' and exam.subjectId eq 16}">class-math ui-class3-math</c:when>
        <%-- 초등 2회 --%>
        <c:when test="${exam.year eq '2023' and exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 14}">test04-class1-korean</c:when>
<%--        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 15}">test02-class1-english</c:when>--%>
        <c:when test="${exam.year eq '2023' and exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 15}">test04-class1-english</c:when>
<%--        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 15}">class-english</c:when>--%>
        <c:when test="${exam.year eq '2023' and exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 16}">test04-class1-math</c:when>
        <c:when test="${exam.year eq '2023' and exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 17}">test04-class1-social</c:when>
        <c:when test="${exam.year eq '2023' and exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 18}">test04-class1-science</c:when>
        <%-- 2022 초등 2회 --%>
        <c:when test="${exam.year eq '2022' and exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 14}">test02-class1-korean</c:when>
<%--        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 15}">test02-class1-english</c:when>--%>
        <c:when test="${exam.year eq '2022' and exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 15}">class-english</c:when>
        <c:when test="${exam.year eq '2022' and exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 16}">class-math</c:when>
        <c:when test="${exam.year eq '2022' and exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 17}">test02-class1-social</c:when>
        <c:when test="${exam.year eq '2022' and exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 18}">test02-class1-science</c:when>
        <%-- 중등 2회  국영수사과--%>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 14}">test02-class2-korean ui-test2-class2-korean</c:when>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 15}">test02-class2-english ui-test2-class2-english</c:when>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 16}">class-math ui-test2-class2-math</c:when>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 17}">class-social</c:when>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 18}">class-science ui-test2-class2-science</c:when>
        <%-- 고등 2회 --%>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL03' and exam.subjectId eq 14}">test02-class3-korean</c:when>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL03' and exam.subjectId eq 15}">class-english ui-test2-class3-english</c:when>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL03' and exam.subjectId eq 16}">class-math ui-test2-class3-math</c:when>
        <c:otherwise></c:otherwise>
    </c:choose>">
    <div class="header">
        <div class="logo" style="display: flex; align-items: center;">
            <%--<a href="/"><img src="../../../img/logo.png" alt="logo" style="width: 25%"></a>--%>
            <a href="/" style="width:100%;color: white;"><img src="../../../resources/img/logo2.png"
                                                              alt="logo"
                                                              style="width: 20%; margin-left: 11px"><span
                    style="margin-left: 11px;font-size: 24px;vertical-align: middle;">온라인 학업성취도 평가</span></a>
        </div>
        <div class="top-area">
            <!-- s: 220711 추가 -->
            <div class="btn-wrap">
                <%--                <button type="button" class="pop-btn">메모장</button>--%>
                <%--                <button type="button" class="drawing-btn" id="drawing_btn"></button>--%>
                <button type="button" class="clear-btn">지우기</button>
            </div>
            <!-- e: 220711 추가 -->
            <div class="time-box">
                <span class="txt">남은<br>시간</span>
                <span class="time-txt" id="timer">60:00</span>
            </div>
            <a href="javascript:completeExam('${exam.studentId}');" class="btn-submit">최종제출</a>
        </div>
    </div>
    <div class="container">
        <div class="viewer-omr">
            <div class="swiper-pagination"></div>
        </div>
        <div class="viewer-paper">
            <div class="head">
                <span class="txt">${exam.examName}</span>
                <i class="enterFullscreenBtn">
                    <img src="../../../resources/img/fullscreen_icon-icons.com_71635.png" alt="전체보기">
                </i>
                <div class="btn-wrap">
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </div>

            <input type="hidden" name="currentId" value="">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <c:forEach var="item" items="${itemList}">
                        <div class="swiper-slide" id="item${item.itemId}">
                            <input type="hidden" name="item_id" value="${item.itemId}">
                            <input type="hidden" name="relation_id" value="${item.itemRelation}">
                            <input type="hidden" name="item_type" value="${item.itemType}">
                            <input type="hidden" name="student_answer"
                                   value='${fn:replace(item.studentAnswer,"\\","\\\\")}'/>
                                ${item.itemContents}
                        </div>
                    </c:forEach>
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
    <%--<input type="hidden" value="${item.itemId}" id="itemId">--%>
    <input type="hidden" value="${params.examId}" id="examId" name="examId">
    <input type="hidden" value="${startNumber - 1}" id="start_number">
</body>
<script>

    console.log('${duration}');

    let saveTime =
    ${exam.testTime} *
    60 + ${duration};
    let time =
    ${exam.testTime} *
    60 + ${duration};

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
                body: JSON.stringify({'examResultId': ${exam.examResultId}})
            }).then(response => {
                return response.json();
            }).then(data => {
                if (data.result === true) {
                    alert("시험이 종료되었습니다.");
                    location.href = "/user/exam/report?school_level=${exam.schoolLevel}&exam_round=${exam.examRound}&subject_id=${exam.subjectId}";
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
                    examResultId: ${exam.examResultId},
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
                    body: JSON.stringify({'examResultId': ${exam.examResultId}})
                }).then((response) => response.json())
                    .then((data) => {
                        location.href = '/user/exam/report?school_level=${exam.schoolLevel}&exam_round=${exam.examRound}&subject_id=${exam.subjectId}&year=${exam.year}';
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
                examResultId: ${exam.examResultId},
                itemId: itemId,
                studentId: '${exam.studentId}',
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
