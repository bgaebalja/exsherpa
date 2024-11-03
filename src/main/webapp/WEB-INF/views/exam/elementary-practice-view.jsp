<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온라인 학업성취도 평가 (CBT 대표유형(초등))</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="/css/reset.css?ver=20241103"/>
    <link rel="stylesheet" href="/css/paper.css?ver=20241103"/>
    <link rel="icon" href="/img/fav.png">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <!-- <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css"> -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&amp;display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.0.0-alpha1.js"></script> -->
    <script src="/js/line.js?ver=20241103"></script>
    <script src="/js/paper.js?ver=20241103"></script>
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
</head>
<body>
<div id="MathJax_Message" style="display: none;"></div>
<div class="wrap">
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
                <span class="txt">CBT 대표유형(초등)</span>
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
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">1</span>
                                        <span class="txt">문장에서의 역할이 [자료]의 밑줄 친 부분과 같은 것을 선택하시오.</span>
                                    </div>
                                    <div class="answer-drag-type ml65">
                                        <span>자료</span>
                                        <p class="btn-text">4학년 학생들이 학교 지정 병원에서 <em>건강 검진을</em> 받았다.</p>
                                    </div>
                                </div>
                                <ul class="answer-input-type radio">
                                    <li>
                                        <input type="radio" name="answer" id="answer_radio01" value="0">
                                        <label for="answer_radio01">1</label>
                                        <span class="txt">동생은 <em>초등학생이다.</em></span>
                                    </li>
                                    <li>
                                        <input type="radio" name="answer" id="answer_radio02" value="1">
                                        <label for="answer_radio02">2</label>
                                        <span class="txt"><em style="padding-left: 0px">농부가</em> 황소를 끌고 간다.</span>
                                    </li>
                                    <li>
                                        <input type="radio" name="answer" id="answer_radio03" value="2">
                                        <label for="answer_radio03">3</label>
                                        <span class="txt">토끼가 <em>깡충깡충</em> 뛰어갑니다.</span>
                                    </li>
                                    <li>
                                        <input type="radio" name="answer" id="answer_radio04" value="3">
                                        <label for="answer_radio04">4</label>
                                        <span class="txt">지난주 학생회에서 <em>양로원을</em> 방문하였다.</span>
                                    </li>
                                    <li>
                                        <input type="radio" name="answer" id="answer_radio5" value="4">
                                        <label for="answer_radio5">5</label>
                                        <span class="txt">어디선가 <em>아름다운</em> 피리 소리가 들렸습니다.</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide swiper-slide-next" id="item269" role="group" aria-label="2 / 10"
                         style="width: 609px;">
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">2</span>
                                        <span class="txt">다음 대화를 참고하여 Jinho에게 보낼 메시지의 내용을 고르시오.</span>
                                    </div>
                                    <div class="chat-area">
                                        <span class="txt">채팅방</span>
                                        <img src="/img/img14.png" alt="">
                                        <p class="strong-txt">채팅 중입니다. 다음에 이어질 말로 적절한 것을 고르시오.</p>
                                        <ul class="answer-input-type text">
                                            <li>
                                                <input type="radio" name="answer" id="answer_radio06" value="0">
                                                <label for="answer_radio06">Sounds good!</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="answer" id="answer_radio07" value="1">
                                                <label for="answer_radio07">Sorry, you can’t.</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="answer" id="answer_radio08" value="2">
                                                <label for="answer_radio08">I’m fine.</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="answer" id="answer_radio09" value="3">
                                                <label for="answer_radio09">I’m late.</label>
                                            </li>
                                        </ul>
                                        <button class="send-btn">보내기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide" id="item270" role="group" aria-label="3 / 10" style="width: 609px;">
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">3</span>
                                        <span class="txt">다음은 태양과 행성 사이의 거리를 나타낸 표이다. 표를 보고 물음에 알맞은 말을 쓰시오.</span>
                                    </div>
                                    <div class="img" style="text-align: center;">
                                        <img src="/img/ctb_초등_문제3번.png">
                                    </div>
                                    <div class="answer-textarea-type"
                                         style="display: flex; align-items: center; justify-content: space-between">
                                        태양과 금성 사이의 거리를 읽어서 써보시오.
                                        <div style="text-align: right">
                                            <span>(</span>
                                            <input type="text" placeholder="입력" maxlength="200"
                                                   style="text-align: center; border: none;">
                                            <span>)</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide" id="item271" role="group" aria-label="4 / 10" style="width: 609px;">
                        <div class="page">
                            <div class="inner">
                                <div class="question">
                                    <div class="top">
                                        <span class="num">4</span>
                                        <span class="txt">다음 글의 빈칸에 들어갈 시간을 나타내는 말로 알맞은 것을 선택하시오.</span>
                                    </div>
                                    <div class="img-box">
                                        <img src="/img/img18.png" alt="">
                                        <div class="select-group cbt1">
                                            <select name="" style="width: 90px;">
                                                <option value="" selected disabled>㉠</option>
                                                <option value="">그날 오후</option>
                                                <option value="">지난 달</option>
                                                <option value="">보름 전쯤</option>
                                                <option value="">내일 모레</option>
                                            </select>
                                            <select name="" style="width: 90px;">
                                                <option value="" selected disabled>㉡</option>
                                                <option value="">내후년</option>
                                                <option value="">내일 밤</option>
                                                <option value="">그날 오후</option>
                                                <option value="">보름 전쯤</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                                    <ul class="answer-input-type checkbox image">
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

        $(function () {
            const maxLength = 200;

            var reg = /[\{\}\[\]\/;:|\)*~`^_+┼<>@#$%&\\\(\=]/gi;

            $('input[type=text]').bind("keyup", function () {
                $(this).val($(this).val().replace(reg, ""));

                if ($(this).val().length > maxLength) {
                    alert('글자 수 제한을 초과하였습니다.');
                    $(this).val($(this).val().substring(0, maxLength));
                }
            })

            $('textarea').bind("keyup", function () {
                $(this).val($(this).val().replace(reg, ""));

                if ($(this).val().length > maxLength) {
                    alert('글자 수 제한을 초과하였습니다.');
                    $(this).val($(this).val().substring(0, maxLength));
                }
            })

            $('input[type=text]').attr("maxlength", maxLength);
            $('textarea').attr("maxlength", maxLength);
        })


        $('.send-btn').css('cursor', 'default')

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


            // drag and drop
            let txt;
            $('.btn-text .drag').on({
                //드래그 시작시 요소 id 저장
                'dragstart': function (e) {
                    txt = $(this).text();
                    $(this).css('border', 'solid 1px #ccc');
                },
                //드래그 종료
                'dragend': function (e) {
                    let name = $('.drop').find('span').text();
                    $(".drag[data-name='" + name + "']").css('opacity', '0.5')
                }
            });

            $('.text-box .drop').on({
                'dragenter': function (e) {
                    $(this).addClass('on');
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

                    if (num > 1) {
                        let text = $(this).find('span:first-child()').text();
                        $(this).find('span:first-child()').remove();
                        $(".drag[data-name='" + text + "']").css('opacity', '1')
                    }

                    $(this).find('span').on('click', function () {
                        let text = $(this).text();
                        $(this).remove();
                        $(".drag[data-name='" + text + "']").css('opacity', '1')
                        $('.drop').removeClass('on')
                    })
                }
            });

            //image type
            let img
            $('.btn-img .drag').on({
                //드래그 시작시 요소 id 저장
                'dragstart': function (e) {
                    $(this).css('border', '0');
                    img = $(this).find('img');
                    $(this).siblings('.drag').removeClass('active')
                    $(this).addClass('active');
                    $('img').removeClass('this')
                    $(this).find('img').addClass('this');
                },
                //드래그 종료
                'dragend': function (e) {

                }
            });

            $('.drop-area-type02 .drop').on({
                'dragstart': function (e) {
                    e.preventDefault();
                },
                'dragenter': function (e) {
                    $(this).addClass('on');
                },
                //브라우저 표중 동작 취소
                'dragover': function (e) {
                    e.preventDefault();
                },
                'drop': function (e) {
                    $(this).append(img);
                    e.preventDefault();
                    let num = $(this).find('img').length;
                    let name = $(this).find('span').text();

                    if (num > 1) {
                        img = $(this).find('img:first-child()');
                        let _idx = $(this).find('img:first-child()').data('num');
                        $(this).find('img:first-child()').remove();

                        $('.drag').eq(_idx).append(img);
                    }

                    $(this).on('click', function () {
                        let _idx = $(this).find('img').data('num')
                        img = $(this).find('img');
                        img.remove();
                        $('.drag').eq(_idx).append(img);
                    })
                }
            });

            $('svg g').on('click', function () {
                $(this).toggleClass('on');
            })

            $('.tab-btn a').on('click', function () {
                let _this = $(this)
                let _idx = $(this).index();

                $('.tab-btn a').removeClass('on');
                $(this).addClass('on');

                $('.tab-cnt .cnt').removeClass('on');
                $('.tab-cnt .cnt').eq(_idx).addClass('on');
            })

            //line
            let dot = $('.dot');
            let topBtn = $('.top');
            let btmBtn = $('.btm');
            let line = $('line')
            let x1, y1, x2, y2;


            topBtn.on('click', function (e) {
                let _this = $(this);
                x1 = _this.position().left;
                y1 = _this.position().top + 10;

            })

            btmBtn.on('click', function (e) {
                let _this = $(this);
                let _idx = _this.index();

                x2 = _this.position().left - 20;
                y2 = _this.position().top + 10;


            })

            dot.on('click', function () {
                $(this).siblings('.dot').removeClass('active');
                $(this).toggleClass('active')

                if ($('.top.active').length == 1 && $('.btm.active').length == 1) {
                    $('svg').append('<line x1=' + x1 + ' y1=' + y1 + ' x2=' + x2 + ' y2=' + y2 + '></line>');
                    $(".drawline-wrap").html($(".drawline-wrap").html());
                    $('.top , .btm').removeClass('active')
                }
            })

            $('body').on('click', 'line', function () {
                let _this = $(this);

                _this.remove();
            })
        });

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
        });

    </script>

</div>
</body>
</html>