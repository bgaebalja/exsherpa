<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온라인 학업성취도 평가 (CBT 대표유형(중/고등))</title>
    <link rel="icon" href="/img/fav.png">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="/css/reset.css?ver=20241103"/>
    <link rel="stylesheet" href="/css/paper.css?ver=20241103"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <!-- <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css"> -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.0.0-alpha1.js"></script> -->
    <script src="/js/line.js?ver=20241103"></script>
    <script type="text/javascript" src="/js/itemRenderer/AnswerExtractor.js?ver=20241103"></script>
    <script type="text/javascript" src="/js/itemRenderer/AnswerSetting.js?ver=20241103"></script>
    <script type="text/x-mathjax-config;executed=true">
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
                }
            },
            "HTML-CSS": {
                linebreaks: { automatic: true }
           },
            "CommonHTML": { linebreaks: { automatic: true } }
        });

    </script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js?config=TeX-MML-AM_CHTML'></script>

    <style>
        .page .drop-area .border .drop {
            display: block;
            width: 50%;
            height: 90%;
            border: 1px solid #000;
        }
    </style>
</head>
<body>
<div id="MathJax_Message" style="display: none;"></div>
<div class="wrap class-math">
    <div class="header">
        <div class="logo" style="display: flex; align-items: center;">
            <a href="/" style="width:100%;color: white;"><img src="../../../img/logo2.png" alt="logo"
                                                              style="width: 20%; margin-left: 11px"><span
                    style="margin-left: 11px;font-size: 24px;vertical-align: middle;">온라인 학업성취도 평가</span></a>
        </div>
        <div class="top-area">
            <!-- s: 220711 추가 -->
            <div class="btn-wrap">
            </div>
            <!-- e: 220711 추가 -->
            <div class="time-box">
                <span class="txt">남은<br>시간</span>
                <span class="time-txt" id="timer">60:00</span>
            </div>
            <a href="javascript:completeExam();" class="btn-submit">최종제출</a>
        </div>
    </div>
    <div class="container">
        <div class="viewer-omr">
            <div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal">
                <span class="swiper-pagination-bullet swiper-pagination-bullet-active" tabindex="0" aria-current="true">1</span><span
                    class="swiper-pagination-bullet" tabindex="0">2</span><span class="swiper-pagination-bullet"
                                                                                tabindex="0">3</span><span
                    class="swiper-pagination-bullet" tabindex="0">4</span><span class="swiper-pagination-bullet"
                                                                                tabindex="0">5</span><span
                    class="swiper-pagination-bullet" tabindex="0">6</span><span class="swiper-pagination-bullet"
                                                                                tabindex="0">7</span><span
                    class="swiper-pagination-bullet" tabindex="0">8</span><span class="swiper-pagination-bullet"
                                                                                tabindex="0">9</span><span
                    class="swiper-pagination-bullet" tabindex="0">10</span></div>
        </div>
        <div class="viewer-paper">
            <div class="head">
                <span class="txt">CBT 대표유형(중·고등)</span>
                <i class="enterFullscreenBtn">
                    <img src="https://enaea.kice.re.kr/js/site/viewer/css/images/fullscreen_icon-icons.com_71635.png"
                         alt="">
                </i>
                <div class="btn-wrap">
                    <div class="swiper-button-prev swiper-button-disabled" tabindex="-1" role="button"
                         aria-label="Previous slide" aria-controls="swiper-wrapper-34a9b0d1f8de72cb"
                         aria-disabled="true"></div>
                    <div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide"
                         aria-controls="swiper-wrapper-34a9b0d1f8de72cb" aria-disabled="false"></div>
                </div>
            </div>

            <input type="hidden" name="currentId" value="">
            <div class="swiper mySwiper swiper-initialized swiper-horizontal swiper-pointer-events swiper-backface-hidden">
                <div class="swiper-wrapper" id="swiper-wrapper-34a9b0d1f8de72cb" aria-live="polite"
                     style="transform: translate3d(0px, 0px, 0px);">
                    <div class="swiper-slide swiper-slide-active" id="item268" role="group" aria-label="1 / 10"
                         style="width: 609px;">
                        <div class="page type01">
                            <div class="inner">
                                <div class="question type01">
                                    <div class="left">
                                        <div class="txt" style="font-size: 20px;line-height: 2;">
                                            (가) [앞부분 줄거리] ‘나’는 어릴 적에 아버지가 돌아가신 후, 개성 박적골에서 할아버지의 보살핌을 받으며 자랐다. 큰아버지와
                                            작은아버지는 일본식으로 이름을 바꾸자고 주장했지만, 할아버지와 오빠의 반대로 바꾸지 않았다. 그래도 면사무소에서 일하는 큰아버지 덕에
                                            오빠는 일본에 강제로 끌려가지도 않았고 집안도 평안하게 지낼 수 있었다.
                                            <br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;우리가 일본이 망했다는 걸 안 것은 느닷없이 한 떼의 청년들이 몽둥이를 들고 우리
                                            집으로 쳐들어오고 나서였다. 그들은 저희들끼리만
                                            희희낙락 우쭐대면서 우지끈뚝딱 우리 집 세간이며 문짝을 때려 부수기 시작했다. 우리 마을 청년도 한두 명 섞여 있는 듯했지만 거의 모르는
                                            얼굴들이었다.
                                            <br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;그러나 그 고장 토박이인 큰숙모는 거의 다 안면이 있는 듯 자네들이 별안간 환장을
                                            했나, 도대체 이게 무슨 짓인지 영문이나 좀 알자고
                                            몸을 사시나무 떨 듯하면서도 의젓 하게 호령을 했다. 앞으로 나서진 못하고 뒤에 처졌던 박적골 청년이 잠시 피해있는 게 좋을 듯하다면서
                                            일본이 망하고 우리나라가 해방이 됐다는 걸 우리에게 알려 주었다. 그러니까 박적골에선 우리 집이 친일파 집으로 몰려 분풀이를 당하고 있는
                                            것이었다.
                                            <br>
                                            (중략)
                                            <br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;튼튼한 대문짝까지 우지끈 깨부수고 난 ㉠<em>청년</em> 중의 하나가 문패를
                                            떼서 패대기를 쳤다. 내가 어려서부터 익히 봐 온 할아버지의 문패였다.
                                            할아버지가 돌아가시고 나서도 그 문패는 여전히 붙어 있었고, 숙부도 오빠도 그 옆이나 밑에 다른 문패를 추가하지 않았다.
                                            <br>
                                            ㉡<em>나는</em> 뭐라고 목청껏 악을 쓰며 그 청년을 향해 돌진했다. 할아버지 서책으로 그릇을 만드는 걸 볼 때는 재미만 있었는데
                                            문패를
                                            패대기치는 건 왜 그렇게 참을 수가 없었는지 모를 일이다. 난생 처음 보는 폭력 장면이 하나도 무섭지가 않았고 사생결단을 하다가 죽어도
                                            좋다고 생각했다. 아마 오빠만 아니었다면 누구 한 사람 물어뜯기라도 하고 나서 기함*을 하고 나자빠졌을 것이다. 그보다 훨씬 어렸을
                                            때이긴 하지만 자신도 제어할 수 없는 성깔 때문에 기함을 한 일이 더러 있었다.
                                            <br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오빠가 나를 질질 끌다시피 해서 집 뒤를 돌아 뒷동산에 올랐다. ㉢ 숙모와 할머니가
                                            땅을 치며 통곡을 하고, 청년 중의 상당수는
                                            고정하시라고 그들을 달래느라 쩔쩔매는 걸로 봐서 사람을 해칠 것 같지는 않았다. 그래도 나는 끌려가면서도 그들에게 정중하게 어른들의
                                            안전을 부탁하는 오빠가 너무 바보 같고 어수룩해 보여서 기가 막혔다. 나는 뒷동산에 끌려가서도 오빠에게 마구 대들었다. 우리가 어째서
                                            친일파냐? 우리는 창씨개명*도 안 했지 않느냐. 똥 묻은 개가 겨 묻은 개를 나무라도 분수가 있지. ㉣<em>도쿠야마</em>, 아라이,
                                            기무라들이 뭐가
                                            잘났다고 감히 반남 박씨 집을 때려 부수느냐는 게 내 항변의 대강의 요지였다.
                                            <br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오빠는 노한 청년들이 제풀에 물러날 때까지 속수무책으로 우리 집이 망가지는 걸 바라
                                            보면서 한편 내 어깨를 다독거리며 내 생각이 옳지
                                            않다는 걸 알아듣게 하려고 애썼다. 내가 막무가내로 내 생각만 옳다고 주장했기 때문에 오빠가 하도 여러 말을 해서 자세한 중학교 3학년
                                            것은 생각나지 않지만, ㉤<em>도쿠야마</em>, 아라이들이 당한 건 박해요 수난이요 치욕이지만, 우리는 그동안 편안히 특혜를 누려
                                            왔다는 요지였다.
                                            오빠는 그게 너무도 부끄러워 얼굴을 들 수가 없다고 했다. 저렇게라도 분풀이를 당했으니까 마을 청년 보기가 좀 덜 부끄러울 것 같다고도
                                            했다.
                                            <br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;나는 이윽고 조용하고 비통해졌다. 오빠한테 설득을 당해서가 아니라 헛된 분노 끝에
                                            오는 허탈감 때문에 그랬고, 상처투성이가 된 우리 집
                                            때문에도 그러했다. 우리는 그 집을 얼마나 사랑했던가. 오빠가 내 속을 알아차렸는지 실컷 울다가 내려가자고 했다.
                                            <br>
                                            - 박완서, &lt;그 많던 싱아는 누가 다 먹었을까&gt;-
                                            <br>
                                            * 기함 : 갑작스레 몹시 놀라거나 아프거나 하여 소리를 지르면서 넋을 잃음.
                                            <br>
                                            * 창씨개명 : 일제가 강제로 우리나라 사람의 성과 이름을 일본식으로 고치게 한 일.
                                            <img src="/img/img01.png" alt="">
                                        </div>
                                    </div>
                                    <div class="right">
                                        <div class="top">
                                            <span class="num">1</span>
                                            <span class="txt">(나)는 (가)를 재구성한 작품이다. (가)와 (나)를 비교한 설명으로 적절하지 <em>않은</em> 것을 고르시오.</span>
                                        </div>
                                        <ul class="answer-input-type radio dummy_style" style="margin-bottom: 1660px;">
                                            <li><input type="radio" name="answer_268" id="answer_268_radio01" value="1">
                                                <label for="answer_268_radio01">1</label>
                                                <span class="txt">(가)의 ㉠에서는 청년의 행동을 서술하고 있는데, (나)의 ⓐ에서는 청년의 행동을 보는 ‘나’의 반응을  ‘퍽’이라는 의성어로 드러내고 있다.</span>
                                            </li>
                                            <li><input type="radio" name="answer_268" id="answer_268_radio02" value="2">
                                                <label for="answer_268_radio02">2</label>
                                                <span class="txt">(가)의 ㉡에서는 ‘나’의 행동을 서술하고 있는데, (나)의 ⓑ에서는 ‘나’의 모습을 과장되게 그리고 있다.</span>
                                            </li>
                                            <li><input type="radio" name="answer_268" id="answer_268_radio03" value="3">
                                                <label for="answer_268_radio03">3</label>
                                                <span class="txt">(가)의 ㉢에서는 숙모와 할머니를 대하는 청년들의 행동을 서술하고 있지만, (나)의 ⓒ에서는 청년들의 행동을 제시하지 않았다.</span>
                                            </li>
                                            <li><input type="radio" name="answer_268" id="answer_268_radio04" value="4">
                                                <label for="answer_268_radio04">4</label>
                                                <span class="txt">(가)의 ㉣에서는 ‘나’의 항변의 요지만을 서술하고 있지만, (나)의 ⓓ에서는 ‘나’의 항변을 듣는 오빠의 표정도 보여주고 있다.</span>
                                            </li>
                                            <li><input type="radio" name="answer_268" id="answer_268_radio05" value="5">
                                                <label for="answer_268_radio05">5</label>
                                                <span class="txt">(가)의 ㉤에서는 오빠가 한 말의 요지를 서술하고 있는데, (나)의 ⓔ에서는 말풍선 안에 넣어 오빠가 직접 말하는 것으로 표현하였다.</span>
                                            </li>
                                        </ul>
                                        <p class="source">* 이 기출문제의 저작권과 재산권은 한국교육과정평가원에 있습니다.</p>
                                    </div>
                                </div>

                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>
                    <div class="swiper-slide swiper-slide-next" id="item269" role="group" aria-label="2 / 10"
                         style="width: 609px;">
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">2</span>
                                        <span class="txt">빈칸에 들어갈 낱말을 보기에서 골라 끌어 놓으시오.</span>
                                    </div>
                                    <div class="text-box">
                                        &nbsp;&nbsp;&nbsp;&nbsp; Our world is a collection of all kinds of ecosystems.
                                        An ecosystem is a community <br>
                                        of all the living things, their habitats, and the climate in which they live.
                                        Everyone <br>
                                        in these communities shares food and natural resources. Ecosystems can be as big
                                        <br>
                                        as the whole world and as tiny as a rock. A <span class="drop"></span> is a
                                        great example of an <br>
                                        ecosystem. It provides a habitat for small animals, birds, and insects. It
                                        provides <br>
                                        shade for plants on the group. It drinks in sunlight to grow bigger and makes
                                        seeds <br>
                                        that the small animals and birds eat and scatter around. And when it dies, it
                                        becomes <br>
                                        a part of the ground again.
                                    </div>
                                </div>
                                <div class="answer-drag-type" style="margin-bottom: 260px;">
                                    <span>보기</span>
                                    <ul class="btn-text">
                                        <li class="drag" draggable="true" data-name="cloud">cloud</li>
                                        <li class="drag" draggable="true" data-name="desert">desert</li>
                                        <li class="drag" draggable="true" data-name="nest">nest</li>
                                        <li class="drag" draggable="true" data-name="river">river</li>
                                        <li class="drag" draggable="true" data-name="tree">tree</li>
                                    </ul>
                                </div>
                                <p class="source">* 이 기출문제의 저작권과 재산권은 한국교육과정평가원에 있습니다.</p>
                            </div>

                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>
                    <div class="swiper-slide" id="item270" role="group" aria-label="3 / 10" style="width: 609px;">
                        <input type="hidden" name="item_id" value="270">
                        <input type="hidden" name="item_type" value="IT01">
                        <input type="hidden" name="student_answer" value="">
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">3</span>
                                        <span class="txt">\(x = -3, y = 2\) 일 때, \(x^{2} + xy\)의 값은?</span>
                                    </div>
                                    <ul class="answer-input-type radio dummy_style" style=" margin-bottom: 520px;">
                                        <li><input type="radio" name="answer_270" id="answer_270_radio01" value="1">
                                            <label for="answer_270_radio01">1</label>
                                            <span class="txt">\(-15\)</span></li>
                                        <li><input type="radio" name="answer_270" id="answer_270_radio02" value="2">
                                            <label for="answer_270_radio02">2</label>
                                            <span class="txt">\(-3\)</span></li>
                                        <li><input type="radio" name="answer_270" id="answer_270_radio03" value="3">
                                            <label for="answer_270_radio03">3</label>
                                            <span class="txt">\(0\)</span></li>
                                        <li><input type="radio" name="answer_270" id="answer_270_radio04" value="4">
                                            <label for="answer_270_radio04">4</label>
                                            <span class="txt">\(3\)</span></li>
                                        <li><input type="radio" name="answer_270" id="answer_270_radio05" value="5">
                                            <label for="answer_270_radio05">5</label>
                                            <span class="txt">\(15\)</span></li>
                                    </ul>
                                </div>
                                <p class="source">* 이 기출문제의 저작권과 재산권은 한국교육과정평가원에 있습니다.</p>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>
                    <div class="swiper-slide" id="item271" role="group" aria-label="4 / 10" style="width: 609px;">
                        <input type="hidden" name="item_id" value="271">
                        <input type="hidden" name="item_type" value="TT03">
                        <input type="hidden" name="student_answer" value="">


                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">4</span>
                                        <span class="txt">지도에 표시된 네 개 도시 중 현지 특파원이 옳게 보도한 도시 2개를 선택하시오.</span>
                                    </div>
                                    <div class="answer-map-type">
                                        <img src="/img/img02.png" alt="">
                                        <svg>
                                            <g>
                                                <circle cx="793" cy="777" r="20"></circle>
                                            </g>
                                            <g>
                                                <circle cx="170" cy="836" r="20"></circle>
                                            </g>
                                            <g>
                                                <circle cx="262" cy="722" r="20"></circle>
                                            </g>
                                            <g>
                                                <circle cx="485" cy="740" r="20"></circle>
                                            </g>
                                            <g>
                                                <circle cx="350" cy="840" r="20"></circle>
                                            </g>
                                        </svg>
                                    </div>
                                </div>
                                <p class="source">* 이 기출문제의 저작권과 재산권은 한국교육과정평가원에 있습니다.</p>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>
                    <div class="swiper-slide" id="item272" role="group" aria-label="5 / 10" style="width: 609px;">
                        <input type="hidden" name="item_id" value="272">
                        <input type="hidden" name="item_type" value="IT02">
                        <input type="hidden" name="student_answer" value="">

                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">5</span>
                                        <span class="txt">지구계에서 수권과 기권의 상호작용에 의해 나타나는 현상을 모두 선택하시오.</span>
                                    </div>
                                    <ul class="answer-input-type checkbox image" style="margin-bottom: 70px;">
                                        <li><input type="checkbox" name="answer_272" id="answer_272_checkbox01"
                                                   value="1">
                                            <label for="answer_272_checkbox01">✔</label>
                                            <span class="txt"><img src="/img/img03.png" alt=""></span></li>
                                        <li><input type="checkbox" name="answer_272" id="answer_272_checkbox02"
                                                   value="2">
                                            <label for="answer_272_checkbox02">✔</label>
                                            <span class="txt"><img src="/img/img04.png" alt=""></span></li>
                                        <li><input type="checkbox" name="answer_272" id="answer_272_checkbox03"
                                                   value="3">
                                            <label for="answer_272_checkbox03">✔</label>
                                            <span class="txt"><img src="/img/img05.png" alt=""></span></li>
                                    </ul>
                                </div>
                                <p class="source">* 이 기출문제의 저작권과 재산권은 한국교육과정평가원에 있습니다.</p>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>
                    <div class="swiper-slide" id="item273" role="group" aria-label="6 / 10" style="width: 609px;">
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">6</span>
                                        <span class="txt">다음 웹사이트에서 제시하는 3가지 정보를 활용하여 &lt;조건&gt;에 맞게 제시된 글을 완성하시오.</span>
                                    </div>
                                    <div class="bottom">
                                        <div class="tab-wrap">
                                            <div class="tab-btn">
                                                <a href="javascript:;" class="on">홍보 포스터</a>
                                                <a href="javascript:;">통계표</a>
                                                <a href="javascript:;">신문 기사</a>
                                            </div>
                                            <div class="tab-cnt">
                                                <div class="cnt on"><img src="/img/img06.png" alt=""></div>
                                                <div class="cnt"><img src="/img/img07.png" alt=""></div>
                                                <div class="cnt"><img src="/img/img08.png" alt=""></div>
                                            </div>
                                        </div>
                                        <div class="answer-drag-type">
                                            <span>조건</span>
                                            <ul class="list-text">
                                                <li>&lt;학생 글&gt;에 이어 두 문장 이상의 한 문단으로 작성할 것.</li>
                                                <li>반려견을 등록했을 때 얻을 수 있는 장점 두 가지를 &lt;자료&gt;의 '홍보 포스터'를 활용하여 쓸 것.</li>
                                                <li>반려견의 등록률을 높일 수 있는 구체적인 방안 두 가지를 &lt;자료&gt;의 '통계표'와 '신문 기사'에서 각각 한
                                                    가지씩 활용하여 쓸 것.
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="answer-input-type">
                                    <div>
                                        반려동물 등록제는 생후 2개월 이상 된 반려견을 기를 경우, 시.군.구청에 의무적으로 반려견을 등록하도록 하는 제도이다. 현재 각 지자체는
                                        단속을 통해 반려견을 등록하지 않은 사람들에게 과태료를 부과하고 있지만, 등록률은 여전히 낮은 편이다.
                                        <br>
                                        반려견을 등록하면
                                        <textarea name="" id="" cols="30" rows="10" placeholder="입력"></textarea>
                                    </div>
                                </div>
                                <p class="source">* 이 기출문제의 저작권과 재산권은 한국교육과정평가원에 있습니다.</p>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>
                    <div class="swiper-slide" id="item274" role="group" aria-label="7 / 10" style="width: 609px;">
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">7</span>
                                        <span class="txt">다음은 여행 관련 Q&A 게시판에 올라온 글이다. 아랫글의 내용과 일치하도록 &lt;조건&gt;에 맞게 단어를 끌어놓아 문장을 완성하시오.</span>
                                    </div>
                                    <div class="bottom">
                                        <div class="answer-drag-type">
                                            <span>조건</span>
                                            <ul class="list-text">
                                                <li>주어진 5개의 단어 중 3개만 사용할 것</li>
                                                <li>선택한 3개의 단어를 바르게 배열할 것</li>
                                                <li>단어의 형태를 변형하지 말 것</li>
                                            </ul>
                                        </div>
                                        <div class="drop-area">
                                            <img src="/img/img09.png" alt="">
                                            <div class="border">
                                                <span class="drop"></span>
                                                <span class="drop"></span>
                                                <span class="drop"></span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="answer-drag-type ml65">
                                    <span>보기</span>
                                    <ul class="btn-text">
                                        <li class="drag" draggable="true" data-name="familiar">familiar</li>
                                        <li class="drag" draggable="true" data-name="desert">desert</li>
                                        <li class="drag" draggable="true" data-name="laws">laws</li>
                                        <li class="drag" draggable="true" data-name="plans">plans</li>
                                        <li class="drag" draggable="true" data-name="some">some</li>
                                        <li class="drag" draggable="true" data-name="unusual">unusual</li>
                                    </ul>
                                </div>
                                <p class="source">* 이 기출문제의 저작권과 재산권은 한국교육과정평가원에 있습니다.</p>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>
                    </div>
                    <div class="swiper-slide" id="item275" role="group" aria-label="8 / 10" style="width: 609px;">
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">8</span>
                                        <span class="txt">그림은 밤에 학생 A~E가 나무 아래에서 대화하는 모습을 나타낸 것이다. A~E 중 이 나무의 호흡에 대해 옳게 말하고 있는 학생은?</span>
                                    </div>
                                    <div class="img-box w100">
                                        <img src="/img/img80.png" alt="">
                                    </div>
                                    <ul class="answer-input-type radio dummy_style" style="margin-bottom: 100px;">
                                        <li><input type="radio" name="answer_270" id="answer_275_radio01" value="1">
                                            <label for="answer_275_radio01">1</label>
                                            <span class="txt">A : 호흡을 해서 산소를 방출하고 있어.</span></li>
                                        <li><input type="radio" name="answer_270" id="answer_275_radio02" value="2">
                                            <label for="answer_275_radio02">2</label>
                                            <span class="txt">B : 호흡을 하는 데는 이산화탄소가 필요해.</span></li>
                                        <li><input type="radio" name="answer_270" id="answer_275_radio03" value="3">
                                            <label for="answer_275_radio03">3</label>
                                            <span class="txt">C : 지금은 어두워서 호흡을 할 수 없어.</span></li>
                                        <li><input type="radio" name="answer_270" id="answer_275_radio04" value="4">
                                            <label for="answer_275_radio04">4</label>
                                            <span class="txt">D : 호흡은 뿌리, 줄기, 잎에서 모두 일어나고 있어.</span></li>
                                        <li><input type="radio" name="answer_270" id="answer_275_radio05" value="5">
                                            <label for="answer_275_radio05">5</label>
                                            <span class="txt">E : 아침이 되면 광합성을 시작하고 호흡을 멈출 거야.</span></li>
                                    </ul>
                                </div>
                                <p class="source">* 이 기출문제의 저작권과 재산권은 한국교육과정평가원에 있습니다.</p>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>


                    </div>
                    <div class="swiper-slide" id="item276" role="group" aria-label="9 / 10" style="width: 609px;">
                        <input type="hidden" name="item_id" value="276">
                        <input type="hidden" name="item_type" value="TT03">
                        <input type="hidden" name="student_answer" value="">
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">9</span>
                                        <span class="txt">다음 대화를 읽고, 알맞은 문명의 위치를 표시하여 메시지를 보내시오.</span>
                                    </div>


                                    <div class="chat-area">
                                        <span class="txt">채팅방</span>
                                        <div class="answer-map-type">
                                            <img src="/img/img10.jpg" alt="">
                                            <svg>
                                                <g>
                                                    <circle cx="352" cy="493" r="15"></circle>
                                                </g>
                                                <g>
                                                    <circle cx="380" cy="550" r="15"></circle>
                                                </g>
                                                <g>
                                                    <circle cx="417" cy="520" r="15"></circle>
                                                </g>
                                                <g>
                                                    <circle cx="505" cy="538" r="15"></circle>
                                                </g>
                                                <g>
                                                    <circle cx="650" cy="512" r="15"></circle>
                                                </g>
                                            </svg>

                                        </div>
                                        <button class="send-btn">보내기</button>
                                    </div>


                                </div>
                                <p class="source">* 이 기출문제의 저작권과 재산권은 한국교육과정평가원에 있습니다.</p>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;" width="1260" height="1216"></canvas>
                        </div>


                    </div>
                    <div class="swiper-slide" id="item277" role="group" aria-label="10 / 10" style="width: 609px;">
                        <input type="hidden" name="item_id" value="277">
                        <input type="hidden" name="item_type" value="TT07">
                        <input type="hidden" name="student_answer" value="">


                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">10</span>
                                        <span class="txt">광물과 광물의 성질에 대한 실험을 알맞게 연결하시오.</span>
                                    </div>
                                </div>
                                <div class="answer-line-type">
                                    <div class="left-img">
                                        <img src="/img/img11.png" alt="">
                                        <img src="/img/img12.png" alt="">
                                        <img src="/img/img13.png" alt="">
                                    </div>
                                    <div class="form-joining"
                                         style="width:100%;display:flex;z-index:9999;position:relative;justify-content:center;padding-top:80px;">
                                        <span id="leftarea"></span>
                                        <span id="rightarea"></span>
                                        <div id="column1" style="width:150px;z-index:9999;">
                                            <div id="row1">
                                                <button id="1_1" row="1" column="1" class="dot" onclick="clickbtn(this)"
                                                        link_num="2_3" line_num=""></button>
                                            </div>
                                            <div id="row2">
                                                <button id="1_2" row="2" column="1" class="dot" onclick="clickbtn(this)"
                                                        link_num="2_2" line_num=""></button>
                                            </div>
                                            <div id="row3">
                                                <button id="1_3" row="3" column="1" class="dot" onclick="clickbtn(this)"
                                                        link_num="2_1" line_num=""></button>
                                            </div>
                                        </div>
                                        <div id="line"></div>
                                        <div id="column2" style="width:20px;z-index:9999;">
                                            <div id="row1">
                                                <button id="2_1" row="1" column="2" class="dot" onclick="clickbtn(this)"
                                                        link_num="1_3" line_num=""></button>
                                            </div>
                                            <div id="row2">
                                                <button id="2_2" row="2" column="2" class="dot" onclick="clickbtn(this)"
                                                        link_num="1_2" line_num=""></button>
                                            </div>
                                            <div id="row3">
                                                <button id="2_3" row="3" column="2" class="dot" onclick="clickbtn(this)"
                                                        link_num="1_1" line_num=""></button>
                                            </div>
                                        </div>
                                        <div id="column3" style="width:150px;display:none;z-index:9999;">
                                            <div id="row1">
                                                <button id="3_1" row="1" column="3" class="dot"
                                                        onclick="clickbtn(this)"></button>
                                            </div>
                                            <div id="row2">
                                                <button id="3_2" row="2" column="3" class="dot"
                                                        onclick="clickbtn(this)"></button>
                                            </div>
                                            <div id="row3">
                                                <button id="3_3" row="3" column="3" class="dot"
                                                        onclick="clickbtn(this)"></button>
                                            </div>
                                        </div>
                                        <div id="column4" style="width:20px;display:none;z-index:9999;">
                                            <div id="row1">
                                                <button id="4_1" row="1" column="4" class="dot"
                                                        onclick="clickbtn(this)"></button>
                                            </div>
                                            <div id="row2">
                                                <button id="4_2" row="2" column="4" class="dot"
                                                        onclick="clickbtn(this)"></button>
                                            </div>
                                            <div id="row3">
                                                <button id="4_3" row="3" column="4" class="dot"
                                                        onclick="clickbtn(this)"></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="right-txt" style="top: 70px; text-align: left; right: 28%">
                                        <span class="txt" style="margin-bottom: 190px;">석영</span>
                                        <span class="txt" style="margin-bottom: 190px;">방해석</span>
                                        <span class="txt">흑운모</span>
                                    </div>
                                </div>
                                <p class="source">* 이 기출문제의 저작권과 재산권은 한국교육과정평가원에 있습니다.</p>
                            </div>
                            <canvas class="sketchpad" style="cursor: crosshair;z-index: 10000;" width="1260"
                                    height="1216"></canvas>
                        </div>


                    </div>
                </div>
                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
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
    <input type="hidden" value="-1" id="start_number">

    <script>

        $('.send-btn').css('cursor', 'default');

        let saveTime = 60 * 60;
        let time = 60 * 60;

        const x = setInterval(function () {
            const min = parseInt(time / 60);
            const sec = parseInt(time % 60);
            document.getElementById('timer').innerText = min + ':' + leadingZeros(sec, 2);
            time--;
            if (time < 0) {
                clearInterval(x);
                alert("시험이 종료되었습니다. \nCBT 대표유형은 연습시험으로 \n별도의 채점결과를 제공하지 않습니다.");
                location.href = "../../..";
            }
        }, 1000);


        function completeExam() {
            if (confirm('시험이 종료되면 더 이상 시험을 응시할 수 없습니다.\n시험을 종료하시겠습니까?')) {
                alert("최종 제출되었습니다. \nCBT 대표유형은 연습시험으로 \n별도의 채점결과를 제공하지 않습니다.");
                location.href = "../../..";
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

        const enterFullscreenBtn = document.querySelector('.enterFullscreenBtn')
        const container = document.querySelector('.wrap')
        enterFullscreenBtn.addEventListener('click', e => {
            fullscreen(container)
        })
        const fullscreen = element => {
            if (element.requestFullscreen) return element.requestFullscreen()
            if (element.webkitRequestFullscreen) return element.webkitRequestFullscreen()
            if (element.mozRequestFullScreen) return element.mozRequestFullScreen()
            if (element.msRequestFullscreen) return element.msRequestFullscreen()
        }


        $(function () {
            var swiper = new Swiper(".mySwiper", {
                allowTouchMove: false,
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                    renderBullet: function (index, className) {
                        return '<span class="' + className + '">' + (index + 1) + "</span>";
                    },
                },
            });

            var nowIndex;

            swiper.on('transitionEnd', function (idx) {
                nowIndex = swiper.realIndex
                let $canvas;
                let context;

                $('.drawing-btn').on('click', function () {
                    $canvas = $('.swiper-slide ').eq(nowIndex).find($('.sketchpad'));
                    context = $canvas[0].getContext('2d');
                    let color = $('#ECD13F');
                    let lastEvent,
                        mousedown = false;

                    $canvas
                        .mousedown(function (event) {
                            lastEvent = event;
                            mousedown = true;
                        })
                        .mousemove(function (event) {
                            if (mousedown) {
                                // Draw lines
                                context.beginPath();
                                context.moveTo(lastEvent.offsetX, lastEvent.offsetY);
                                context.lineTo(event.offsetX, event.offsetY);
                                context.strokeStyle = 'rgba(255,255,0, 0.2)';
                                context.stroke();
                                context.lineWidth = 22;
                                lastEvent = event;
                            }
                        })
                        .mouseup(function (event) {
                            mousedown = false;
                        })

                        .mouseleave(function (event) {
                            mousedown = false;
                        });

                    _this.toggleClass('active');

                    if (_this.hasClass('active')) {
                        clearBtn.show('slide', 400);
                        $canvas.show();
                        $('.sketchpad').removeClass('disabled');
                    } else {
                        clearBtn.hide('slide', 400);
                        context.clearRect(0, 0, 1260, 1216);
                        $canvas.hide();
                        $('.sketchpad').addClass('disabled');
                    }

                })

                $('.clear-btn').on('click', function () {
                    context.clearRect(0, 0, 1260, 1216);
                })
            })

            // drag and drop
            let txt;
            $('.drag').on({
                //드래그 시작시 요소 id 저장
                'dragstart': function (e) {
                    txt = $(this).text();
                    $(this).css('border', 'solid 1px #ccc');
                },
                //드래그 종료
                'dragend': function (e) {

                    // let name = $('.drop.on').find('span').text();
                    // $(".drag[data-name='" + name + "']").css('opacity', '0.5')

                    $(this).attr('draggable', false);
                    let name = $(this).data('name');
                    $(".drag[data-name='" + name + "']").css('opacity', '0.5')

                    console.log(name)

                }
            });

            $('.drop').on({
                'dragenter': function (e) {

                },
                //브라우저 표중 동작 취소
                'dragover': function (e) {
                    e.preventDefault();
                },
                'drop': function (e) {
                    $(this).append('<span class="txt">' + txt + '</span>')
                    e.preventDefault();
                    let num = $(this).find('span').length;
                    let name = $(this).find('span').text();

                    $(this).addClass('on')

                    if (num > 1) {
                        let text = $(this).find('span:first-child()').text();
                        $(this).find('span:first-child()').remove();
                        $(".drag[data-name='" + text + "']").css('opacity', '1')
                    }

                    $(this).on('click', function () {
                        let text = $(this).find('span').text();
                        let _idx = $(this).find('span').parents('.drop').index();
                        $(this).find('span').remove();
                        $(".drag[data-name='" + text + "']").css('opacity', '1');
                        $(".drag[data-name='" + text + "']").attr('draggable', true);

                        $(this).removeClass('on')
                    })
                }
            });

            $('svg g').on('click', function () {
                $(this).toggleClass('on');
            })

            //tab
            $('.tab-btn a').on('click', function () {
                let _this = $(this)
                let _idx = $(this).index();

                $('.tab-btn a').removeClass('on');
                $(this).addClass('on');

                $('.tab-cnt .cnt').removeClass('on');
                $('.tab-cnt .cnt').eq(_idx).addClass('on');
            })

            //line
            let btn = $('.btn');
            let leftBtn = $('.left');
            let rightBtn = $('.right');
            let line = $('line')
            let x1, y1, x2, y2;


            leftBtn.on('click', function (e) {
                let _this = $(this);
                x1 = _this.position().left;
                y1 = _this.position().top + 10;

            })

            rightBtn.on('click', function (e) {
                let _this = $(this);
                let _idx = _this.index();

                x2 = _this.position().left - 20;
                y2 = _this.position().top + 10;


            })

            btn.on('click', function () {
                $(this).siblings('.btn').removeClass('active');
                $(this).toggleClass('active')

                if ($('.left.active').length == 1 && $('.right.active').length == 1) {
                    $('svg').append('<line x1=' + x1 + ' y1=' + y1 + ' x2=' + x2 + ' y2=' + y2 + '></line>');
                    $(".drawline-wrap").html($(".drawline-wrap").html());
                    $('.left , .right').removeClass('active')
                }
            })

            $('body').on('click', 'line', function () {
                let _this = $(this);

                _this.remove();
            })

            //popup
            let popBtn = $('.pop-btn');
            let popCnt = $('.pop-memo');
            let closeBtn = $('.pop-close');
            let drawingBtn = $('.drawing-btn');
            let clearBtn = $('.clear-btn')
            let page = $('.swiper-pagination-bullet');
            let $canvas = $('.sketchpad');
            let context = $canvas[0].getContext('2d');


            function popOpen() {
                let _this = $(this);
                _this.toggleClass('active');

                if (_this.hasClass('active')) {
                    popCnt.show();
                } else {
                    popCnt.hide();
                }

            }

            function popClose() {
                popCnt.hide();
                popBtn.removeClass('active');
            }

            function canvasOpen() {
                let _this = $(this);
                //canvas2
                let color = $('#ECD13F');
                let lastEvent,
                    mousedown = false;


                $canvas
                    .mousedown(function (event) {

                        lastEvent = event;
                        mousedown = true;
                    })
                    .mousemove(function (event) {
                        if (mousedown) {
                            // Draw lines
                            context.beginPath();
                            context.moveTo(lastEvent.offsetX, lastEvent.offsetY);
                            context.lineTo(event.offsetX, event.offsetY);
                            context.strokeStyle = 'rgba(255,255,0, 0.2)';
                            context.stroke();
                            context.lineWidth = 22;

                            lastEvent = event;
                        }
                    })
                    .mouseup(function (event) {
                        mousedown = false;


                    })
                    .mouseleave(function (event) {
                        mousedown = false;
                    });

                _this.toggleClass('active');

                if (_this.hasClass('active')) {
                    clearBtn.show('slide', 400);
                    $canvas.show();
                    $('.sketchpad').removeClass('disabled');
                } else {
                    clearBtn.hide('slide', 400);
                    $canvas.hide();
                    $('.sketchpad').addClass('disabled');
                }


            }

            function canvasClear() {
                context.clearRect(0, 0, 1260, 1216);
            }

            function canvasIng() {
                if (drawingBtn.hasClass('active')) {
                    let _this = $(this)
                    let _idx = $(this).index();
                    $canvas = $('.swiper-slide').eq(_idx).find('.sketchpad');
                    context = $canvas[0].getContext('2d');
                    $('.swiper-slide').find($canvas).hide();
                    $('.swiper-slide').eq(_idx).find($canvas).show();
                }
            }

            popBtn.on('click', popOpen)
            closeBtn.on('click', popClose)
            drawingBtn.on('click', canvasOpen)
            clearBtn.on('click', canvasClear)
            page.on('click', canvasIng)


        })

        // canvas
        $(document).ready(function () {
            var drawCanvas = document.getElementById('drawCanvas');
            var drawBackup = new Array();
            if (typeof drawCanvas.getContext == 'function') {
                var ctx = drawCanvas.getContext('2d');
                var isDraw = false;
                var width = $('#width').val();
                var color = $('#color').val();
                var pDraw = $('#drawCanvas').offset();
                var currP = null;

                $('#width').bind('change', function () {
                    width = $('#width').val();
                });
                $('#color').bind('change', function () {
                    color = $('#color').val();
                });

                // 저장된 이미지 호출
                if (localStorage['imgCanvas']) {
                    loadImage();
                } else {
                    ctx.clearRect(0, 0, drawCanvas.width, drawCanvas.height);
                }

                // Event (마우스)
                $('#drawCanvas').bind('mousedown', function (e) {
                    if (e.button === 0) {
                        saveCanvas();
                        e.preventDefault();
                        ctx.beginPath();
                        isDraw = true;
                    }
                });
                $('#drawCanvas').bind('mousemove', function (e) {
                    var event = e.originalEvent;
                    e.preventDefault();
                    currP = {X: event.offsetX, Y: event.offsetY};
                    if (isDraw) draw_line(currP);
                });
                $('#drawCanvas').bind('mouseup', function (e) {
                    e.preventDefault();
                    isDraw = false;
                });
                $('#drawCanvas').bind('mouseleave', function (e) {
                    isDraw = false;
                });

                // Event (터치스크린)
                $('#drawCanvas').bind('touchstart', function (e) {
                    saveCanvas();
                    e.preventDefault();
                    ctx.beginPath();
                });
                $('#drawCanvas').bind('touchmove', function (e) {
                    var event = e.originalEvent;
                    e.preventDefault();
                    currP = {X: event.touches[0].pageX - pDraw.left, Y: event.touches[0].pageY - pDraw.top};
                    draw_line(currP);
                });
                $('#drawCanvas').bind('touchend', function (e) {
                    e.preventDefault();
                });

                // 선 그리기
                function draw_line(p) {
                    ctx.lineWidth = width;
                    ctx.lineCap = 'round';
                    ctx.lineTo(p.X, p.Y);
                    ctx.moveTo(p.X, p.Y);
                    ctx.strokeStyle = color;
                    ctx.stroke();
                }

                function loadImage() { // reload from localStorage
                    var img = new Image();
                    img.onload = function () {
                        ctx.drawImage(img, 0, 0);
                    }
                    img.src = localStorage.getItem('imgCanvas');
                }

                function clearCanvas() {
                    ctx.clearRect(0, 0, drawCanvas.width, drawCanvas.height);
                    ctx.beginPath();
                    localStorage.removeItem('imgCanvas');
                }

                function saveCanvas() {
                    drawBackup.push(ctx.getImageData(0, 0, drawCanvas.width, drawCanvas.height));
                }

                $('#btnClea').click(function () {
                    clearCanvas();
                });

            }

            $('svg line').on('click', function () {
                $(this).remove();
            })
        });

    </script>

</div>
</body>
</html>