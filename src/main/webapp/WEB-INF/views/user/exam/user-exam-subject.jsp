<%@ page import="java.util.List" %>
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
    <c:choose>
        <c:when test="${examInformationResponse.examRound eq '1'}">
            <title>온라인 학업성취도 평가 (실전시험Ⅰ)</title>
        </c:when>
        <c:when test="${examInformationResponse.examRound eq '2'}">
            <title>온라인 학업성취도 평가 (실전시험Ⅱ)</title>
        </c:when>
    </c:choose>
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
    <jsp:include page="../../header.jsp" flush="true">
        <jsp:param name="examRound" value="${examInformationResponse.examRound}"/>
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
                        <c:choose>
                            <c:when test="${examInformationResponse.examRound eq '1'}">
                                <li id="tab2" class="tab_btn">
                                    <input type="radio" checked name="tabmenu" id="tmenu2" class="tab">
                                    <label class="tlabel2 label" for="tmenu2">실전시험Ⅰ</label>
                                    <div class="tab_con">
                                        <div class="cnt_box">
                                            <div class="page_tit pb20">시험 시간표 및 <em>시험응시</em></div>
                                            <p class="page_info pb55">교시별 시험 과목을 확인하고 <em>우측의 [응시하기] 버튼을 클릭</em>하여 주시기
                                                바랍니다.<br>
                                                과목별 응시 순서는 사용자가 선택할 수 있으며 재응시 횟수에는 제한은 없습니다.
                                            </p>

                                            <table class="tbl_list">
                                                <caption></caption>
                                                <colgroup>
                                                    <col width="10%">
                                                    <col width="10%">
                                                    <col width="20%">
                                                    <col width="10%">
                                                    <col width="10%">
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th scope="col" class="first">교시</th>
                                                    <th scope="col">과목</th>
                                                    <th scope="col">시험시간</th>
                                                    <th scope="col">문항 수</th>
                                                    <th scope="col">시험 응시</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tbody>
                                                <c:forEach var="exam" begin="1" end="1">
                                                    <tr>
                                                        <td class="first">1교시</td>
                                                        <td>국어</td>
                                                        <td>응시 시각으로부터 60분</td>
                                                        <td>20문항</td>
                                                        <td>
                                                            <!-- TODO: 시험지 ID 전송 -->
                                                            <a href="/user/exam/user-exam-sound?school_level=${examInformationResponse.schoolLevel}&exam_round=${examInformationResponse.examRound}&year=${examInformationResponse.year}&exam_id=${examInformationResponse.examId}"
                                                               class="startBtn"
                                                               style="background-color: #3c6ebf;">응시하기</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                                <c:forEach var="exam" items="${examList}" varStatus="index">
                                                    <tr>
                                                        <td class="first">${index.index + 1}교시</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${exam.subjectId eq 14}">국어</c:when>
                                                                <c:when test="${exam.subjectId eq 15}">영어</c:when>
                                                                <c:when test="${exam.subjectId eq 16}">수학</c:when>
                                                                <c:when test="${exam.subjectId eq 17}">사회</c:when>
                                                                <c:when test="${exam.subjectId eq 18}">과학</c:when>
                                                                <c:otherwise>-</c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>응시 시각으로부터 ${exam.testTime}분</td>
                                                        <td>${exam.itemCnt}문항</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${exam.completeYn eq 'Y' and isTesting eq false}">
                                                                    <a href="javascript:restartExam('${exam.examResultId}','${exam.examId}');"
                                                                       class="startBtn"
                                                                       style="background-color: #ffae00;">재응시</a>
                                                                </c:when>
                                                                <c:when test="${exam.completeYn eq 'Y' and isTesting eq true}">
                                                                    <a href="#none" class="startBtn"
                                                                       style="cursor: default; background-color: #5a6268;">재응시</a>
                                                                </c:when>
                                                                <c:when test="${exam.completeYn eq 'N' and not empty exam.examResultId}">
                                                                    <a href="/user/exam/exam-view?exam_id=${exam.examId}"
                                                                       class="startBtn"
                                                                       style="background-color: #ee9490;">이어하기</a>
                                                                </c:when>
                                                                <c:when test="${empty exam.examResultId and isTesting eq false}">
                                                                    <a href="/user/exam/user-exam-sound/${examInformationResponse.examRound}?exam_id=${exam.examId}"
                                                                       class="startBtn"
                                                                       style="background-color: #3c6ebf;">응시하기</a>
                                                                </c:when>
                                                                <c:when test="${empty exam.examResultId and isTesting eq true}">
                                                                    <a href="/user/exam/user-exam-sound?school_level=${examInformationResponse.schoolLevel}&year=${examInformationResponse.year}"
                                                                       class="startBtn"
                                                                       style="cursor: default; background-color: #5a6268;">응시하기</a>
                                                                </c:when>
                                                                <c:when test="${empty exam.examResultId and isTesting eq true}">
                                                                    <a href="/user/exam/user-exam-sound?school_level=${examInformationResponse.schoolLevel}&year=${examInformationResponse.year}"
                                                                       class="startBtn"
                                                                       style="cursor: default; background-color: #5a6268;">응시하기</a>
                                                                </c:when>
                                                                <c:otherwise>-</c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="btn_info mt40">
                                                <div class="btn ml60" style="background-color: #ffae00;">재응시</div>
                                                <p style="font-size: 13px;">시험을 재응시 할 수 있는 상태</p>
                                                <div class="btn ml60" style="background-color: #ee9490;">이어하기</div>
                                                <p style="font-size: 13px;">진행 중인 시험을 이어할 수 있는 상태</p>
                                                <div class="btn blue ml60">응시하기</div>
                                                <p style="font-size: 13px;">시험에 응시할 수 있는 상태</p>
                                            </div>
                                            <a class="btn resultBtn  mt100"
                                               href="/user/exam/report?school_level=${examInformationResponse.schoolLevel}&year=${examInformationResponse.year}">결과
                                                보기</a>
                                        </div>
                                    </div>
                                </li>
                                <li id="tab3" class="tab_btn">
                                    <a href="/user/exam/user-exam-subject?school_level=${examInformationResponse.schoolLevel}&exam_round=2&year=${examInformationResponse.year}"
                                       class="tlabel2 label">실전시험Ⅱ</a>
                                        <%--                                            href="/user/exam/user-exam-subject?school_level=${examInformationResponse.schoolLevel}&exam_round=2" class="tlabel2 label">실전시험Ⅱ</a>--%>
                                </li>
                            </c:when>
                            <c:when test="${examInformationResponse.examRound eq '2'}">
                                <li id="tab2" class="tab_btn">
                                    <a href="/user/exam/user-exam-subject?school_level=${examInformationResponse.schoolLevel}&exam_round=1&year=${examInformationResponse.year}"
                                       class="tlabel2 label">실전시험Ⅰ</a>
                                </li>
                                <li id="tab3" class="tab_btn">
                                    <input type="radio" checked name="tabmenu" id="tmenu3" class="tab">
                                    <label class="tlabel3 label" for="tmenu3">실전시험Ⅱ</label>
                                    <div class="tab_con">
                                        <c:if test="${examInformationResponse.schoolLevel eq 'SL01'}">
                                            <div class="tabmenu2 type01">
                                                <ul class="justify_center">
                                                    <li class="tab_btn2">
                                                        <input type="radio"
                                                               <c:if test="${examInformationResponse.year eq '2023'}">checked</c:if>
                                                               name="tabmenu_report" id="tmenu_r1" class="tab"
                                                               onchange="moveYear(this);" value="2023">
                                                        <label class="rlabel1 label" for="tmenu_r1">5학년<c:if
                                                                test="${examInformationResponse.year eq '2023'}"><img
                                                                src="/img/ico_new.png" alt=""
                                                                class="ico_new"/></c:if></label>
                                                    </li>
                                                    <li class="tab_btn2">
                                                        <input type="radio"
                                                               <c:if test="${examInformationResponse.year eq '2022'}">checked</c:if>
                                                               name="tabmenu_report" id="tmenu_r2"
                                                               onchange="moveYear(this);" class="tab" value="2022">
                                                        <label class="rlabel1 label" for="tmenu_r2">6학년<c:if
                                                                test="${examInformationResponse.year eq '2022'}"><img
                                                                src="/img/ico_new.png" alt=""
                                                                class="ico_new"/></c:if></label>
                                                    </li>
                                                </ul>
                                            </div>
                                        </c:if>
                                        <div class="cnt_box mt50">
                                            <div class="page_tit pb20">시험 시간표 및 <em>시험응시</em></div>
                                            <p class="page_info pb55">교시별 시험 과목을 확인하고 <em>우측의 [응시하기] 버튼을 클릭</em>하여 주시기
                                                바랍니다.<br>
                                                과목별 응시 순서는 사용자가 선택할 수 있으며 재응시 횟수에는 제한은 없습니다.
                                            </p>

                                            <table class="tbl_list">
                                                <caption></caption>
                                                <colgroup>
                                                    <col width="10%">
                                                    <col width="10%">
                                                    <col width="20%">
                                                    <col width="10%">
                                                    <col width="10%">
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th scope="col" class="first">교시</th>
                                                    <th scope="col">과목</th>
                                                    <th scope="col">시험시간</th>
                                                    <th scope="col">문항 수</th>
                                                    <th scope="col">시험 응시</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tbody>
                                                <c:forEach var="exam" begin="1" end="1">
                                                    <tr>
                                                        <td class="first">1교시</td>
                                                        <td>국어</td>
                                                        <td>응시 시각으로부터 60분</td>
                                                        <td>20문항</td>
                                                        <td>
                                                            <!-- TODO: 시험지 ID 전송 -->
                                                            <a href="/user/exam/user-exam-sound?school_level=${examInformationResponse.schoolLevel}&exam_round=${examInformationResponse.examRound}&year=${examInformationResponse.year}&exam_id=${examInformationResponse.examId}"
                                                               class="startBtn"
                                                               style="background-color: #3c6ebf;">응시하기</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                                <c:forEach var="exam" items="${examList}" varStatus="index">
                                                    <tr>
                                                        <td class="first">${index.index + 1}교시</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${exam.subjectId eq 14}">국어</c:when>
                                                                <c:when test="${exam.subjectId eq 15}">영어</c:when>
                                                                <c:when test="${exam.subjectId eq 16}">수학</c:when>
                                                                <c:when test="${exam.subjectId eq 17}">사회</c:when>
                                                                <c:when test="${exam.subjectId eq 18}">과학</c:when>
                                                                <c:otherwise>-</c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>응시 시각으로부터 ${exam.testTime}분</td>
                                                        <td>${exam.itemCnt}문항</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${exam.completeYn eq 'Y' and isTesting eq false}">
                                                                    <a href="javascript:restartExam('${exam.examResultId}','${exam.examId}');"
                                                                       class="startBtn"
                                                                       style="background-color: #ffae00;">재응시</a>
                                                                </c:when>
                                                                <c:when test="${exam.completeYn eq 'Y' and isTesting eq true}">
                                                                    <a href="#none" class="startBtn"
                                                                       style="cursor: default; background-color: #5a6268;">재응시</a>
                                                                </c:when>
                                                                <c:when test="${exam.completeYn eq 'N' and not empty exam.examResultId}">
                                                                    <a href="/user/exam/exam-view?exam_id=${exam.examId}"
                                                                       class="startBtn"
                                                                       style="background-color: #ee9490;">이어하기</a>
                                                                </c:when>
                                                                <c:when test="${empty exam.examResultId and isTesting eq false}">
                                                                    <a href="/user/exam/user-exam-sound/${examInformationResponse.examRound}?exam_id=${exam.examId}"
                                                                       class="startBtn"
                                                                       style="background-color: #3c6ebf;">응시하기</a>
                                                                </c:when>
                                                                <c:when test="${empty exam.examResultId and isTesting eq true}">
                                                                    <a href="#none" class="startBtn"
                                                                       style="cursor: default; background-color: #5a6268;">응시하기</a>
                                                                </c:when>
                                                                <c:otherwise>-</c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="btn_info mt40">
                                                <div class="btn ml60" style="background-color: #ffae00;">재응시</div>
                                                <p style="font-size: 13px;">시험을 재응시 할 수 있는 상태</p>
                                                <div class="btn ml60" style="background-color: #ee9490;">이어하기</div>
                                                <p style="font-size: 13px;">진행 중인 시험을 이어할 수 있는 상태</p>
                                                <div class="btn blue ml60">응시하기</div>
                                                <p style="font-size: 13px;">시험에 응시할 수 있는 상태</p>
                                            </div>
                                            <a class="btn resultBtn  mt100"
                                               href="/user/exam/report?school_level=${examInformationResponse.schoolLevel}&year=${examInformationResponse.year}">결과
                                                보기</a>
                                        </div>
                                    </div>
                                </li>
                            </c:when>
                        </c:choose>
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

<script>

    function moveYear(element) {
        const urlQuery = new URLSearchParams(location.search);
        urlQuery.set("year", element.value);
        location.href = '/user/exam/user-exam-subject?' + urlQuery.toString();
    }

    function restartExam(examResultId, examId) {
        if (confirm('기존 응시이력은 삭제됩니다.\n재응시를 하시겠습니까?')) {
            fetch('/user/exam/restart-exam', {
                method: 'PUT',
                cache: 'no-cache',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({'examResultId': examResultId})
            }).then(response => {
                return response.json();
            }).then(data => {
                if (data.result === true) {
                    location.href = "/user/exam/user-exam-sound/${examInformationResponse.examRound}?exam_id=" + examId;
                } else {
                    console.log(data.message);
                }
            });
        }
    }

    function moveReportPage(examResultId, examId) {
        location.href = "/user/exam/report";
    }

    function alertContinueTesting() {
        event.preventDefault();
    }

</script>

</html>
