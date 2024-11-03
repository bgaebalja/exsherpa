<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:formatDate value="${today}" pattern="yyyyMMdd" var="nowDate"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온라인 학업성취도 평가 (CBT 대표유형)</title>

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="<c:url value="/css/reset.css"><c:param name="ver" value="${nowDate}"/></c:url>"/>
    <link rel="stylesheet" href="<c:url value="/css/style.css"><c:param name="ver" value="${nowDate}"/></c:url>">
    <link rel="stylesheet" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="https://webfontworld.github.io/SCoreDream/SCoreDream.css">
    <link rel="icon" href="/img/fav.png">

    <script type="text/javascript" src="/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.min.js"></script>
    <script type="text/javascript"
            src="<c:url value="/js/admin.js"><c:param name="ver" value="${nowDate}"/></c:url>"></script>
    <script type="text/javascript" src="/js/swiper.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://danml.com/js/download.js"></script>
    <script src="<c:url value="/js/common.js"><c:param name="ver" value="${nowDate}"/></c:url>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"
            integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="<c:url value="/js/line.js"><c:param name="ver" value="${nowDate}"/></c:url>"></script>
    <script src="https://kit.fontawesome.com/266dd736a0.js" crossorigin="anonymous"></script>
    <script src="<c:url value="/js/main.js"><c:param name="ver" value="${nowDate}"/></c:url>"></script>

    <style>
        .testBtn {
            font-size: 18px !important;
        }
    </style>
</head>
<body>
<main id="main">

    <!-- 상단 공통 영역 -->
    <jsp:include page="../../header.jsp" flush="true">
        <jsp:param name="examRound" value="${param.exam_round}"/>
    </jsp:include>

    <!-- 컨텐츠 영역 -->
    <div id="content">
        <div class="con_case">
            <div class="container">
                <div class="tabmenu">
                    <ul class="justify_center">
                        <li id="tab1" class="tab_btn">
                            <input type="radio" checked name="tabmenu" id="tmenu1" class="tab">
                            <label class="tlabel1 label" for="tmenu1">CBT 대표유형</label>
                            <div class="tab_con">
                                <div class="cnt_box">
                                    <div class="page_tit pb20"><em>CBT 대표 유형 테스트</em></div>
                                    <p class="page_info pb30">아래의 내용을 확인한 후, [시험 시작] 버튼을 클릭하면 시험이 시작됩니다.</p>


                                    <p class="mt30">해당 테스트는 CBT 기능과 문제 유형을 연습하기 위한 목적으로,</p>
                                    <p class="mb30" style="color:#FF0000; text-decoration: underline">정답 확인 및 풀이 결과를
                                        제공하지 않습니다.
                                    </p>

                                    <div class="test_guide flex_end">
                                        <ul>꼭-확인하세요.
                                            <li><em>동영상, 듣기 내용은 한 번만 들려주는 문항이 있습니다. </em> &nbsp; 잘 청취하도록 유의 바랍니다.</li>
                                            <li><em>헤드셋 혹은 이어폰을 착용</em>해 주시기 바랍니다.</li>
                                        </ul>
                                        <c:choose>
                                            <c:when test="${schoolLevel eq 'SL01'}">
                                                <a href="/user/exam/user/viewer2">
                                                    <div class="btn testBtn" id="testBtn">시험 시작</div>
                                                </a>
                                            </c:when>
                                            <c:when test="${schoolLevel eq 'SL02'}">
                                                <a href="/user/exam/user/viewer1">
                                                    <div class="btn testBtn" id="testBtn">시험 시작</div>
                                                </a>
                                            </c:when>
                                            <c:when test="${schoolLevel eq 'SL03'}">
                                                <a href="/user/exam/user/viewer1">
                                                    <div class="btn testBtn" id="testBtn">시험 시작</div>
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="#none">
                                                    <div class="btn testBtn" id="testBtn">시험 시작</div>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li id="tab2" class="tab_btn">
                            <!-- TODO: 로그인한 회원의 초등, 중/고등 여부 연결 -->
                            <a href="/user/exam/user-exam-subject?school_level=SL02&exam_round=1&year=2024"
                               class="tlabel2 label">실전시험Ⅰ</a>
                        </li>
                        <li id="tab3" class="tab_btn">
                            <!-- TODO: 로그인한 회원의 초등, 중/고등 여부 연결 -->
                            <a href="/user/exam/user-exam-subject?&school_level=SL02&exam_round=2&year=2024"
                               class="tlabel2 label">실전시험Ⅱ</a>
                            <%--                                    href="/user/exam/user-exam-subject?school_level=${params.schoolLevel}&exam_round=2" class="tlabel2 label">실전시험Ⅱ</a>--%>
                        </li>
                        <!-- TODO: 로그인한 회원의 초등, 중/고등 여부 연결 -->
                        <li id="tab4" class="tab_btn">
                            <a href="/user/exam/report?school_level=SL02&year=2024" class="tlabel2 label">Report</a>
                        </li>
                    </ul>
                </div>

            </div>

        </div>
    </div>
</main>

</body>
<script>
    function tempSecondRound() {
        alert('실전시험Ⅱ는 8월 18일부터 확인이 가능합니다.');
    }
</script>
</html>
