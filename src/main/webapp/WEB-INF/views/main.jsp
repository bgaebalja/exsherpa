<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>학업성취도평가</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="https://kit.fontawesome.com/266dd736a0.js" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="js/main.js"></script>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <header id="header">
        <nav class="menu">
            <ul>
                <li><a href="#none">학업성취도 평가대비 교재 소개</a></li>
                <li><a href="#none">밀크T아이</a></li>
                <li><a href="#none">밀크T초등</a></li>
                <li><a href="#none">밀크T중등</a></li>
                <li><a href="#none">밀크T고등</a></li>
                <li><a href="#none"><i class="fa-regular fa-star mr05" style="color: #ffd800;"></i>즐겨찾기 추가</a></li>
            </ul>
        </nav>
    </header>
    <!-- container -->
    <div class="container">
        <div class="tit-wrap">
            <span class="tit">국가수준 학업성취도평가 대비 시스템</span>
        </div>
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
                        <a href="#">
                            <span class="tit">실전시험 1회</span>
                            <span class="txt">기출문제를 CBT로<br>재구성한 문제로<br>실전 모의고사 응시</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="tit">실전시험 2회</span>
                            <span class="txt">적중률 높은<br>예상문제를 바탕으로<br>실전 모의고사 응시</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="tit">시험결과 REPORT</span>
                            <span class="txt">나의 성취도 파악과<br>취약점 분석,<br>시험 대비 학습 </span>
                        </a>
                    </li>
                </ul>
                <a href="#" class="ft-btn">교재구입 인증하기</a>
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
                                <span class="txt">국가수준 학업성취도 평가 대비 시스템 공지사항 입니다.</span>
                            </div>
                            <span class="date">2022.08.10</span>
                        </div>
                        <div class="swiper-slide">
                            <div class="tit">
                                <em class="cate">오픈</em>
                                <span class="txt">국가수준 학업성취도 평가 대비 시스템 공지사항 입니다.</span>
                            </div>
                            <span class="date">2022.08.11</span>
                        </div>
                        <div class="swiper-slide">
                            <div class="tit">
                                <em class="cate">오픈</em>
                                <span class="txt">국가수준 학업성취도 평가 대비 시스템 공지사항 입니다.</span>
                            </div>
                            <span class="date">2022.08.12</span>
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
</body>
</html>