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
    <title>온라인 학업성취도 평가 (실전시험Ⅱ)</title>

    <link rel="icon" href="/img/fav.png">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="<c:url value="/css/reset.css"><c:param name="ver" value="${nowDate}"/></c:url>"/>
    <link rel="stylesheet" href="<c:url value="/css/style.css"><c:param name="ver" value="${nowDate}"/></c:url>">
    <link rel="stylesheet" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="https://webfontworld.github.io/SCoreDream/SCoreDream.css">

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


</head>
<body>
<main id="main">

    <!-- 상단 공통 영역 -->
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
                            <a href="/user/exam/user-exam-cbt?school_level=${examInformationResponse.schoolLevel}"
                               class="tlabel2 label">CBT 대표유형</a>
                        </li>
                        <li id="tab2" class="tab_btn">
                            <a href="/user/exam/user-exam-subject?school_level=${params.school_level}&exam_round=1"
                               class="tlabel2 label">실전시험Ⅰ</a>
                        </li>
                        <li id="tab3" class="tab_btn">
                            <input type="radio" checked name="tabmenu" id="tmenu3" class="tab">
                            <label class="tlabel3 label" for="tmenu3">실전시험Ⅱ</label>
                            <div class="tab_con">
                                <div class="cnt_box">
                                    <div class="page_tit pb20"><em>동영상</em> 및 <em>소리</em> 테스트</div>
                                    <p class="page_info pb40">동영상 테스트를 실시하여 주시기 바랍니다.<br>
                                        이상이 없으면 <em>[이상 없습니다] 버튼을 클릭</em>하여 주시기 바랍니다.
                                    </p>

                                    <div class="media_box">
                                        <p class="page_info2 mb40">아래의 동영상을 플레이하여 <em>영상 및 소리가 정상적으로 나오는지 확인</em>해 주십시오.
                                        </p>

                                        <div class="video">
                                            <video controls width="620" height="380">
                                                <source src="/video/13번%20영상_편집본.mp4" type="video/mp4">
                                            </video>
                                        </div>
                                    </div>


                                    <a class="btn chkBtn  mt60"
                                       href="/user/exam/user-exam-notice?school_level=${examInformationResponse.schoolLevel}&exam_round=${examInformationResponse.examRound}&year=${examInformationResponse.year}&exam_id=${examInformationResponse.examId}">이상
                                        없습니다</a>
                                </div>
                            </div>
                        </li>
                        <li id="tab4" class="tab_btn">
                            <a href="/user/exam/report?school_level=${examInformationResponse.schoolLevel}&year=${examInformationResponse.year}"
                               class="tlabel2 label">Report</a>
                        </li>
                    </ul>
                </div>

            </div>

        </div>

</main>

</body>
<script>

    /*const tab1 = document.getElementById("tab1");

    tab1.addEventListener('click', function () {
        location.href="/user/exam/user-exam-subject";
    });*/

    const videoList = document.querySelectorAll('video');
    videoList.forEach((item, index) => {
        item.controlsList.add('noplaybackrate');
        item.controlsList.add('nodownload');
        item.disablePictureInPicture = true;
    });

    function moveReport() {
        event.preventDefault();
        location.href = '/user/exam/report';
    }

</script>

</html>
