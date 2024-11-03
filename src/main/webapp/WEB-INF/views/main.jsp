<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="https://kit.fontawesome.com/266dd736a0.js" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="js/main.js"></script>
</head>
<body>
<main id="main">
    <jsp:include page="./header.jsp" flush="true">
        <jsp:param name="examRound" value="${examInformationResponse.examRound}"/>
    </jsp:include>

    <div class="wrap">
        <!-- container -->
        <div class="container">
            <div class="tab-wrap">
                <!-- S: 로그인 후 노출되는 타이틀 주석-->
                <!--<ul class="tab-btn">
                    <li class="on">
                        <a href="#">초등</a>
                    </li>
                </ul>-->
                <!-- E: 로그인 후 노출되는 타이틀 주석 -->
                <div class="tab-cnt on">
                    <ul class="cnt-list">
                        <!--S: 220808 CBT 스타일 추가 -->
                        <li class="cbt-box">
                            <a href="#">
                                <span class="tit">CBT기능/유형 연습</span>
                                <span class="txt">실제 평가 시스템과<br>100% 동일한 화면으로<br>기능/ 유형 연습</span>
                            </a>
                            <div class="cbt-overlay">
                                <div class="cbt-btn-list">
                                    <a href="user/exam/user-exam-cbt?school_level=SL01">초등</a>
                                    <a href="user/exam/user-exam-cbt?school_level=SL02">중등</a>
                                    <a href="user/exam/user-exam-cbt?school_level=SL03">고등</a>
                                </div>
                            </div>
                        </li>
                        <!--E: 220808 CBT 스타일 추가 -->
                        <li>
                            <!-- TODO: 로그인한 회원의 초등, 중/고등 여부 연결 -->
                            <a href="user/exam/user-exam-subject?school_level=SL02&exam_round=1&year=2024">
                                <span class="tit">기출 실전시험</span>
                                <span class="txt">기출문제를 CBT로<br>재구성한 문제로<br>실전 모의고사 응시</span>
                            </a>
                        </li>
                        <li>
                            <!-- TODO: 로그인한 회원의 초등, 중/고등 여부 연결 -->
                            <a href="user/exam/user-exam-subject?school_level=SL02&exam_round=2&year=2024">
                                <span class="tit">B셀파 실전시험</span>
                                <span class="txt">B셀파에서 제작된<br>예상문제를 바탕으로<br>실전 모의고사 응시</span>
                            </a>
                        </li>
                        <li>
                            <!-- TODO: 로그인한 회원의 초등, 중/고등 여부 연결 -->
                            <a href="user/exam/report?school_level=SL02&year=2024">
                                <span class="tit">시험결과 REPORT</span>
                                <span class="txt">나의 성취도 파악과<br>취약점 분석,<br>시험 대비 학습 </span>
                            </a>
                        </li>
                    </ul>
                    <a href="https://bsherpa.com" class="ft-btn">B셀파 방문하기</a>
                </div>
            </div>
        </div>
        <!-- footer -->
        <div class="footer">
            <div class="notice-list">
                <div class="inner">
						<span class="tit">
							공지사항
							<em>NOTICE</em>
						</span>
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="tit">
                                    <em class="cate">오픈</em>
                                    <span class="txt">EX셀파 공지사항 입니다.</span>
                                </div>
                                <span class="date">2024.11.03</span>
                            </div>
                            <div class="swiper-slide">
                                <div class="tit">
                                    <em class="cate">오픈</em>
                                    <span class="txt">EX셀파 공지사항 입니다.</span>
                                </div>
                                <span class="date">2024.11.04</span>
                            </div>
                            <div class="swiper-slide">
                                <div class="tit">
                                    <em class="cate">오픈</em>
                                    <span class="txt">EX셀파 공지사항 입니다.</span>
                                </div>
                                <span class="date">2024.11.05</span>
                            </div>
                        </div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>
                </div>
            </div>
            <span class="copyright">COPYRIGHT(C) 2022 by KICE. ALL RIGHTS RESERVED.</span>
        </div>
    </div>
</main>
</body>
</html>