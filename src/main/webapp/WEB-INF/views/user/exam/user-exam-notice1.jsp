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
    <title>EX셀파 (기출 문제 풀이)</title>

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
    <script src="<c:url value="/js/main.js"><c:param name="ver" value="${nowDate}"/></c:url>"></script>

</head>
<body>
<main id="main">

    <!-- 상단 공통 영역 -->
    <!-- 상단 공통 영역 -->
    <jsp:include page="../../header.jsp" flush="true">
        <jsp:param name="examRound" value="${examInformationResponse.examRound}"/>
    </jsp:include>

    <!-- 컨텐츠 영역 -->
    <div id="content">
        <div class="con_case">
            <div class="container">
                <div class="tabmenu">
                    <ul class="justify_center">
                        <li id="tab2" class="tab_btn">
                            <input type="radio" checked name="tabmenu" id="tmenu2" class="tab">
                            <label class="tlabel2 label" for="tmenu2">기출 문제 풀이</label>
                            <div class="tab_con">
                                <div class="cnt_box">
                                    <div class="page_tit pb20"><em>주의사항</em> 및 <em>부정행위</em>안내</div>
                                    <p class="page_info pb55">실제 한국교육과정평가원의 시험에서 제시되는 화면입니다. 예시로 제공되는 화면이며,<br>
                                        주의사항 및 부정행위 안내 내용을 확인하고 <em>[동의합니다] 버튼을 클릭</em>하시기 바랍니다.</p>

                                    <div class="media_box">
                                        <div class="notice">
                                            <ul class="info">응시자 주의사항
                                                <li>감독 선생님의 지시에 따라 시험에 응시하십시오.</li>
                                                <li>책상 위에는 응시표를 제외한 모든 소지품은 책상 아래에 정리하여 주십시오.</li>
                                                <li>감독 선생님에게 시험내용에 대한 질문은 금하고, 시험 중 문제가 발생한 경우 소리내지 말고 조용히 손을 들어 주시기
                                                    바랍니다.
                                                </li>
                                            </ul>

                                            <ul class="info mt60">부정행위 안내
                                                <li>개인정보를 타인에게 전달하여 대리로 시험을 보거나, 다른 응시자의 시험을 방해하는 행위</li>
                                                <li>다른 응시자의 모니터를 보거나 자신의 모니터를 보여주는 행위</li>
                                                <li>기타 감독 선생님이 부정행위로 판단하는 행위</li>
                                            </ul>
                                        </div>
                                    </div>

                                    <a class="btn chkBtn  mt100"
                                       href="/user/exam/exam-view?exam_id=${examInformationResponse.examId}">동의합니다</a>
                                </div>
                            </div>
                        </li>
                        <li id="tab3" class="tab_btn">
                            <a href="/user/exam/user-exam-subject?school_level=${examInformationResponse.schoolLevel}&exam_round=2&year=${examInformationResponse.year}"
                               class="tlabel2 label">B셀파 문제 풀이</a>
                        </li>
                        <li id="tab4" class="tab_btn">
                            <a href="/user/exam/report?school_level=${examInformationResponse.schoolLevel}&year=${examInformationResponse.year}"
                               class="tlabel2 label">Report</a>
                        </li>
                    </ul>
                </div>

            </div>

        </div>
    </div>
</main>

</body>
</html>
