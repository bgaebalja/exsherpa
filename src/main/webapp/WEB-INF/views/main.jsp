<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="icon" href="/img/fav.png">
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
        <div class="container">
            <div class="tab-wrap">
                <div class="tab-cnt on">
                    <ul class="cnt-list">
                        <li>
                            <a href="user/exam/user-exam-subject?school_level=SL02&exam_round=1&year=2024">
                                <span class="tit">기출 문제 풀이</span>
                                <span class="txt">기출 문제를 CBT로<br>재구성한 문제를 통한<br>실전 문제 풀이</span>
                            </a>
                        </li>
                        <li>
                            <a href="user/exam/user-exam-subject?school_level=SL02&exam_round=2&year=2024">
                                <span class="tit">B셀파 문제 풀이</span>
                                <span class="txt">B셀파에서 제작된<br>예상 문제를 바탕으로 한<br>실전 문제 풀이</span>
                            </a>
                        </li>
                        <li>
                            <a href="user/exam/report?school_level=SL02&year=2024">
                                <span class="tit">시험 결과 REPORT</span>
                                <span class="txt">나의 성취도 파악과<br>취약점 분석,<br>시험 대비 학습 </span>
                            </a>
                        </li>
                    </ul>
                    <a href="https://bsherpa.com" class="ft-btn">B셀파 방문하기</a>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>