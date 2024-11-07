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
<%@ page import="bgaebalja.exsherpa.option.domain.GetOptionsResponse" %>

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
    <style>
        .passage {
            line-height: 1.5;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="wrap










        class2-science ui-class2-science





























    ">
    <div class="header">
        <div class="logo" style="display: flex; align-items: center;">

            <a href="/" style="width:100%;color: white;"><span
                    style="margin-left: 11px;font-size: 24px;vertical-align: middle;">B셀파 실전 모의고사</span></a>
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
            <%--            TODO: 로그인 이메일 연동--%>
            <a href="javascript:completeExam('tane9537@nate.com');" class="btn-submit">최종제출</a>
        </div>
    </div>
    <div class="container">
        <div class="viewer-omr">
            <div class="swiper-pagination"></div>
        </div>
        <div class="viewer-paper">
            <div class="head">
                <span class="txt"><%= getExamResponse.getExamName() + "(" + getExamResponse.getSubjectName() + ")" %></span>
                <i class="enterFullscreenBtn">
                </i>
                <div class="btn-wrap">
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </div>

            <input type="hidden" name="exam_id"
                   value="<%= getExamResponse.getId() %>">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <%
                        int previousIndex = 0;
                        int subjectiveNumber = 0;
                        GetCollectionsResponse getCollectionsResponse = getExamResponse.getGetCollectionsResponse();
                        for (int i = 0; i < getCollectionsResponse.size(); i++) {
                            GetPassagesResponse getPassagesResponse
                                    = getCollectionsResponse.get(i).getGetPassagesResponse();
                            GetQuestionsResponse getQuestionsResponse
                                    = getCollectionsResponse.get(i).getGetQuestionsResponse();

                            if (FormatValidator.hasValue(getPassagesResponse)) {
                                int startIndex = previousIndex + 1;
                                int endIndex = startIndex + getQuestionsResponse.size() - 1;
                                for (int j = 0; j < getQuestionsResponse.size(); j++) {
                                    ++previousIndex;
                    %>
                    <div class="swiper-slide" id="item<%= getQuestionsResponse.get(j).getId() %>"
                         data-question-id="<%= getQuestionsResponse.get(j).getId() %>">
                        <input type="hidden" name="question_id" value="<%= getQuestionsResponse.get(j).getId() %>">
                        <input type="hidden" name="original_answer"
                               value="<%= getQuestionsResponse.get(j).getAnswer() %>">
                        <div class="page type01">
                            <div class="inner">
                                <div class="question type01">
                                    <div class="left">
                                        <div class="passage">
                                            <span>문제 <%= startIndex %> <%= getQuestionsResponse.size() > 1 ? " ~ " + endIndex : ""%></span>
                                            <%
                                                for (int k = 0; k < getPassagesResponse.size(); k++) {
                                            %>
                                            <img src="<%= getCollectionsResponse.get(i).getGetPassagesResponse().get(k).getUrl()%>">
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                    <div class="right">
                                        <div class="top">
                                            <span class="num"><%= previousIndex %></span>
                                            <span class="txt"><%= getQuestionsResponse.get(j).getContent() %> <i> [5점]</i></span>
                                        </div>
                                        <%
                                            if (getQuestionsResponse.get(j).isSubjective()) {
                                        %>
                                        <div class="subjective-answer">
                                            <input type="text" class="input_question_text_box"
                                                   name="subjective_answer_<%= getQuestionsResponse.get(j).getId() %>"
                                                   placeholder="답변을 입력하세요" style="width: 100%; margin-top: 10px;">
                                        </div>
                                        <%
                                        } else {
                                            GetOptionsResponse getOptionsResponse
                                                    = getQuestionsResponse.get(j).getGetOptionsResponse();
                                            for (int l = 0; l < getOptionsResponse.size(); l++) {
                                        %>
                                        <ul class="answer-input-type radio">
                                            <li>
                                                <input type="radio"
                                                       name="answer_<%= getQuestionsResponse.get(j).getId() %>"
                                                       id="answer_radio0<%= getOptionsResponse.get(l).getOptionNo() %>_<%= previousIndex %>"
                                                       value="<%= previousIndex %>">
                                                <label for="answer_radio0<%= getOptionsResponse.get(l).getOptionNo() %>_<%= previousIndex %>"><%= getOptionsResponse.get(l).getOptionNo() %>
                                                </label>
                                                <%= getOptionsResponse.get(l).getHtml() %>
                                            </li>
                                        </ul>
                                        <%
                                                }
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                        for (int j = 0; j < getQuestionsResponse.size(); j++) {
                            if (getQuestionsResponse.get(j).isSubjective()) {
                    %>
                    <div class="swiper-slide" id="item<%= getQuestionsResponse.get(j).getId() %>"
                         data-question-id="<%= getQuestionsResponse.get(j).getId() %>">
                        <input type="hidden" name="question_id" value="<%= getQuestionsResponse.get(j).getId() %>">
                        <input type="hidden" name="original_answer"
                               value="<%= getQuestionsResponse.get(j).getAnswer() %>">
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num"><%= ++previousIndex %></span>
                                        <%= getQuestionsResponse.get(j).getContent() %>
                                    </div>
                                    <div class="subjective-answer">
                                        <input type="text" class="input_question_text_box"
                                               name="subjective_answer_<%= getQuestionsResponse.get(j).getId() %>"
                                               placeholder="답변을 입력하세요" style="width: 100%; margin-top: 10px;">
                                    </div>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="swiper-slide" id="item<%= getQuestionsResponse.get(j).getId() %>"
                         data-question-id="<%= getQuestionsResponse.get(j).getId() %>">
                        <input type="hidden" name="question_id" value="<%= getQuestionsResponse.get(j).getId() %>">
                        <input type="hidden" name="original_answer"
                               value="<%= getQuestionsResponse.get(j).getAnswer() %>">
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num"><%= ++previousIndex %></span>
                                        <span class="txt"><%= getQuestionsResponse.get(j).getContent() %> <i> [4점]</i> </span>
                                    </div>
                                    <%
                                        GetOptionsResponse getOptionsResponse = getQuestionsResponse.get(j).getGetOptionsResponse();
                                        for (int k = 0; k < getOptionsResponse.size(); k++) {
                                    %>
                                    <ul class="answer-input-type radio">
                                        <li>
                                            <input type="radio" name="answer_<%= getQuestionsResponse.get(j).getId() %>"
                                                   id="answer_radio0<%= getOptionsResponse.get(k).getOptionNo() %>_<%= previousIndex %>"
                                                   value="<%= previousIndex %>">
                                            <label for="answer_radio0<%= getOptionsResponse.get(k).getOptionNo() %>_<%= previousIndex %>"><%= getOptionsResponse.get(k).getOptionNo() %>
                                            </label>
                                            <%= getOptionsResponse.get(k).getHtml() %>
                                        </li>
                                    </ul>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>
                    <%
                                    }
                                }
                            }
                        }
                    %>
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

    function extractAnswers() {
        const answers = [];
        const questionSlides = document.querySelectorAll('.swiper-slide');

        questionSlides.forEach((slide) => {
            const questionId = slide.dataset.questionId;
            const questionNumber = slide.querySelector('.num') ? slide.querySelector('.num').textContent.trim() : null;
            const isSubjective = slide.querySelector('input.input_question_text_box') !== null;
            let submittedAnswer;

            if (isSubjective) {
                const textAnswer = slide.querySelector('input.input_question_text_box');
                submittedAnswer = textAnswer && textAnswer.value.trim().length > 0 ? textAnswer.value.trim() : "미응답";
            } else {
                const selectedOption = slide.querySelector('input[type="radio"]:checked');
                submittedAnswer = selectedOption ? selectedOption.nextElementSibling.textContent.trim() : "미응답";
            }

            const originalAnswer = slide.querySelector('input[name="original_answer"]').value;

            answers.push({
                questionId: questionId,
                questionNumber: questionNumber,
                isSubjective: isSubjective,
                submittedAnswer: submittedAnswer,
                originalAnswer: originalAnswer
            });
        });

        answers.forEach(answer => {
            console.log(`문제 ${answer.questionNumber}: ${JSON.stringify(answer, null, 2)}`);
        });
        return answers;
    }

    function testItem(element, itemType) {
        const answerExtractor = new AnswerExtractor({
            el: element,
            itemType: itemType
        });
        return answerExtractor.test();
    }

    function completeExam(email) {
        const examId = document.querySelector('input[name="exam_id"]').value;
        const extractedAnswers = extractAnswers();

        let message = '최종 제출하시겠습니까?\n최종 제출하시면, 정답 수정이 불가합니다.';
        if (confirm(message)) {
            fetch('/user/exam/submit', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    email: email,
                    examId: examId,
                    answerRequests: extractedAnswers
                }),
            })
                .then(response => {
                    if (response.ok) {
                        alert("시험이 제출되었습니다.");
                        // TODO: 학교 등급과 시험 종류(기출, B셀파 문제), 연도 정보 실제 데이터 추가
                        location.href = "/user/exam/report?school_level=SL02&exam_round=2&year=2024&exam_id=${getExamResponse.id}";
                    } else {
                        console.error("응답 상태 코드: " + response.status);
                        alert("제출에 실패했습니다. 다시 시도해 주세요.");
                    }
                })
                .catch(error => {
                    console.error("에러 발생: ", error);
                    alert("네트워크 오류가 발생했습니다. 다시 시도해 주세요.");
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