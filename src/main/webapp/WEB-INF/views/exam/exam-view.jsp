<%@ page import="java.time.LocalDateTime" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:formatDate value="${today}" pattern="yyyyMMdd" var="nowDate"/>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온라인 학업성취도 평가
        (중3_과학_1회)</title>
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
                                        <span class="num">1</span>
                                        <span class="txt">그림 (가), (나)는 해안 지역에서 낮과 밤에 부는 바람을 나타낸 것이다.
이에 대한 설명으로 옳은 것을 &lt;보기&gt;에서 모두 고른 것은?  <i> [4점]</i> </span>
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

                    <div class="swiper-slide" id="item279">
                        <input type="hidden" name="item_id" value="279">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT01">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">2</span>
                                        <span class="txt">그림은 진공과 공기 중에서 깃털과 쇠구슬을 동시에 떨어뜨렸을 때의 모습을 나타낸 것이다. 이에 대한 설명으로 옳지 <em>않은</em> 것은?  <i> [4점]</i> </span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img02.jpg" alt="">
                                    </div>
                                    <ul class="answer-input-type radio">
                                        <li>
                                            <input type="radio" name="answer_279" id="answer_radio02_1" value="1">
                                            <label for="answer_radio02_1">1</label>
                                            <span class="txt">쇠구슬이 낙하하는 속력은 점점 증가한다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_279" id="answer_radio02_2" value="2">
                                            <label for="answer_radio02_2">2</label>
                                            <span class="txt">(나)에서 깃털에는 중력이 작용하지 않는다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_279" id="answer_radio02_3" value="3">
                                            <label for="answer_radio02_3">3</label>
                                            <span class="txt">(가)는 공기 중에서 낙하하는 모습이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_279" id="answer_radio02_4" value="4">
                                            <label for="answer_radio02_4">4</label>
                                            <span class="txt">(나)는 진공 중에서 낙하하는 모습이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_279" id="answer_radio02_5" value="5">
                                            <label for="answer_radio02_5">5</label>
                                            <span class="txt">쇠구슬과 깃털 모두 운동 방향과 같은 방향으로 힘이 작용한다.</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item280">
                        <input type="hidden" name="item_id" value="280">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT05">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top img-top">
                                        <span class="num">3</span>
                                        <span class="txt">그림과 같이 지게차를 이용하여 1개의 무게가 100 N인 벽돌 2000개를 바닥에서 높이 2 m인 선반에 올려놓으려고 한다. 다음 표는 이때 이용할 지게차를 고르기 위해 조사한 지게차의 성능이다. 가장 빠르게 벽돌을 올리고자 할 때, 이용할 지게차와 이때 걸리는 시간을 옳게 짝 지은 것은? (단, 벽돌을 지게차에 싣고 내리는 시간은 제외한다.) <i> [5점]</i>
                      </span>
                                        <div class="right-img-box">
                                            <img src="../../img/test/science2_img03_1.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img03_2.jpg" alt="" class="w60"
                                             style="margin-bottom:70px;">
                                    </div>
                                    <p class="line-guide">*연결하고자 하는 두 항목의 점을 클릭하면 선으로 연결됩니다.</p>
                                    <div class="answer-line-type">
                                        <div class="left-txt">
                                            <span class="txt">지게차: A</span>
                                            <span class="txt">지게차: B</span>
                                        </div>
                                        <div class="form-joining"
                                             style="width:100%;display:flex;z-index:9999;position:relative;justify-content:center;">
                                            <span id="leftarea"></span>
                                            <span id="rightarea"></span>
                                            <div id="column1" style="width:150px;z-index:9999;">
                                                <div id="row1">
                                                    <button id="1_1" row="1" column="1" class="dot"
                                                            onclick="clickbtn(this)" link_num="" line_num=""></button>
                                                </div>
                                                <div id="row2">
                                                    <button id="1_2" row="2" column="1" class="dot"
                                                            onclick="clickbtn(this)" link_num="" line_num=""></button>
                                                </div>
                                            </div>
                                            <div id="line"></div>
                                            <div id="column2" style="width:20px;z-index:9999;">
                                                <div id="row1">
                                                    <button id="2_1" row="1" column="2" class="dot"
                                                            onclick="clickbtn(this)" link_num="" line_num=""></button>
                                                </div>
                                                <div id="row2">
                                                    <button id="2_2" row="2" column="2" class="dot"
                                                            onclick="clickbtn(this)" link_num="" line_num=""></button>
                                                </div>
                                                <div id="row3">
                                                    <button id="2_3" row="3" column="2" class="dot"
                                                            onclick="clickbtn(this)" link_num="" line_num=""></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right-txt">
                                            <span class="txt">걸리는 시간 : 8초</span>
                                            <span class="txt">걸리는 시간 : 16초</span>
                                            <span class="txt">걸리는 시간 : 20초</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item281">
                        <input type="hidden" name="item_id" value="281">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT01">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">4</span>
                                        <span class="txt">영수는 질량이 5 kg인 물체를 말뚝에서 2 m 높이까지 일정한 속력으로 들어 올렸다. 이에 대한 설명으로 옳지 <em>않은</em> 것은?  <i> [4점]</i> </span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img04.jpg" alt="" class="w50">
                                    </div>
                                    <ul class="answer-input-type radio">
                                        <li>
                                            <input type="radio" name="answer_281" id="answer_radio04_1" value="1">
                                            <label for="answer_radio04_1">1</label>
                                            <span class="txt">중력에 대하여 일을 한 것이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_281" id="answer_radio04_2" value="2">
                                            <label for="answer_radio04_2">2</label>
                                            <span class="txt">물체의 무게는 49 N이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_281" id="answer_radio04_3" value="3">
                                            <label for="answer_radio04_3">3</label>
                                            <span class="txt">물체를 들어 올리는 힘이 한 일의 양은 196 J이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_281" id="answer_radio04_4" value="4">
                                            <label for="answer_radio04_4">4</label>
                                            <span class="txt">중력에 대하여 한 일의 양과 중력에 의한 위치 에너지는 같다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_281" id="answer_radio04_5" value="5">
                                            <label for="answer_radio04_5">5</label>
                                            <span class="txt">물체를 들어 올리는 일은 중력에 의한 위치 에너지로 전환된다.</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item282">
                        <input type="hidden" name="item_id" value="282">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT01">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">5</span>
                                        <span class="txt">그림은 액체 A~ C를 같은 세기의 화력으로 20분 동안 가열할 때, 시간에 따른 온도 변화를 나타낸 것이다. 이에 대한 설명으로 옳은 것은?  <i> [4점]</i> </span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img05.jpg" alt="">
                                    </div>
                                    <ul class="answer-input-type radio">
                                        <li>
                                            <input type="radio" name="answer_282" id="answer_radio05_1" value="1">
                                            <label for="answer_radio05_1">1</label>
                                            <span class="txt">A와 B는 동시에 끓었으므로 같은 종류의 물질이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_282" id="answer_radio05_2" value="2">
                                            <label for="answer_radio05_2">2</label>
                                            <span class="txt">A와 B를 섞은 다음 가열하면 C와 같은 결과가 나온다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_282" id="answer_radio05_3" value="3">
                                            <label for="answer_radio05_3">3</label>
                                            <span class="txt">A와 C는 같은 종류의 물질로 양이 서로 다르다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_282" id="answer_radio05_4" value="4">
                                            <label for="answer_radio05_4">4</label>
                                            <span class="txt">B를 더 강한 화력으로 가열하면 A와 같은 온도에서 끓을 수 있다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_282" id="answer_radio05_5" value="5">
                                            <label for="answer_radio05_5">5</label>
                                            <span class="txt">A, B, C는 끓는점이 모두 다르므로 A, B, C는 모두 서로 다른 종류의 물질이다.</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item283">
                        <input type="hidden" name="item_id" value="283">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="TT04">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">6</span>
                                        <span class="txt">다음은 혼합물의 분리에 대한 발표 자료 중 일부이다. 위 예에서 혼합물의 성분 물질 중 밀도가 작은 것을 각각 선택하시오.  <i> [5점]</i> </span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img06.jpg" alt="" class="w50">
                                    </div>
                                    <div class="answer-input-type textline">
                                        <div>
                                            <span class="txt">(가)</span>
                                            <span>(</span>
                                            <select name="" class="type1">
                                                <option value="선택" selected="" disabled="">선택</option>
                                                <option value="기름">기름</option>
                                                <option value="바닷물">바닷물</option>
                                            </select>
                                            <span>)</span>
                                        </div>
                                        <div>
                                            <span class="txt">(나)</span>
                                            <span>(</span>
                                            <select name="" class="type1">
                                                <option value="선택" selected="" disabled="">선택</option>
                                                <option value="혈장">혈장</option>
                                                <option value="혈구">혈구</option>
                                            </select>
                                            <span>)</span>
                                        </div>
                                        <div>
                                            <span class="txt">(다)</span>
                                            <span>(</span>
                                            <select name="" class="type1">
                                                <option value="선택" selected="" disabled="">선택</option>
                                                <option value="모래">모래</option>
                                                <option value="금">금</option>
                                            </select>
                                            <span>)</span>
                                        </div>
                                        <div>
                                            <span class="txt">(라)</span>
                                            <span>(</span>
                                            <select name="" class="type1">
                                                <option value="선택" selected="">선택</option>
                                                <option value="오래된 달걀">오래된 달걀</option>
                                                <option value="신선한 달걀">신선한 달걀</option>
                                            </select>
                                            <span>)</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item284">
                        <input type="hidden" name="item_id" value="284">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT01">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">7</span>
                                        <span class="txt">그림은 마그네슘을 가열하여 산화 마그네슘이 생성될 때 반응하는 마그네슘과 생성된 산화 마그네슘의 질량 관계를 나타낸 것이다. 마그네슘 30 g을 충분한 양의 산소와 완전히 반응시켰을 때의 설명으로 옳지 <em>않은</em> 것은?  <i> [4점]</i> </span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img07.jpg" alt="">
                                    </div>
                                    <ul class="answer-input-type radio">
                                        <li>
                                            <input type="radio" name="answer_284" id="answer_radio07_1" value="1">
                                            <label for="answer_radio07_1">1</label>
                                            <span class="txt">일정 성분비 법칙이 성립한다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_284" id="answer_radio07_2" value="2">
                                            <label for="answer_radio07_2">2</label>
                                            <span class="txt">반응한 산소의 질량은 20 g이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_284" id="answer_radio07_3" value="3">
                                            <label for="answer_radio07_3">3</label>
                                            <span class="txt">생성된 산화 마그네슘의 질량은 70 g이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_284" id="answer_radio07_4" value="4">
                                            <label for="answer_radio07_4">4</label>
                                            <span class="txt">반응하는 마그네슘과 산소의 질량비는 마그네슘 : 산소 = 3 : 2이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_284" id="answer_radio07_5" value="5">
                                            <label for="answer_radio07_5">5</label>
                                            <span class="txt">반응하는 산소와 생성되는 산화 마그네슘의 질량비는 산소 : 산화 마그네슘 = 2 : 5이다.</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item285">
                        <input type="hidden" name="item_id" value="285">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="TT04">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">8</span>
                                        <span class="txt"> 그림은 온도와 압력이 같을 때 수소 기체와 산소 기체가 반응하여 수증기가 생성될 때의 부피 관계를 나타낸 것이다.  수소 기체 50 mL와 산소 기체 20 mL를 완전히 반응시킬 때 <em>(가) 생성되는 수증기의 부피</em>와 <em>(나) 반응하지 않고 남은 기체의 종류와 부피</em>로 옳은 것을 각각 선택하시오 <i> [5점]</i> </span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img08.jpg" alt="">
                                    </div>
                                    <div class="answer-input-type textline">
                                        <div>
                                            <span class="txt">(가)</span>
                                            <span>(</span>
                                            <select name="" class="type1">
                                                <option value="선택" selected="">선택</option>
                                                <option value="20mL">20mL</option>
                                                <option value="35mL">35mL</option>
                                                <option value="40mL">40mL</option>
                                                <option value="50mL">50mL</option>
                                            </select>
                                            <span>)</span>
                                        </div>
                                        <div>
                                            <span class="txt">(나)</span>
                                            <span>(</span>
                                            <select name="" class="type1">
                                                <option value="선택" selected="">선택</option>
                                                <option value="수소, 5mL">수소, 5mL</option>
                                                <option value="산소, 5mL">산소, 5mL</option>
                                                <option value="수소, 10mL">수소, 10mL</option>
                                                <option value="산소, 15mL">산소, 15mL</option>
                                                <option value="수소, 15mL">수소, 15mL</option>
                                            </select>
                                            <span>)</span>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item286">
                        <input type="hidden" name="item_id" value="286">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT01">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">9</span>
                                        <span class="txt">그림은 에너지가 출입하는 반응의 에너지 변화를 나타낸 것이다. 위 그림과 관련된 에너지 출입 반응을 옳게 이야기한 학생은? <i> [4점]</i> </span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img09_1.jpg" alt="" class="w50">
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img09_2.jpg" alt="" class="w60">
                                    </div>
                                    <ul class="answer-input-type radio horizontal-type">
                                        <li>
                                            <input type="radio" name="answer_286" id="answer_radio09_1" value="1">
                                            <label for="answer_radio09_1">1</label>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_286" id="answer_radio09_2" value="2">
                                            <label for="answer_radio09_2">2</label>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_286" id="answer_radio09_3" value="3">
                                            <label for="answer_radio09_3">3</label>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_286" id="answer_radio09_4" value="4">
                                            <label for="answer_radio09_4">4</label>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_286" id="answer_radio09_5" value="5">
                                            <label for="answer_radio09_5">5</label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item287">
                        <input type="hidden" name="item_id" value="287">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT01">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top img-top">
                                        <span class="num">10</span>
                                        <span class="txt"> 그림은 호흡 운동의 원리를 알아보는 실험 장치를 나타낸 것이다. 이에 대한 설명으로 옳은 것을 &lt;보기&gt;에서 모두 고른 것은? <i> [4점]</i> </span>
                                        <div class="right-img-box">
                                            <img src="../../img/test/science2_img10_1.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img10_2.jpg" alt="" class="w60">
                                    </div>
                                    <ul class="answer-input-type radio">
                                        <li>
                                            <input type="radio" name="answer_287" id="answer_radio10_1" value="1">
                                            <label for="answer_radio10_1">1</label>
                                            <span class="txt">ㄱ</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_287" id="answer_radio10_2" value="2">
                                            <label for="answer_radio10_2">2</label>
                                            <span class="txt">ㄴ</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_287" id="answer_radio10_3" value="3">
                                            <label for="answer_radio10_3">3</label>
                                            <span class="txt">ㄷ</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_287" id="answer_radio10_4" value="4">
                                            <label for="answer_radio10_4">4</label>
                                            <span class="txt">ㄱ,ㄴ</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_287" id="answer_radio10_5" value="5">
                                            <label for="answer_radio10_5">5</label>
                                            <span class="txt">ㄱ,ㄴ,ㄷ</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item288">
                        <input type="hidden" name="item_id" value="288">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT02">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">11</span>
                                        <span class="txt"> 그림은 홍채와 동공의 변화를 나타낸 것이다. 아래의 글에서 굵게 표시된 구문 중 (가)에서 (나)로 변할 때의 설명으로 옳지 <em>않은</em> 것을 클릭하시오. <i> [5점]</i> </span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img11.jpg" alt="" class="w60">
                                    </div>
                                    <div class="text-box">
                                        (가)에서 (나)로 변할 때
                                        <button>홍채가 확장</button>
                                        되어
                                        <button>동공 크기가 축소</button>
                                        된다. 또한
                                        <button>수정체가 얇아진다</button>
                                        .
                                        <button>이는 어두운 곳에서 갑자기 밝은 곳으로 이동했을 때 나타나는 눈의 변화</button>
                                        로
                                        <button>동공으로 들어오는 빛의 양을 줄이기 위한 반응이다</button>
                                        .
                                    </div>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item289">
                        <input type="hidden" name="item_id" value="289">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="TT03">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">12</span>
                                        <span class="txt"> 그림은 사람의 내분비샘을 나타낸 것이다. 각 내분비샘에서 분비되는 호르몬과 그 기능이 옳게 짝지어진 내분비샘을 클릭하시오. <i> [5점]</i> </span>
                                    </div>
                                    <div class="answer-map-type">
                                        <img src="../../img/test/science2_img12.jpg" class="w80">
                                        <svg>
                                            <g>
                                                <circle cx="280" cy="140" r="25"></circle>
                                                <text font-size="25" fill="black" x="272" y="148">A</text>
                                            </g>
                                            <g>
                                                <circle cx="255" cy="240" r="25"></circle>
                                                <text font-size="25" fill="black" x="247" y="248">B</text>
                                            </g>
                                            <g>
                                                <ellipse cx="205" cy="500" rx="25" ry="50"></ellipse>
                                                <text font-size="25" fill="black" x="197" y="508">C</text>
                                            </g>
                                            <g>
                                                <circle cx="270" cy="520" r="25"></circle>
                                                <text font-size="25" fill="black" x="262" y="528">D</text>
                                            </g>
                                            <g>
                                                <circle cx="245" cy="670" r="60"></circle>
                                                <text font-size="25" fill="black" x="237" y="678">E</text>
                                            </g>
                                        </svg>
                                    </div>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item290">
                        <input type="hidden" name="item_id" value="290">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT01">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">13</span>
                                        <span class="txt"> 그림은 혈액 순환 경로를 애니메이션으로 표현하기 위한 코딩 중 일부를 나타낸 것이다. 이에 대한 설명으로 옳지 <em>않은</em> 것은 <i> [4점]</i> </span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img13.jpg" alt="" class="w60">
                                    </div>
                                    <ul class="answer-input-type radio">
                                        <li>
                                            <input type="radio" name="answer_290" id="answer_radio13_1" value="1">
                                            <label for="answer_radio13_1">1</label>
                                            <span class="txt">(가)가 온몸일 때 A는 좌심실이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_290" id="answer_radio13_2" value="2">
                                            <label for="answer_radio13_2">2</label>
                                            <span class="txt">(가)가 폐일 때 ㉠은 폐동맥이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_290" id="answer_radio13_3" value="3">
                                            <label for="answer_radio13_3">3</label>
                                            <span class="txt">(가)가 온몸일 때 ㉡은 대정맥이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_290" id="answer_radio13_4" value="4">
                                            <label for="answer_radio13_4">4</label>
                                            <span class="txt">(가)가 폐일 때 B는 우심방이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_290" id="answer_radio13_5" value="5">
                                            <label for="answer_radio13_5">5</label>
                                            <span class="txt">(가)가 폐일 때 작용 (나)는 주로 기체 교환 작용에 해당한다.</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item291">
                        <input type="hidden" name="item_id" value="291">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT01">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">14</span>
                                        <span class="txt"> 그림은 진욱이와 해인이가 과학 시간에 실시한 실험을 나타낸 것이다. 두 개의 이쑤시개를 손바닥, 이마, 입술에 대었을 때 두 점으로 느끼는 최소 거리가 다음과 같았다. 이에 대한 설명으로 옳지 <em>않은</em> 것은? <i> [4점]</i> </span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img14_1.jpg" alt="" class="w60">
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img14_2.jpg" alt="" class="w60">
                                    </div>
                                    <ul class="answer-input-type radio">
                                        <li>
                                            <input type="radio" name="answer_291" id="answer_radio14_1" value="1">
                                            <label for="answer_radio14_1">1</label>
                                            <span class="txt">가장 예민한 부위는 입술이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_291" id="answer_radio14_2" value="2">
                                            <label for="answer_radio14_2">2</label>
                                            <span class="txt">면적당 감각점의 분포 수가 가장 많은 부위는 손바닥이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_291" id="answer_radio14_3" value="3">
                                            <label for="answer_radio14_3">3</label>
                                            <span class="txt">면적당 감각점의 분포 수가 많을수록 더 예민한 부위이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_291" id="answer_radio14_4" value="4">
                                            <label for="answer_radio14_4">4</label>
                                            <span class="txt">손바닥은 이마보다 면적당 감각점의 분포 수가 더 많다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_291" id="answer_radio14_5" value="5">
                                            <label for="answer_radio14_5">5</label>
                                            <span class="txt">감각점이 많이 분포할수록 두 점으로 느끼는 최소 거리가 짧아진다.</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item292">
                        <input type="hidden" name="item_id" value="292">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT01">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">15</span>
                                        <span class="txt"> 표는 어느 해역의 바닷물 1 kg에 포함된 염류의 성분과 함량을 나타낸 것이다. 염류와 염분에 대한 설명으로 옳지 <em>않은</em> 것은? <i> [4점]</i></span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img15.jpg" alt="" class="w60">
                                    </div>
                                    <ul class="answer-input-type radio">
                                        <li>
                                            <input type="radio" name="answer_292" id="answer_radio15_1" value="1">
                                            <label for="answer_radio15_1">1</label>
                                            <span class="txt">A는 쓴맛이 나는 물질이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_292" id="answer_radio15_2" value="2">
                                            <label for="answer_radio15_2">2</label>
                                            <span class="txt">이 바닷물의 염분은 38 psu이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_292" id="answer_radio15_3" value="3">
                                            <label for="answer_radio15_3">3</label>
                                            <span class="txt">증발량이 강수량보다 많은 건조한 지역에서는 염분이 높게 나타난다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_292" id="answer_radio15_4" value="4">
                                            <label for="answer_radio15_4">4</label>
                                            <span class="txt">바닷물에서 짠맛이 나는 이유는 염류 중 염화 나트륨이 가장 많은 양을 차지하기 때문이다</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_292" id="answer_radio15_5" value="5">
                                            <label for="answer_radio15_5">5</label>
                                            <span class="txt">염분은 지역이나 계절에 따라 다르지만, 해수에 녹아 있는 염류 사이의 비율은 거의 일정하다.</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item293">
                        <input type="hidden" name="item_id" value="293">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT01">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">16</span>
                                        <span class="txt"> 그림은 북반구의 고기압과 저기압을 순서에 관계없이 나타낸 것이다. 이에 대한 설명으로 옳은 것은? <i> [4점]</i> </span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img16.jpg" alt="" class="w60">
                                    </div>
                                    <ul class="answer-input-type radio">
                                        <li>
                                            <input type="radio" name="answer_293" id="answer_radio16_1" value="1">
                                            <label for="answer_radio16_1">1</label>
                                            <span class="txt">(가)는 저기압, (나)는 고기압이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_293" id="answer_radio16_2" value="2">
                                            <label for="answer_radio16_2">2</label>
                                            <span class="txt">(가)의 중심에서 하강 기류가 생긴다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_293" id="answer_radio16_3" value="3">
                                            <label for="answer_radio16_3">3</label>
                                            <span class="txt">(나)의 중심에서는 맑은 날씨가 나타난다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_293" id="answer_radio16_4" value="4">
                                            <label for="answer_radio16_4">4</label>
                                            <span class="txt">(가)와 (나)는 중심의 기압이 1 기압보다 높은지 낮은지로 구분한다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_293" id="answer_radio16_5" value="5">
                                            <label for="answer_radio16_5">5</label>
                                            <span class="txt">(나)의 중심에서 수은을 이용하여 기압을 측정하면 수은 기둥의 높이는 76 cm보다 높다.</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item294">
                        <input type="hidden" name="item_id" value="294">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT01">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">17</span>
                                        <span class="txt"> 그림은 기권의 층상 구조를 나타낸 것이다. 이에 대한 설명으로 옳지 <em>않은</em> 것은? <i> [4점]</i> </span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img17.jpg" alt="" class="w50">
                                    </div>
                                    <ul class="answer-input-type radio">
                                        <li>
                                            <input type="radio" name="answer_294" id="answer_radio17_1" value="1">
                                            <label for="answer_radio17_1">1</label>
                                            <span class="txt">x는 기온이다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_294" id="answer_radio17_2" value="2">
                                            <label for="answer_radio17_2">2</label>
                                            <span class="txt">B 층은 안정하여 비행기의 항로로 이용되고 오존층이 존재한다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_294" id="answer_radio17_3" value="3">
                                            <label for="answer_radio17_3">3</label>
                                            <span class="txt">C 층의 가장 위쪽인 성층권 계면에서 기권의 최저 기온이 나타난다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_294" id="answer_radio17_4" value="4">
                                            <label for="answer_radio17_4">4</label>
                                            <span class="txt">D 층은 열권으로 대류가 일어나지 않는 안정한 층이며 전리층이 존재한다.</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_294" id="answer_radio17_5" value="5">
                                            <label for="answer_radio17_5">5</label>
                                            <span class="txt">A 층은 위로 갈수록 도달하는 지구 복사 에너지가 감소하여 x값이 작아진다.</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item295">
                        <input type="hidden" name="item_id" value="295">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="TT03">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">18</span>
                                        <span class="txt"> 그림은 우리나라에 영향을 주는 기단을 나타낸 것이다. 각 기단에 대해 옳게 설명한 것을 모두 클릭하시오. <i> [5점]</i> </span>
                                    </div>
                                    <div class="answer-map-type">
                                        <img src="../../img/test/science2_img18_1.jpg">
                                        <svg>
                                            <g>
                                                <rect x="0" y="55" width="180" height="52"></rect>
                                            </g>
                                            <g>
                                                <rect x="12" y="408" width="177" height="52"></rect>
                                            </g>
                                            <g>
                                                <rect x="756" y="68" width="177" height="65"></rect>
                                            </g>
                                            <g>
                                                <rect x="746" y="412" width="177" height="52"></rect>
                                            </g>
                                        </svg>
                                    </div>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item296">
                        <input type="hidden" name="item_id" value="296">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT01">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">19</span>
                                        <span class="txt"> 다음은 우리나라 주변을 흐르는 해류를 구분하는 과정과 학생들이 우리나라 주변의 해류에 대해 이야기하는 모습이다. 이에 대해 옳게 설명한 학생을 모두 고른 것은? <i> [5점]</i> </span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img19_1.jpg" alt="" class="w60">
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img19_2.jpg" alt="" class="w60">
                                    </div>
                                    <ul class="answer-input-type radio">
                                        <li>
                                            <input type="radio" name="answer_296" id="answer_radio19_1" value="1">
                                            <label for="answer_radio19_1">1</label>
                                            <span class="txt">정연</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_296" id="answer_radio19_2" value="2">
                                            <label for="answer_radio19_2">2</label>
                                            <span class="txt">가은</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_296" id="answer_radio19_3" value="3">
                                            <label for="answer_radio19_3">3</label>
                                            <span class="txt">정연, 영훈</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_296" id="answer_radio19_4" value="4">
                                            <label for="answer_radio19_4">4</label>
                                            <span class="txt">영훈, 가은</span>
                                        </li>
                                        <li>
                                            <input type="radio" name="answer_296" id="answer_radio19_5" value="5">
                                            <label for="answer_radio19_5">5</label>
                                            <span class="txt">정연, 영훈, 가은</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item297">
                        <input type="hidden" name="item_id" value="297">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT11">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top img-top">
                                        <span class="num">서답형1</span>
                                        <span class="txt"> 지영이는 갓 삶은 뜨거운 달걀을 식히려고 찬물에 담궜다. 그림은 달걀을 찬물에 담궜을 때 달걀과 찬물의 온도 변화를 시간에 따라 나타낸 것이다. <br>이에 대해 학생들이 대화를 나누었다.<i> [6점]</i> </span>
                                        <div class="right-img-box">
                                            <img src="../../img/test/science2_img20_1.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="answer-map-type">
                                        <img src="../../img/test/science2_img20_2.jpg" class="w60">
                                        <svg class="h80">
                                            <g>
                                                <rect x="5" y="253" width="175" height="60" rx="7" ry="7"></rect>
                                            </g>
                                            <g>
                                                <rect x="216" y="253" width="175" height="60" rx="7" ry="7"></rect>
                                            </g>
                                            <g>
                                                <rect x="419" y="312" width="135" height="86" rx="7" ry="7"></rect>
                                            </g>
                                            <g>
                                                <rect x="16" y="601" width="128" height="113" rx="7" ry="7"></rect>
                                            </g>
                                            <g>
                                                <rect x="199" y="636" width="175" height="83" rx="7" ry="7"></rect>
                                            </g>
                                        </svg>
                                    </div>
                                    <div class="answer-textarea-type">
                                        ⑴ 위의 대화 중 바르게 말한 학생을 모두 쓰시오.
                                        <textarea name="" id="" cols="30" rows="5" placeholder="입력"></textarea>
                                    </div>
                                    <div class="answer-input-type">
                                        ⑵ 위의 대화 중 바르지 <em>않게</em> 말한 학생의 말풍선을 모두 클릭하시오.
                                    </div>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item298">
                        <input type="hidden" name="item_id" value="298">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT14">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">서답형2</span>
                                        <span class="txt"> 그림은 물질 A~E의 성분을 알아보기 위해 크로마토그래피로 분리한 결과를 나타낸 것이다. (단, 혼합물은 모두 순물질로 분리된다.)</span>
                                    </div>
                                    <div class="answer-map-type">
                                        <img src="../../img/test/science2_img21_1.jpg" class="w60">
                                        <svg class="h80">
                                            <g>
                                                <circle cx="150" cy="410" r="25"></circle>
                                            </g>
                                            <g>
                                                <circle cx="231" cy="410" r="25"></circle>
                                            </g>
                                            <g>
                                                <circle cx="312" cy="410" r="25"></circle>
                                            </g>
                                            <g>
                                                <circle cx="395" cy="410" r="25"></circle>
                                            </g>
                                            <g>
                                                <circle cx="477" cy="410" r="25"></circle>
                                            </g>
                                        </svg>
                                    </div>
                                    <div class="answer-input-type" style="margin-top: 50px;">
                                        ⑴ 물질을 구성하는 순물질의 종류가 가장 많은 것의 기호를 위의 그림에서 클릭하시오. <i
                                            style="display: contents; font-size: 12px; font-style:normal; color: #666">
                                        [5점]</i>
                                    </div>
                                    <div class="answer-textarea-type" style="margin-top: 50px;">
                                        ⑵ 물질 E에 들어 있는 순물질 성분의 기호를 모두 쓰고, 그렇게 생각한 까닭을 아래 용어를 사용하여 서술하시오.
                                        <img src="../../img/test/science2_img21_2.jpg" alt="" class="w60">
                                        <textarea name="" id="" cols="30" rows="5" placeholder="입력"></textarea>
                                    </div>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item299">
                        <input type="hidden" name="item_id" value="299">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT13">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">서답형3</span>
                                        <span class="txt">탄산 칼슘과 묽은 염산을 그림과 같은 두 가지 방법으로 반응시키면서 반응 전후의 질량을 측정하였다.</span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img22.jpg" alt="" class="w60">
                                    </div>
                                    <div class="answer-input-type textline">
                                        ⑴ (가)와 (나)에서 반응 전후의 질량 변화를 각각 쓰시오.
                                        <div>
                                            <span class="txt">(가)의 질량 변화</span>
                                            <span>(</span>
                                            <input type="text" placeholder="입력">
                                            <span>)</span>
                                        </div>
                                        <div>
                                            <span class="txt">(나)의 질량 변화</span>
                                            <span>(</span>
                                            <input type="text" placeholder="입력">
                                            <span>)</span>
                                        </div>
                                    </div>
                                    <div class="answer-textarea-type">
                                        ⑵ (가) 실험에서 (1)과 같은 실험 결과가 나타나는 까닭을 생성 물질의 상태를 넣어 서술하시오.
                                        <textarea placeholder="입력" name="" id="" cols="30" rows="5"></textarea>
                                    </div>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

                    <div class="swiper-slide" id="item300">
                        <input type="hidden" name="item_id" value="300">
                        <input type="hidden" name="relation_id" value="">
                        <input type="hidden" name="item_type" value="IT13">
                        <input type="hidden" name="student_answer"
                               value=''/>
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">서답형4</span>
                                        <span class="txt">그림은 여러 기관계의 통합적 작용을 나타낸 것이다.</span>
                                    </div>
                                    <div class="img-box">
                                        <img src="../../img/test/science2_img23.jpg" alt="">
                                        <div class="input-group">
                                            <input type="text" placeholder="입력">
                                            <input type="text" placeholder="입력">
                                            <input type="text" placeholder="입력">
                                            <input type="text" placeholder="입력">
                                        </div>
                                    </div>
                                    <div class="answer-input-type">
                                        ⑴ A~D를 클릭하여 각각 어떤 기관계인지 쓰시오. <i
                                            style="display: contents; font-style: normal; font-size:12px; color: #666;">
                                        [6점]</i>
                                    </div>
                                    <div class="answer-textarea-type">
                                        ⑵ 기관계 C가 수행하는 역할을 서술하시오
                                        <textarea placeholder="입력" name="" id="" cols="30" rows="5"></textarea>
                                    </div>
                                </div>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>

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
