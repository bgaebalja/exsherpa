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
            <title>EX셀파 (기출 문제 풀이)</title>
        </c:when>
        <c:when test="${examInformationResponse.examRound eq '2'}">
            <title>EX셀파 (B셀파 문제 풀이)</title>
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

    <style>
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .page-link {
            padding: 8px 12px;
            margin: 0 5px;
            color: #007bff;
            text-decoration: none;
        }

        .current-page {
            padding: 8px 12px;
            margin: 0 5px;
            font-weight: bold;
            color: #333;
            cursor: default;
        }

        .page-link:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
    <style>
        .btn_info > .btn {
            margin-bottom: 10px;
        }

        .btn_info > p {
            margin-top: 5px;
            margin-bottom: 15px;
        }
    </style>
    <style>
        #subjectSelect {
            width: 150px;
            height: 50px;
            font-size: 20px;
            text-align: center;
            padding: 5px;
        }
    </style>
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
                        <c:choose>
                            <c:when test="${examInformationResponse.examRound eq '1'}">
                                <li id="tab2" class="tab_btn">
                                    <input type="radio" checked name="tabmenu" id="tmenu2" class="tab">
                                    <label class="tlabel2 label" for="tmenu2">기출 문제 풀이</label>
                                    <div class="tab_con">
                                        <div class="cnt_box">
                                            <div style="text-align: right; margin-top: 20px;">
                                                <select id="subjectSelect" onchange="filterBySubject()">
                                                    <option value="국어"
                                                            <c:if test="${param.subject_name == '국어'}">selected</c:if>>
                                                        국어
                                                    </option>
                                                    <option value="영어"
                                                            <c:if test="${param.subject_name == '영어'}">selected</c:if>>
                                                        영어
                                                    </option>
                                                    <option value="수학"
                                                            <c:if test="${param.subject_name == '수학'}">selected</c:if>>
                                                        수학
                                                    </option>
                                                    <option value="사회"
                                                            <c:if test="${param.subject_name == '사회'}">selected</c:if>>
                                                        사회
                                                    </option>
                                                    <option value="과학"
                                                            <c:if test="${param.subject_name == '과학'}">selected</c:if>>
                                                        과학
                                                    </option>
                                                    <option value="역사"
                                                            <c:if test="${param.subject_name == '역사'}">selected</c:if>>
                                                        역사
                                                    </option>
                                                    <option value="도덕"
                                                            <c:if test="${param.subject_name == '도덕'}">selected</c:if>>
                                                        도덕
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="page_tit pb20"><em>시험 목록</em></div>
                                            <p class="page_info pb55">시험지 정보를 확인하고 <em>우측의 [응시하기] 버튼을 클릭</em>하여 주시기
                                                바랍니다.<br>
                                                과목 별 응시 순서는 사용자가 선택할 수 있으며 재응시 횟수에는 제한은 없습니다.
                                            </p>

                                            <table class="tbl_list">
                                                <caption></caption>
                                                <colgroup>
                                                    <col width="10%">
                                                    <col width="10%">
                                                    <col width="20%">
                                                    <col width="10%">
                                                    <col width="10%">
                                                    <col width="10%">
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th scope="col" class="first">순번</th>
                                                    <th scope="col">과목</th>
                                                    <th scope="col">시험지명</th>
                                                    <th scope="col">시험 시간</th>
                                                    <th scope="col">문항 수</th>
                                                    <th scope="col">시험 응시</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="exam" items="${getExamsResponse.getExamResponses}"
                                                           varStatus="index">
                                                    <tr>
                                                        <td class="first">${page_information.pageNumber * page_information.size + index.index + 1}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${exam.subjectName eq '국어'}">국어</c:when>
                                                                <c:when test="${exam.subjectName eq '영어'}">영어</c:when>
                                                                <c:when test="${exam.subjectName eq '수학'}">수학</c:when>
                                                                <c:when test="${exam.subjectName eq '사회'}">사회</c:when>
                                                                <c:when test="${exam.subjectName eq '과학'}">과학</c:when>
                                                                <c:when test="${exam.subjectName eq '역사'}">역사</c:when>
                                                                <c:when test="${exam.subjectName eq '도덕'}">도덕</c:when>
                                                                <c:otherwise>-</c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>${exam.examName}</td>
                                                        <td>${exam.timeLimit}분</td>
                                                        <td>${exam.size}문항</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${exam.getExaminationHistoriesResponse.size() > 0}">
                                                                    <a href="/user/exam/exam-view?exam_id=${exam.id}"
                                                                       class="startBtn"
                                                                       style="background-color: #ffae00;">재응시</a>
                                                                </c:when>
                                                                <c:when test="${exam.cached eq 'true'}">
                                                                    <a href="/user/exam/exam-view?exam_id=${exam.id}&is_cached=true"
                                                                       class="startBtn"
                                                                       style="background-color: #ee9490;">이어하기</a>
                                                                </c:when>
                                                                <c:when test="${exam.getExaminationHistoriesResponse.size() == 0}">
                                                                    <a href="/user/exam/exam-view?exam_id=${exam.id}"
                                                                       class="startBtn"
                                                                       style="background-color: #3c6ebf;">응시하기</a>
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
                                                <br/>

                                                <div class="btn ml60"
                                                     style="background-color: #ee9490; margin-left: 160px !important;">
                                                    이어하기
                                                </div>
                                                <p style="font-size: 13px;">진행 중인 시험을 이어할 수 있는 상태 (1일 간 유지)</p>
                                                <br/>

                                                <div class="btn blue ml60" style="margin-left: 45px !important;">응시하기
                                                </div>
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
                                       class="tlabel2 label">B셀파 문제 풀이</a>
                                </li>
                            </c:when>
                            <c:when test="${examInformationResponse.examRound eq '2'}">
                                <li id="tab2" class="tab_btn">
                                    <a href="/user/exam/user-exam-subject?school_level=${examInformationResponse.schoolLevel}&exam_round=1&year=${examInformationResponse.year}"
                                       class="tlabel2 label">기출 문제 풀이
                                    </a>
                                </li>
                                <li id="tab3" class="tab_btn">
                                    <input type="radio" checked name="tabmenu" id="tmenu3" class="tab">
                                    <label class="tlabel3 label" for="tmenu3">B셀파 문제 풀이</label>
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
                                        <div class="tabmenu">
                                            <ul class="justify_center">
                                                <li id="tab_all_exams" class="tab_btn">
                                                    <input type="radio" name="examTab" id="allExamsTab" class="tab"
                                                           <c:if test="${empty param.is_mine or param.is_mine != 'true'}">checked</c:if>>
                                                    <label class="tlabel_all label" for="allExamsTab"
                                                           onclick="location.href='/user/exam/user-exam-subject?school_level=${examInformationResponse.schoolLevel}&exam_round=${examInformationResponse.examRound}&year=${examInformationResponse.year}'">
                                                        전체 시험지
                                                    </label>
                                                </li>

                                                <li id="tab_my_exams" class="tab_btn">
                                                    <input type="radio" name="examTab" id="myExamsTab" class="tab"
                                                           <c:if test="${param.is_mine == 'true'}">checked</c:if>>
                                                    <label class="tlabel_my label" for="myExamsTab"
                                                           onclick="location.href='/user/exam/user-exam-subject?school_level=${examInformationResponse.schoolLevel}&exam_round=${examInformationResponse.examRound}&year=${examInformationResponse.year}&is_mine=true'">
                                                        내 시험지
                                                    </label>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="cnt_box mt50">
                                            <div class="page_tit pb20"><em>시험 목록</em></div>
                                            <p class="page_info pb55">시험지 정보를 확인하고 <em>우측의 [응시하기] 버튼을 클릭</em>하여 주시기
                                                바랍니다.<br>
                                                과목 별 응시 순서는 사용자가 선택할 수 있으며 재응시 횟수에는 제한은 없습니다.
                                            </p>

                                            <table class="tbl_list">
                                                <caption></caption>
                                                <colgroup>
                                                    <col width="10%">
                                                    <col width="10%">
                                                    <col width="20%">
                                                    <col width="10%">
                                                    <col width="10%">
                                                    <col width="10%">
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th scope="col" class="first">순번</th>
                                                    <th scope="col">과목</th>
                                                    <th scope="col">시험지명</th>
                                                    <th scope="col">시험 시간</th>
                                                    <th scope="col">문항 수</th>
                                                    <th scope="col">시험 응시</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tbody>
                                                <c:forEach var="exam" items="${getExamsResponse.getExamResponses}"
                                                           varStatus="index">
                                                    <tr>
                                                        <td class="first">${page_information.pageNumber * page_information.size + index.index + 1}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${exam.subjectName eq '국어'}">국어</c:when>
                                                                <c:when test="${exam.subjectName eq '영어'}">영어</c:when>
                                                                <c:when test="${exam.subjectName eq '수학'}">수학</c:when>
                                                                <c:when test="${exam.subjectName eq '사회'}">사회</c:when>
                                                                <c:when test="${exam.subjectName eq '과학'}">과학</c:when>
                                                                <c:when test="${exam.subjectName eq '역사'}">역사</c:when>
                                                                <c:when test="${exam.subjectName eq '도덕'}">도덕</c:when>
                                                                <c:otherwise>-</c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>${exam.examName}</td>
                                                        <td>${exam.timeLimit}분</td>
                                                        <td>${exam.size}문항</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${exam.getExaminationHistoriesResponse.size() > 0}">
                                                                    <a href="/user/exam/exam-view?exam_id=${exam.id}"
                                                                       class="startBtn"
                                                                       style="background-color: #ffae00;">재응시</a>
                                                                </c:when>
                                                                <c:when test="${exam.cached eq 'true'}">
                                                                    <a href="/user/exam/exam-view?exam_id=${exam.id}&is_cached=true"
                                                                       class="startBtn"
                                                                       style="background-color: #ee9490;">이어하기</a>
                                                                </c:when>
                                                                <c:when test="${exam.getExaminationHistoriesResponse.size() == 0}">
                                                                    <a href="/user/exam/exam-view?exam_id=${exam.id}"
                                                                       class="startBtn"
                                                                       style="background-color: #3c6ebf;">응시하기</a>
                                                                </c:when>
                                                                <c:otherwise>-</c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="pagination">
                                                <c:if test="${not page_information.first}">
                                                    <a href="?pageNumber=${page_information.pageNumber - 1}&school_level=${examInformationResponse.schoolLevel}&exam_round=${examInformationResponse.examRound}&year=${examInformationResponse.year}&is_mine=${param.is_mine}"
                                                       class="page-link">이전</a>
                                                </c:if>

                                                <c:forEach begin="0" end="${page_information.totalPages - 1}"
                                                           var="page">
                                                    <c:choose>
                                                        <c:when test="${page == page_information.pageNumber}">
                                                            <span class="current-page">${page + 1}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="?pageNumber=${page}&school_level=${examInformationResponse.schoolLevel}&exam_round=${examInformationResponse.examRound}&year=${examInformationResponse.year}&is_mine=${param.is_mine}"
                                                               class="page-link">${page + 1}</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>

                                                <c:if test="${not page_information.last}">
                                                    <a href="?pageNumber=${page_information.pageNumber + 1}&school_level=${examInformationResponse.schoolLevel}&exam_round=${examInformationResponse.examRound}&year=${examInformationResponse.year}&is_mine=${param.is_mine}"
                                                       class="page-link">다음</a>
                                                </c:if>
                                            </div>
                                            <div class="btn_info mt40">
                                                <div class="btn ml60" style="background-color: #ffae00;">재응시</div>
                                                <p style="font-size: 13px;">시험을 재응시 할 수 있는 상태</p>
                                                <br/>

                                                <div class="btn ml60"
                                                     style="background-color: #ee9490; margin-left: 160px !important;">
                                                    이어하기
                                                </div>
                                                <p style="font-size: 13px;">진행 중인 시험을 이어할 수 있는 상태 (1일 간 유지)</p>
                                                <br/>

                                                <div class="btn blue ml60" style="margin-left: 45px !important;">응시하기
                                                </div>
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
                            <a href="/user/exam/report?school_level=${examInformationResponse.schoolLevel}&year=${examInformationResponse.year}&exam_id=${exam.id}"
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
                    location.href = "/user/exam/user-exam-sound?school_level=${examInformationResponse.schoolLevel}&exam_round=${examInformationResponse.examRound}&year=${examInformationResponse.year}&exam_id=${examInformationResponse.examId}";
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
<script>
    function filterBySubject() {
        const subjectName = document.getElementById("subjectSelect").value;
        const urlQuery = new URLSearchParams(location.search);

        urlQuery.delete("subjectName");
        if (subjectName) {
            urlQuery.set("subject_name", subjectName);
        } else {
            urlQuery.delete("subject_name");
        }

        location.href = '/user/exam/user-exam-subject?' + urlQuery.toString();
    }
</script>

</html>
