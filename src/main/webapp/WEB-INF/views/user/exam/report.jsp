<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bgaebalja.exsherpa.exam.domain.GetExamsResponse" %>
<%@ page import="bgaebalja.exsherpa.examination.domain.GetExaminationHistoriesResponse" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="bgaebalja.exsherpa.examination.domain.GetSolvedQuestionsResponse" %>
<%@ page import="bgaebalja.exsherpa.util.FormatValidator" %>
<%@ page import="bgaebalja.exsherpa.examination.domain.GetSolvedQuestionResponse" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:formatDate value="${today}" pattern="yyyyMMdd" var="nowDate"/>
<%
    GetExaminationHistoriesResponse getExaminationHistoriesResponse
            = (GetExaminationHistoriesResponse) request.getAttribute("getExaminationHistoriesResponse");
    int examinationSequence = (Integer) request.getAttribute("examination_sequence");

    String rawDate = String.valueOf(getExaminationHistoriesResponse.get(examinationSequence).getModifiedAt());
    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSS");
    Date date = inputFormat.parse(rawDate);
    SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String formattedDate = outputFormat.format(date);

    int[] correctCounts = new int[5];
    int[] totalCounts = new int[5];

    GetSolvedQuestionsResponse solvedQuestionsResponse
            = getExaminationHistoriesResponse.get(examinationSequence).getGetSolvedQuestionsResponse();

    for (int i = 0; i < solvedQuestionsResponse.size(); i++) {
        GetSolvedQuestionResponse getSolvedQuestionResponse = solvedQuestionsResponse.get(i);
        String difficulty = getSolvedQuestionResponse.getDifficulty();
        boolean isCorrect = getSolvedQuestionResponse.isCorrect();

        int index;
        switch (difficulty) {
            case "최하":
                index = 0;
                break;
            case "하":
                index = 1;
                break;
            case "중":
                index = 2;
                break;
            case "상":
                index = 3;
                break;
            case "최상":
                index = 4;
                break;
            default:
                index = -1;
        }

        if (index != -1) {
            totalCounts[index]++;
            if (isCorrect) {
                correctCounts[index]++;
            }
        }
    }

    int[] achievementRates = new int[5];
    for (int i = 0; i < 5; i++) {
        achievementRates[i] = (totalCounts[i] > 0) ? (int) Math.round((double) correctCounts[i] / totalCounts[i] * 100) : 0;
    }

    Map<String, Long> difficultyAnswerRate = (Map<String, Long>) request.getAttribute("difficulty_answer_rate");
    Map<String, Long> questionAnswerRate = (Map<String, Long>) request.getAttribute("question_answer_rate");
%>
<%
    Gson gson = new Gson();
    String difficultyAnswerRateJson = gson.toJson(difficultyAnswerRate);
    String achievementRatesJson = gson.toJson(achievementRates);
%>

<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">

<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>EX셀파 (리포트)</title>

    <link rel="stylesheet" href="<c:url value="/css/report.css"><c:param name="ver" value="${nowDate}"/></c:url>"/>

    <script src="https://kit.fontawesome.com/266dd736a0.js" crossorigin="anonymous"></script>
    <link href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css" rel="stylesheet">
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <link rel="icon" href="/img/fav.png">

    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>

    <script type="text/javascript" src="/js/chart.js-3.8.0/package/dist/chart.js"></script>
    <script type="text/javascript"
            src="<c:url value="/js/itemRenderer/Item.js"><c:param name="ver" value="${nowDate}"/></c:url>"></script>
    <script type="text/javascript"
            src="<c:url value="/js/itemRenderer/AnswerExtractor.js"><c:param name="ver" value="${nowDate}"/></c:url>"></script>
    <script type="text/javascript"
            src="<c:url value="/js/itemRenderer/report.js"><c:param name="ver" value="${nowDate}"/></c:url>"></script>
    <script type="text/javascript"
            src="<c:url value="/js/reportPage.js"><c:param name="ver" value="${nowDate}"/></c:url>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
            integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script type="text/x-mathjax-config">
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
            integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        .menu .container {
            height: 27px;
        }

        .justify_between {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        a, a:active, a:focus, a:hover, a:link, a:visited {
            color: #222;
        }
    </style>
    <style>
        .question-content ul {
            padding-bottom: 20px;
            display: flex;
            align-items: center;
            line-height: 1.6;
        }

        .fa-solid.fa-rectangle-vertical {
            width: 10px;
            height: 100%;
            display: inline-block;
            border-radius: 0;
            margin-right: 10px;
            vertical-align: middle;
        }

        #studnet_info ul li {
            padding-left: 5px;
            display: inline-block;
            vertical-align: middle;
        }
    </style>
    <style>
        .user_name {
            position: absolute;
            right: 0;
            white-space: nowrap;
            padding-left: 5px;
        }
    </style>
    <style>
        .icon-button {
            display: inline-flex;
            align-items: center;
            padding: 5px 10px;
            border: 1px solid #5a9bd5;
            border-radius: 4px;
            background-color: #5a9bd5;
            color: #fff;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .icon-button:hover {
            background-color: #4a89c6;
            cursor: pointer;
        }

        .icon-button i {
            margin-left: 5px;
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
    <%--  <div class="wrap">--%>
    <div id="content">
        <div class="con_case">
            <div class="container">
                <div class="tabmenu">
                    <ul class="justify_center">
                        <li id="tab1" class="tab_btn">
                            <input type="radio" name="tabmenu" id="tmenu2" class="tab">
                            <a href="/user/exam/user-exam-subject?school_level=${examInformationResponse.schoolLevel}&exam_round=1&year=${examInformationResponse.year}"
                               class="tlabel2 label">기출 문제 풀이</a>
                        </li>
                        <li id="tab1" class="tab_btn">
                            <input type="radio" name="tabmenu" id="tmenu3" class="tab">
                            <a href="/user/exam/user-exam-subject?school_level=${examInformationResponse.schoolLevel}&exam_round=2&year=${examInformationResponse.year}"
                               class="tlabel2 label">B셀파 문제 풀이</a>
                        </li>
                        <li id="tab1" class="tab_btn">
                            <input type="radio" checked name="tabmenu" id="tmenu4" class="tab">
                            <label class="tlabel4 label" for="tmenu4">Report</label>
                            <div class="tab_con pt40">
                                <div class="flex_end3">
                                    <select class="select_box ml05" id="round_select" onchange="changeReportRound();"
                                            style="width: auto; text-align: center;">
                                        <%
                                            if (getExaminationHistoriesResponse.size() > 0) {
                                                for (int i = 0; i < getExaminationHistoriesResponse.size(); i++) {
                                        %>
                                        <option value="<%= i %>"
                                                data-sequence="<%= i %>"<%= i == examinationSequence ? "selected" : "" %>>
                                            <%= getExaminationHistoriesResponse.get(i).getExamName() %>
                                        </option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="tabmenu2 mt40">
                                    <ul class="justify_center">
                                        <li id="tab2" class="tab_btn2">
                                            <input type="radio" checked name="tabmenu_report" id="tmenu_r1"
                                                   class="tab">
                                            <label class="rlabel1 label" for="tmenu_r1">기본 리포트</label>
                                            <div class="tab_con pt20 pb100">
                                                <div class="detail_box">
                                                    <!--첫번째 단락-->
                                                    <div class="justify_between mb90">
                                                        <div class="box_wrap" id="studnet_info">
                                                            <div class="box_tit"><i
                                                                    class="fa-regular fa-pen-to-square"></i>시험참여 정보
                                                            </div>
                                                            <div class="box box1"
                                                                 style="padding: 50px 70px; height: 350px;"><input
                                                                    type="hidden" id="nickname" value="${nickname}"/>
                                                                <ul style="padding-bottom: 20px">
                                                                    <i class="fa-solid fa-rectangle-vertical"
                                                                       style="width: 10px; border-radius: 0; vertical-align: middle;"></i>
                                                                    아이디&nbsp&nbsp&nbsp&nbsp
                                                                    <li id="username"><%= getExaminationHistoriesResponse.get(0).getUsername() %>
                                                                    </li>
                                                                </ul>
                                                                <ul style="padding-bottom: 20px">
                                                                    <i class="fa-solid fa-rectangle-vertical"
                                                                       style="width: 10px; border-radius: 0; vertical-align: middle;"></i>
                                                                    학년&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                                                    <li id="grade"><%= getExaminationHistoriesResponse.get(0).getGrade() %>
                                                                        학년
                                                                    </li>
                                                                </ul>
                                                                <ul style="padding-bottom: 20px">
                                                                    <i class="fa-solid fa-rectangle-vertical"
                                                                       style="width: 10px; border-radius: 0; vertical-align: middle;"></i>
                                                                    응시과목
                                                                    <li id="subjectName"><%= getExaminationHistoriesResponse.get(examinationSequence).getSubjectName() %>
                                                                    </li>
                                                                </ul>
                                                                <ul style="padding-bottom: 20px">
                                                                    <i class="fa-solid fa-rectangle-vertical"
                                                                       style="width: 10px; border-radius: 0; vertical-align: middle;"></i>
                                                                    시험지명
                                                                    <li id="examName"><%= getExaminationHistoriesResponse.get(examinationSequence).getExamName() %>
                                                                    </li>
                                                                </ul>
                                                                <ul style="padding-bottom: 20px">
                                                                    <i class="fa-solid fa-rectangle-vertical"
                                                                       style="width: 10px; border-radius: 0; vertical-align: middle;"></i>
                                                                    응시일자&nbsp&nbsp&nbsp
                                                                    <li class="last">
                                                                        <div id="modifiedAt"
                                                                             style="overflow: hidden; white-space: nowrap; display: inline-block; vertical-align: middle;">
                                                                            <%= formattedDate %>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="score_box">
                                                    <div class="score_txt">
                                                        <fmt:parseNumber value="${score}" pattern="0" var="num"/>
                                                        <span class="score">
                                                            <%
                                                                System.out.println(getExaminationHistoriesResponse.get(examinationSequence).getAnswerCount());
                                                                System.out.println(getExaminationHistoriesResponse.get(examinationSequence).getQuestionCount());
                                                            %>
            <em><%=
            examinationSequence >= 0 && examinationSequence <= getExaminationHistoriesResponse.size()
                    ? (getExaminationHistoriesResponse.get(examinationSequence).getAnswerCount() == 0
                    ? 0
                    : Math.round((double) getExaminationHistoriesResponse.get(examinationSequence).getAnswerCount() /
                    getExaminationHistoriesResponse.get(examinationSequence).getQuestionCount() * 100))
                    : 0 %>점
            </em> / 100점
        </span>
                                                    </div>
                                                </div>
                                                <table class="tbl_list2 mt60">
                                                    <caption></caption>
                                                    <colgroup>
                                                        <col width="10%">
                                                        <col width="28%">
                                                        <col width="62%">
                                                    </colgroup>
                                                    <thead>
                                                    <tr>
                                                        <th scope="col" class="first">번호</th>
                                                        <th scope="col">채점 결과</th>
                                                        <th scope="col">문제 및 해설 보기</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <%
                                                        GetSolvedQuestionsResponse getSolvedQuestionsResponse
                                                                = getExaminationHistoriesResponse
                                                                .get(examinationSequence)
                                                                .getGetSolvedQuestionsResponse();
                                                        if (!FormatValidator.hasValue(getSolvedQuestionsResponse)) {
                                                    %>
                                                    <tr>
                                                        <td colspan="3" style="text-align: center; color: red;">응시 이력이
                                                            없습니다. 시험에 응시한 뒤 리포트를 조회해 주세요.
                                                        </td>
                                                    </tr>
                                                    <%
                                                    } else {
                                                        for (int i = 0; i < getSolvedQuestionsResponse.size(); i++) {
                                                            GetSolvedQuestionResponse getSolvedQuestionResponse
                                                                    = getSolvedQuestionsResponse.get(i);
                                                    %>
                                                    <tr>
                                                        <td class="first"><%= getSolvedQuestionResponse.getQuestionNumber() %>
                                                        </td>

                                                        <td>
                                                            <% if (getSolvedQuestionResponse.isCorrect()) { %>
                                                            <i class="fa-regular fa-circle-check"
                                                               style="color: green;"></i>
                                                            <% } else { %>
                                                            <i class="fa-regular fa-circle-xmark"
                                                               style="color: red;"></i>
                                                            <% } %>
                                                        </td>

                                                        <td>
                                                            <a href="javascript:showItem('<%= getSolvedQuestionResponse.getQuestionId() %>');"
                                                               class="viewBtn">상세 보기</a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </li>
                                        <li id="tab2" class="tab_btn2 print_pdf">
                                            <input type="radio" name="tabmenu_report" id="tmenu_r2" class="tab"
                                                   onclick="readDetailReport();">
                                            <label class="rlabel1 label" for="tmenu_r2">상세 리포트</label>
                                            <div class="tab_con pt60" id="detail_box">
                                                <div class="detail_box">
                                                    <!--첫번째 단락-->
                                                    <div class="justify_between mb90">
                                                        <%--<div class="box_wrap">
                                                          <div class="box_tit"><i
                                                                  class="fa-regular fa-pen-to-square"></i>시험참여 정보
                                                          </div>
                                                          <div class="box box1">
                                                            <input type="hidden" id="nickname" value="${nickname}" />
                                                            <ul><i class="fa-regular fa-user"></i>이름
                                                              <li>${nickname}</li>
                                                            </ul>
                                                            <ul><i class="fa-solid fa-school"></i>학년
                                                              <li><c:choose>
                                                                <c:when test="${schoolLevel eq 'SL01'}">6학년</c:when>
                                                                <c:when test="${schoolLevel eq 'SL02'}">3학년</c:when>
                                                                <c:otherwise>2학년</c:otherwise>
                                                              </c:choose></li>
                                                            </ul>
                                                            <ul><i class="fa-regular fa-calendar-days"></i>응시일
                                                              <li class="last">
                                                                ${examInformationResponse.exam_start_time} ~ ${examInformationResponse.exam_end_time}
                                                              </li>
                                                            </ul>
                                                          </div>
                                                        </div>--%>

                                                        <div class="box_wrap" id="student_summary">
                                                            <div class="box_tit"><i
                                                                    class="fa-regular fa-pen-to-square"></i>평가결과 요약
                                                            </div>
                                                            <div class="box box2">
                                                                <table class="summary">
                                                                    <caption></caption>
                                                                    <colgroup>
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                    </colgroup>
                                                                    <thead>
                                                                    <tr>
                                                                        <th scope="col">평가 문항 수</th>
                                                                        <th scope="col">정답 문항 수</th>
                                                                        <th scope="col">종합 성취율</th>
                                                                        <th scope="col">성취수준</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td><%= getExaminationHistoriesResponse.get(examinationSequence).getQuestionCount() %>
                                                                        </td>
                                                                        <td><%= getExaminationHistoriesResponse.get(examinationSequence).getAnswerCount() %>
                                                                        </td>
                                                                        <td>
                                                                            <%
                                                                                int questionCount = getExaminationHistoriesResponse.get(examinationSequence).getQuestionCount();
                                                                                int answerCount = getExaminationHistoriesResponse.get(examinationSequence).getAnswerCount();
                                                                                double achievementRate = (questionCount > 0) ? (double) answerCount / questionCount : 0;
                                                                                int achievementPercentage = (int) Math.round(achievementRate * 100);
                                                                                pageContext.setAttribute("achievementPercentage", achievementPercentage);
                                                                            %>
                                                                            <%= achievementPercentage %>%
                                                                        </td>
                                                                        <td>
                                                                            <c:choose>
                                                                                <c:when test="${achievementPercentage <= 25}">1수준</c:when>
                                                                                <c:when test="${achievementPercentage <= 50}">2수준</c:when>
                                                                                <c:when test="${achievementPercentage <= 75}">3수준</c:when>
                                                                                <c:otherwise>4수준</c:otherwise>
                                                                            </c:choose>
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>

                                                                <div class="bar_wrap pt30"
                                                                     style="position: relative; left: 16.5px;"><span
                                                                        class="user_name"
                                                                        style="right:
                                                                        <c:choose>
                                                                        <c:when test="${(1 - detailReportInfo.achievePer) * 100 le 90}">
                                                                            ${(1 - detailReportInfo.achievePer) * 100}%;
                                                                        </c:when>
                                                                        <c:otherwise>90%;</c:otherwise>
                                                                        </c:choose> left: auto;">내 성취수준<i
                                                                        class="fa-solid fa-caret-down"
                                                                        style="padding-left: 40px; width: 35px"></i></span>
                                                                </div>
                                                                <div class="bar_wrap">
                                                                    <div class="bar"
                                                                         style="position: absolute; display: block;">
                                                                        <div style="width: 19%;"><em>1수준</em>
                                                                            <p>기초학력 미달</p></div>
                                                                        <div style="width: 32%;"><em>2수준</em>
                                                                            <p>기초학력</p></div>
                                                                        <div style="width: 29%;"><em>3수준</em>
                                                                            <p>보통학력</p></div>
                                                                        <div style="width: 20%;"><em>4수준</em>
                                                                            <p>우수학력</p></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--첫번째 단락-->
                                                    <!--두번째 단락-->
                                                    <div class="justify_between mb90">
                                                        <div class="box_wrap" id="box_answer">
                                                            <div class="box_tit"><i
                                                                    class="fa-regular fa-pen-to-square"></i>문항 별 정오표
                                                            </div>
                                                            <div class="box box9">
                                                                <table class="tbl_list2">
                                                                    <caption></caption>
                                                                    <colgroup>
                                                                        <col width="5%">
                                                                        <col width="8%">
                                                                        <col width="10%">
                                                                        <col width="5%">
                                                                        <col width="8%">
                                                                        <col width="10%">
                                                                        <col width="15%">
                                                                    </colgroup>
                                                                    <thead>
                                                                    <tr>
                                                                        <th scope="col">번호</th>
                                                                        <th scope="col">교과 영역</th>
                                                                        <th scope="col">관련 단원</th>
                                                                        <th scope="col">정답</th>
                                                                        <th scope="col">본인 응답</th>
                                                                        <th scope="col">채점 결과</th>
                                                                        <th scope="col">시험 응시자 평균 정답률</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <%
                                                                        for (int i = 0; i < getSolvedQuestionsResponse.size(); i++) {
                                                                            GetSolvedQuestionResponse getSolvedQuestionResponse = getSolvedQuestionsResponse.get(i);
                                                                            Long questionAnswerRateData = questionAnswerRate.get(getSolvedQuestionResponse.getQuestionId().toString());
                                                                    %>
                                                                    <tr>
                                                                        <td class="first">1</td>
                                                                        <td>
                                                                            <%= getSolvedQuestionResponse.getSmallChapterName() %>
                                                                        </td>
                                                                        <td><%= getSolvedQuestionResponse.getTopicChapterName() %>
                                                                        </td>
                                                                        <td>
                                                                            <a href="javascript:showItem('<%= getSolvedQuestionResponse.getQuestionId() %>');"
                                                                               class="icon-button">정답</a>
                                                                        </td>
                                                                        <td>
                                                                            <a href="javascript:showMyItem('<%= getSolvedQuestionResponse.getId() %>');"
                                                                               class="icon-button">답안</a>
                                                                        </td>


                                                                        <td>
                                                                            <%
                                                                                if (getSolvedQuestionResponse.isCorrect()) {
                                                                            %>
                                                                            <i class="fa-regular fa-circle-check"
                                                                               style="color: green;"></i>
                                                                            <%
                                                                            } else {
                                                                            %>
                                                                            <i class="fa-regular fa-circle-xmark"
                                                                               style="color: red;"></i>
                                                                            <%
                                                                                }
                                                                            %>
                                                                        </td>
                                                                        <td><%= questionAnswerRateData %>%</td>
                                                                    </tr>
                                                                    <% } %>
                                                                    </tbody>
                                                                    <tbody>
                                                                    <c:choose>
                                                                        <c:when test="${not empty not_exam}">
                                                                            <tr>
                                                                                <td colspan="3">응시 이력이 없습니다. 시험에 응시한 뒤
                                                                                    리포트를 조회해 주세요.
                                                                                </td>
                                                                            </tr>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:forEach var="item" items="${itemList}">
                                                                                <tr>
                                                                                    <td class="first">${item.itemOrderName}</td>
                                                                                    <td>
                                                                                            ${item.contentCategory}
                                                                                    </td>
                                                                                    <td>${item.largeChapter}</td>
                                                                                    <td>
                                                                                        <a href="javascript:showItem('${item.itemId}');"
                                                                                           class="icon-button">정답</a>
                                                                                    </td>
                                                                                    <td>
                                                                                        <a href="javascript:showItem('${item.itemId}','${item.itemResultId}');"
                                                                                           class="icon-button">답안</a>
                                                                                    </td>
                                                                                    <c:choose>
                                                                                        <c:when test="${item.correctYn ne 'Y'}">
                                                                                            <td>
                                                                                                <i class="fa-regular fa-circle-xmark"
                                                                                                   style="color: red;"></i>
                                                                                            </td>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <td>
                                                                                                <i class="fa-regular fa-circle-check"
                                                                                                   style="color: green;"></i>
                                                                                            </td>
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                    <td><fmt:formatNumber
                                                                                            value="${item.correctCount/item.studentCount}"
                                                                                            type="percent"/></td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <%--                                  <tr>
                                                                                                        <td>1</td>
                                                                                                        <td>계산 이해</td>
                                                                                                        <td>분수의나눗셈</td>
                                                                                                        <td>1</td>
                                                                                                        <td>1</td>
                                                                                                        <td><i
                                                                                                                class="fa-regular fa-circle-check"></i>
                                                                                                        </td>
                                                                                                        <td>80%</td>
                                                                                                      </tr>
                                                                                                      <tr>
                                                                                                        <td>2</td>
                                                                                                        <td>계산 이해</td>
                                                                                                        <td>비례식과 비례배분</td>
                                                                                                        <td>2</td>
                                                                                                        <td>3</td>
                                                                                                        <td><i
                                                                                                                class="fa-regular fa-circle-xmark"></i>
                                                                                                        </td>
                                                                                                        <td>70%</td>
                                                                                                      </tr>
                                                                                                      <tr>
                                                                                                        <td>3</td>
                                                                                                        <td>계산 이해</td>
                                                                                                        <td>소수의나눗셈</td>
                                                                                                        <td>3</td>
                                                                                                        <td>3</td>
                                                                                                        <td><i
                                                                                                                class="fa-regular fa-circle-check"></i>
                                                                                                        </td>
                                                                                                        <td>60%</td>
                                                                                                      </tr>
                                                                                                      <tr>
                                                                                                        <td>4</td>
                                                                                                        <td>계산 이해</td>
                                                                                                        <td>분수의나눗셈</td>
                                                                                                        <td>4</td>
                                                                                                        <td>4</td>
                                                                                                        <td><i
                                                                                                                class="fa-regular fa-circle-check"></i>
                                                                                                        </td>
                                                                                                        <td>50%</td>
                                                                                                      </tr>
                                                                                                      <tr>
                                                                                                        <td>5</td>
                                                                                                        <td>계산 이해</td>
                                                                                                        <td>공간과 입체</td>
                                                                                                        <td>1</td>
                                                                                                        <td>1</td>
                                                                                                        <td><i
                                                                                                                class="fa-regular fa-circle-check"></i>
                                                                                                        </td>
                                                                                                        <td>80%</td>
                                                                                                      </tr>
                                                                                                      <tr>
                                                                                                        <td>6</td>
                                                                                                        <td>추론</td>
                                                                                                        <td>비례식과 비례배분</td>
                                                                                                        <td>2</td>
                                                                                                        <td>2</td>
                                                                                                        <td><i
                                                                                                                class="fa-regular fa-circle-check"></i>
                                                                                                        </td>
                                                                                                        <td>70%</td>
                                                                                                      </tr>
                                                                                                      <tr>
                                                                                                        <td>7</td>
                                                                                                        <td>추론</td>
                                                                                                        <td>소수의나눗셈</td>
                                                                                                        <td>3</td>
                                                                                                        <td>2</td>
                                                                                                        <td><i
                                                                                                                class="fa-regular fa-circle-xmark"></i>
                                                                                                        </td>
                                                                                                        <td>60%</td>
                                                                                                      </tr>
                                                                                                      <tr>
                                                                                                        <td>8</td>
                                                                                                        <td>추론</td>
                                                                                                        <td>분수의나눗셈</td>
                                                                                                        <td>4</td>
                                                                                                        <td>4</td>
                                                                                                        <td><i
                                                                                                                class="fa-regular fa-circle-check"></i>
                                                                                                        </td>
                                                                                                        <td>50%</td>
                                                                                                      </tr>
                                                                                                      <tr>
                                                                                                        <td>9</td>
                                                                                                        <td>추론</td>
                                                                                                        <td>공간과 입체</td>
                                                                                                        <td>1</td>
                                                                                                        <td>1</td>
                                                                                                        <td><i
                                                                                                                class="fa-regular fa-circle-check"></i>
                                                                                                        </td>
                                                                                                        <td>80%</td>
                                                                                                      </tr>
                                                                                                      <tr>
                                                                                                        <td>~</td>
                                                                                                        <td>~</td>
                                                                                                        <td>~</td>
                                                                                                        <td>~</td>
                                                                                                        <td>~</td>
                                                                                                        <td>~</td>
                                                                                                        <td>~</td>
                                                                                                      </tr>
                                                                                                      <tr>
                                                                                                        <td>20</td>
                                                                                                        <td>추론</td>
                                                                                                        <td>비례식과 배분</td>
                                                                                                        <td>3</td>
                                                                                                        <td>3</td>
                                                                                                        <td><i
                                                                                                                class="fa-regular fa-circle-check"></i>
                                                                                                        </td>
                                                                                                        <td>60%</td>
                                                                                                      </tr>--%>
                                                                    </tbody>
                                                                </table>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="justify_between mb90">
                                                        <div class="box_wrap" id="difficulty_box">
                                                            <div class="box_tit"><i
                                                                    class="fa-regular fa-pen-to-square"></i>문항 난이도 별
                                                                성취율
                                                            </div>
                                                            <div class="box box4">
                                                                <div class="justify_between">
                                                                    <table class="tbl_list3 mb30">
                                                                        <caption></caption>
                                                                        <colgroup>
                                                                            <col width="10%">
                                                                            <col width="10%">
                                                                            <col width="10%">
                                                                        </colgroup>
                                                                        <thead>
                                                                        <tr>
                                                                            <th scope="col">난이도</th>
                                                                            <th scope="col">전체 평균</th>
                                                                            <th scope="col"
                                                                                style="color:#4b78ca;">내 성취율
                                                                            </th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        <tr>
                                                                            <td>최상</td>
                                                                            <td class="blue"><%= difficultyAnswerRate.get("최상") != null ? difficultyAnswerRate.get("최상") : "0" %>
                                                                                %
                                                                            </td>
                                                                            <td><%= achievementRates[4] %>%</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>상</td>
                                                                            <td class="blue"><%= difficultyAnswerRate.get("상") != null ? difficultyAnswerRate.get("상") : "0" %>
                                                                                %
                                                                            </td>
                                                                            <td><%= achievementRates[3] %>%</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>중</td>
                                                                            <td class="blue"><%= difficultyAnswerRate.get("중") != null ? difficultyAnswerRate.get("중") : "0" %>
                                                                                %
                                                                            </td>
                                                                            <td><%= achievementRates[2] %>%</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>하</td>
                                                                            <td class="blue"><%= difficultyAnswerRate.get("하") != null ? difficultyAnswerRate.get("하") : "0" %>
                                                                                %
                                                                            </td>
                                                                            <td><%= achievementRates[1] %>%</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>최하</td>
                                                                            <td class="blue"><%= difficultyAnswerRate.get("최하") != null ? difficultyAnswerRate.get("최하") : "0" %>
                                                                                %
                                                                            </td>
                                                                            <td><%= achievementRates[0] %>%</td>
                                                                        </tr>
                                                                        </tbody>
                                                                    </table>

                                                                    <!--그래프 영역-->
                                                                    <div class="graph_area ml20">
                                                                        <canvas id="difficulty_graph" width="830"
                                                                                height="350"></canvas>
                                                                    </div>
                                                                    <!--그래프 영역-->
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="box_wrap" id="item_type_box">
                                                            <div class="box_tit"><i
                                                                    class="fa-regular fa-pen-to-square"></i>객관식/주관식 별
                                                                정답률
                                                            </div>
                                                            <div class="box box10">
                                                                <table class="tbl_list4 mb20">
                                                                    <caption></caption>
                                                                    <colgroup>
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                    </colgroup>
                                                                    <thead>
                                                                    <tr>
                                                                        <th scope="col">문제 유형</th>
                                                                        <th scope="col">전체 평균</th>
                                                                        <th scope="col" style="color: #4b78ca;">
                                                                            내 정답률
                                                                        </th>

                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <%
                                                                        Map<String, Long> allObSubAnswerRate = (Map<String, Long>) request.getAttribute("all_sub_ob_answer_rate");
                                                                        Map<String, Long> myObSubAnswerRate = (Map<String, Long>) request.getAttribute("my_sub_ob_answer_rate");

                                                                        for (String obSub : myObSubAnswerRate.keySet()) {
                                                                    %>
                                                                    <tr>
                                                                        <td><%= obSub %>
                                                                        </td>
                                                                        <td class="blue"><%= allObSubAnswerRate.get(obSub) %>
                                                                            %
                                                                        </td>
                                                                        <td><%= myObSubAnswerRate.get(obSub) %>%</td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                    </tbody>
                                                                </table>


                                                                <!--그래프 영역-->
                                                                <div class="graph_area mt20">
                                                                    <canvas id="ob_sub_graph" width="830"
                                                                            height="350"></canvas>
                                                                </div>
                                                                <!--그래프 영역-->
                                                            </div>
                                                        </div>

                                                        <div class="box_wrap" id="response_box">
                                                            <div class="box_tit"><i
                                                                    class="fa-regular fa-pen-to-square"></i>문제
                                                                유형 별 정답률
                                                            </div>
                                                            <div class="box box11">
                                                                <table class="tbl_list4 mb10">
                                                                    <caption></caption>
                                                                    <colgroup>
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                    </colgroup>
                                                                    <thead>
                                                                    <tr>
                                                                        <th scope="col">응답 유형</th>
                                                                        <th scope="col">전체 평균</th>
                                                                        <th scope="col" style="color: #4b78ca;">
                                                                            내 정답률
                                                                        </th>

                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <%
                                                                        Map<String, Long> allQuestionTypeAnswerRate = (Map<String, Long>) request.getAttribute("all_question_type_answer_rate");
                                                                        Map<String, Long> myQuestionTypeAnswerRate = (Map<String, Long>) request.getAttribute("my_question_type_answer_rate");

                                                                        for (String questionType : myQuestionTypeAnswerRate.keySet()) {
                                                                    %>
                                                                    <tr>
                                                                        <td><%= questionType %>
                                                                        </td>
                                                                        <td class="blue"><%= allQuestionTypeAnswerRate.get(questionType) %>
                                                                            %
                                                                        </td>
                                                                        <td><%= myQuestionTypeAnswerRate.get(questionType) %>
                                                                            %
                                                                        </td>
                                                                    </tr>
                                                                    <%
                                                                        }
                                                                    %>
                                                                    </tbody>
                                                                </table>


                                                                <!--그래프 영역-->
                                                                <div class="graph_area mt20">
                                                                    <canvas id="response_graph" width="830"
                                                                            height="350"></canvas>
                                                                </div>
                                                                <!--그래프 영역-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!--tab_con-->
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%--  </div>--%>
</main>


<c:if test="${not empty not_exam}">
    <div class="pop" style="display:block; position: fixed; padding-top: 15%;">
        <button class="btn-close"><span class="hbar"></span><span class="hbar"></span><span class="hide-txt">닫기</span>
        </button>
        <p>시험을 응시하지 않아 리포트가 제공되지 않습니다.<br>시험에 응시해 주세요.</p>
        <div class="btn-wrap">
            <a href="/user/exam/user-exam-subject?school_level=${examInformationResponse.schoolLevel}&exam_round=1&year=2022">기출
                문제 풀이<br>응시하기</a>
            <a href="/user/exam/user-exam-subject?school_level=${examInformationResponse.schoolLevel}&exam_round=2&year=2022">B셀파
                문제 풀이<br>응시하기</a>
        </div>
    </div>
</c:if>

<!-- s: 220722 추가 -->
<div class="popup wrap <c:choose>
        <c:when test="${exam.examRound eq 0 and exam.schoolLevel eq '0' and exam.subjectId eq 0}">class-math</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 14}">class1-korean</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 15}">class-english</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 16}">class-math</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 17}">class1-social</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 18}">class1-science</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 14}">class2-korean ui-class2-korean</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 15}">class-english ui-class2-english</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 16}">class-math ui-class2-math</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 17}">class-social ui-class2-social</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 18}">class2-science ui-class2-science</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL03' and exam.subjectId eq 14}">class3-korean ui-class3-korean</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL03' and exam.subjectId eq 15}">class3-english ui-class3-english</c:when>
        <c:when test="${exam.examRound eq 1 and exam.schoolLevel eq 'SL03' and exam.subjectId eq 16}">class-math ui-class3-math</c:when>
                        <%-- 초등 2회 --%>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 14}">test02-class1-korean</c:when>
<%--        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 15}">test02-class1-english</c:when>--%>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 15}">class-english</c:when>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 16}">class-math</c:when>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 17}">test02-class1-social</c:when>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL01' and exam.subjectId eq 18}">test02-class1-science</c:when>
        <%-- 중등 2회  국영수사과--%>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 14}">test02-class2-korean ui-test2-class2-korean</c:when>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 15}">test02-class2-english ui-test2-class2-english</c:when>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 16}">class-math ui-test2-class2-math</c:when>
<%--        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 17}">class-social ui-class2-social</c:when>--%>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL02' and exam.subjectId eq 18}">wrap class-science</c:when>
        <%-- 고등 2회 --%>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL03' and exam.subjectId eq 14}">test02-class3-korean</c:when>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL03' and exam.subjectId eq 15}">class-english ui-test2-class3-english</c:when>
        <c:when test="${exam.examRound eq 2 and exam.schoolLevel eq 'SL03' and exam.subjectId eq 16}">class-math ui-test2-class3-math</c:when>
        <c:otherwise></c:otherwise>
    </c:choose>" id="item_popup">

    <input type="hidden" id="student_id" value="${examInformation.student_id}"/>
    <input type="hidden" id="marketing_yn" value="${examInformation.marketing_yn}"/>
    <input type="hidden" id="exam_round" value="${exam.examRound}"/>
</div>

<script>
    const difficultyAnswerRate = JSON.parse('<%= difficultyAnswerRateJson %>');
    const achievementRates = JSON.parse('<%= achievementRatesJson %>');

    document.addEventListener("DOMContentLoaded", function () {
        const difficultyLabels = ['최상', '상', '중', '하', '최하'];

        const averageRates = [
            difficultyAnswerRate["최상"] || 0,
            difficultyAnswerRate["상"] || 0,
            difficultyAnswerRate["중"] || 0,
            difficultyAnswerRate["하"] || 0,
            difficultyAnswerRate["최하"] || 0
        ];

        const myRates = achievementRates;

        const difficultyCtx = document.getElementById('difficulty_graph').getContext('2d');
        const difficultyChart = new Chart(difficultyCtx, {
            type: 'bar',
            data: {
                labels: difficultyLabels,
                datasets: [
                    {
                        label: '전체 평균',
                        data: averageRates,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    },
                    {
                        label: '내 성취율',
                        data: myRates,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 100
                    }
                }
            }
        });
    });
</script>
<script>
    // JSON 데이터를 JavaScript 변수에 할당
    const allObSubAnswerRate = JSON.parse('<%= new ObjectMapper().writeValueAsString(allObSubAnswerRate) %>');
    const myObSubAnswerRate = JSON.parse('<%= new ObjectMapper().writeValueAsString(myObSubAnswerRate) %>');

    document.addEventListener("DOMContentLoaded", function () {
        const obSubTypes = Object.keys(myObSubAnswerRate);

        const averageRates = obSubTypes.map(type => allObSubAnswerRate[type] || 0);
        const myRates = obSubTypes.map(type => myObSubAnswerRate[type] || 0);

        const obSubCtx = document.getElementById('ob_sub_graph').getContext('2d');
        const obSubChart = new Chart(obSubCtx, {
            type: 'bar',
            data: {
                labels: obSubTypes,
                datasets: [
                    {
                        label: '전체 평균',
                        data: averageRates,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    },
                    {
                        label: '내 정답률',
                        data: myRates,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 100
                    }
                }
            }
        });
    });
</script>
<script>
    // JSON 데이터를 JavaScript 변수에 할당
    const allQuestionTypeAnswerRate = JSON.parse('<%= new ObjectMapper().writeValueAsString(allQuestionTypeAnswerRate) %>');
    const myQuestionTypeAnswerRate = JSON.parse('<%= new ObjectMapper().writeValueAsString(myQuestionTypeAnswerRate) %>');

    document.addEventListener("DOMContentLoaded", function () {
        const questionTypes = Object.keys(myQuestionTypeAnswerRate);

        const averageRates = questionTypes.map(type => allQuestionTypeAnswerRate[type] || 0);
        const myRates = questionTypes.map(type => myQuestionTypeAnswerRate[type] || 0);

        const responseCtx = document.getElementById('response_graph').getContext('2d');
        const responseChart = new Chart(responseCtx, {
            type: 'bar',
            data: {
                labels: questionTypes,
                datasets: [
                    {
                        label: '전체 평균',
                        data: averageRates,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    },
                    {
                        label: '내 정답률',
                        data: myRates,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 100
                    }
                }
            }
        });
    });
</script>
</body>
<%--<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>--%>
<script src="/js/html2canvas.js"></script>
<script src="/js/jspdf.debug.js"></script>
<script>

</script>
<!-- s: 220722 추가 -->
<script>
    <c:choose>
    <c:when test="${not empty average.averageTime}">
    const averageTime = ${average.averageTime};
    </c:when>
    <c:otherwise>
    const averageTime = 180;
    </c:otherwise>
    </c:choose>


    $(function () {
        let popBtn = $('.viewBtn');
        let popCnt = $('.popup');
        let closeBtn = $('.btn-close');

        let examStartTime = document.getElementById('examStartTime').value;

        let examStartTimeDiv = document.getElementById('examStartTimeDiv');

        examStartTimeDiv.innerText = examStartTime.substring(0, 10);

        // $('#examStartTime').val(examStartTime.substring(0,1));

        function popOpen() {
            //$('html, body').addClass('h100');
            showItem(this.id);
            //popCnt.show();
        }

        function popClose() {
            //$('html, body').removeClass('h100');
            //popCnt.hide();
        }

        popBtn.on('click', popOpen)
        closeBtn.on('click', popClose)
    })

    function showItem(questionId) {
        console.log("Received questionId:", questionId);
        const url = "/user/exam/report-answer?questionId=" + questionId;
        console.log("Constructed URL:", url);
        window.open(url, "_blank");
    }

    function showMyItem(solvedQuestionId) {
        console.log("Received questionId:", solvedQuestionId);
        const url = "/user/exam/report-student-answer?solvedQuestionId=" + solvedQuestionId;
        console.log("Constructed URL:", url);
        window.open(url, "_blank");
    }

    function changeReportRound() {
        const roundSelect = document.getElementById('round_select');
        const selectedOption = roundSelect.options[roundSelect.selectedIndex];
        const examYearRound = selectedOption.value.split('-');
        const examinationSequence = selectedOption.getAttribute('data-sequence'); // sequence 값 가져오기
        const year = examYearRound[0];
        const examRound = examYearRound[1];
        location.href = '/user/exam/report?school_level=SL02&exam_round=' + examRound + '&year=' + year + '&examination_sequence=' + examinationSequence;
    }

    function changeReportSubject() {
        const subjectId = document.getElementById('subject_select').value;
        const examYearRound = document.getElementById('round_select').value.split('-');
        const year = examYearRound[0];
        const examRound = examYearRound[1];
        location.href = '/user/exam/report?subject_id=' + subjectId + '&exam_round=' + examRound + '&year=' + year + '&examination_sequence=1';
    }

    let initGraph = false;

    function tempDetailReport() {
        event.preventDefault();
        alert("정확한 분석을 위해 데이터를 취합하고 있으며,\n상세 리포트는 추후 오픈 예정입니다.");
    }

    function readDetailReport() {
        let studentId = document.getElementById('student_id').value;
        let marketingYn = document.getElementById('marketing_yn').value;
        marketingConfirm(studentId, marketingYn);
        if (initGraph === false) {
            readSubjectAbility(document.getElementById('subject_ability_box'), document.getElementById('subject_ability_graph'), '${examInformationResponse.examId}', '${exam.schoolLevel}', '${exam.subjectId}', '내 성취율');
            readDifficultData(document.getElementById('difficulty_box'), document.getElementById('difficulty_graph'), '${exam.examId}', '${exam.schoolLevel}', '${exam.subjectId}', '내 성취율');
            readContentCategory(document.getElementById('content_box'), document.getElementById('content_graph'), '${examInformationResponse.examId}', '${exam.schoolLevel}', '${exam.subjectId}', '내 성취율');
            readActivityCategory(document.getElementById('activity_box'), document.getElementById('activity_graph'), '${examInformationResponse.examId}', '${exam.schoolLevel}', '${exam.subjectId}', '내 성취율');
            readDifficultByTime(document.getElementById('difficulty_time_box'), document.getElementById('difficulty_time_graph'), '${examInformationResponse.examId}', '${exam.schoolLevel}', '${exam.subjectId}', '내 소요시간', averageTime);
            readContentByTime(document.getElementById('content_time_box'), document.getElementById('content_time_graph'), '${examInformationResponse.examId}', '${exam.schoolLevel}', '${exam.subjectId}', '내 소요시간', averageTime);
            readItemType(document.getElementById('item_type_box'), document.getElementById('item_type_graph'), '${examInformationResponse.examId}', '${exam.schoolLevel}', '${exam.subjectId}', '내 정답률');
            readResponseType(document.getElementById('response_box'), document.getElementById('response_graph'), '${examInformationResponse.examId}', '${exam.schoolLevel}', '${exam.subjectId}', '내 정답률');
            initGraph = true;
        }
    }

    async function generatePDF() {
        const schoolLevel = <c:choose>
            <c:when test="${exam.schoolLevel eq 'SL01'}">'초등'
        </c:when>
        <c:when test="${exam.schoolLevel eq 'SL02'}">'중등'
        </c:when>
        <c:when test="${exam.schoolLevel eq 'SL03'}">'고등'
        </c:when>
        <c:otherwise>''</c:otherwise>
        </c:choose>;
        const subjectId = <c:choose>
            <c:when test="${exam.subjectId eq 14}">'국어'
        </c:when>
        <c:when test="${exam.subjectId eq 15}">'영어'
        </c:when>
        <c:when test="${exam.subjectId eq 16}">'수학'
        </c:when>
        <c:when test="${exam.subjectId eq 17}">'사회'
        </c:when>
        <c:when test="${exam.subjectId eq 18}">'과학'
        </c:when>
        <c:when test="${exam.subjectId eq 18}">'역사'
        </c:when>
        <c:when test="${exam.subjectId eq 18}">'도덕'
        </c:when>
        <c:otherwise>''</c:otherwise>
        </c:choose>;
        const nickName = '${nickname}';
        const examRound = '${exam.examRound}';
        <fmt:parseDate value="${exam.examEndTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
        const endTime = '<fmt:formatDate pattern="yyMMdd" value="${parsedDateTime}"/>';
        var pageWidth = 210;
        var pageHeight = pageWidth * 1.414;
        var doc = new jsPDF("p", "mm", [pageHeight, pageWidth]);
        setTimeout(function () {
            html2canvas($('#student_summary'), {
                background: "#FFFFFF",
                onrendered: function (canvas) {
                    var imgData = canvas.toDataURL("image/jpeg");
                    var imgWidth = pageWidth - 20;
                    var imgHeight = canvas.height * imgWidth / canvas.width;
                    var heightLeft = imgHeight;
                    var position = 0;
                    doc.addImage(imgData, "JPEG", 10, 10, imgWidth, imgHeight);
                }
            });
            html2canvas($('#subject_ability_box'), {
                background: "#FFFFFF",
                onrendered: function (canvas) {
                    var imgData = canvas.toDataURL("image/jpeg");
                    var imgWidth = pageWidth - 20;
                    var imgHeight = canvas.height * imgWidth / canvas.width;
                    var heightLeft = imgHeight;
                    var position = 0;
                    doc.addImage(imgData, "JPEG", 10, 100, imgWidth, imgHeight);
                    doc.addPage();
                }
            });
            html2canvas($('#difficulty_box'), {
                background: "#FFFFFF",
                onrendered: function (canvas) {
                    // 한글깨짐현상때문에 jpeg->jspdf 전환
                    var imgData = canvas.toDataURL("image/jpeg");
                    var imgWidth = pageWidth - 20;
                    var imgHeight = canvas.height * imgWidth / canvas.width;
                    var heightLeft = imgHeight;
                    var position = 0;
                    doc.addImage(imgData, "JPEG", 10, 10, imgWidth, imgHeight);
                    doc.addPage();
                }
            });
            html2canvas($('#content_box'), {
                background: "#FFFFFF",
                onrendered: function (canvas) {
                    // 한글깨짐현상때문에 jpeg->jspdf 전환
                    var imgData = canvas.toDataURL("image/jpeg");
                    var imgWidth = pageWidth - 20;
                    var imgHeight = canvas.height * imgWidth / canvas.width;
                    var heightLeft = imgHeight;
                    var position = 0;
                    doc.addImage(imgData, "JPEG", 10, 10, imgWidth, imgHeight);
                    doc.addPage();
                }
            });
            html2canvas($('#activity_box'), {
                background: "#FFFFFF",
                onrendered: function (canvas) {
                    var imgData = canvas.toDataURL("image/jpeg");
                    var imgWidth = pageWidth - 20;
                    var imgHeight = canvas.height * imgWidth / canvas.width;
                    var heightLeft = imgHeight;
                    var position = 0;
                    doc.addImage(imgData, "JPEG", 10, 10, imgWidth, imgHeight);
                    doc.addPage();
                }
            });
            html2canvas($('#difficulty_time_box'), {
                background: "#FFFFFF",
                onrendered: function (canvas) {
                    // 한글깨짐현상때문에 jpeg->jspdf 전환
                    var imgData = canvas.toDataURL("image/jpeg");
                    var imgWidth = pageWidth - 20;
                    var imgHeight = canvas.height * imgWidth / canvas.width;
                    var heightLeft = imgHeight;
                    var position = 0;
                    doc.addImage(imgData, "JPEG", 10, 10, imgWidth, imgHeight);
                    doc.addPage();
                }
            });
            html2canvas($('#content_time_box'), {
                background: "#FFFFFF",
                onrendered: function (canvas) {
                    // 한글깨짐현상때문에 jpeg->jspdf 전환
                    var imgData = canvas.toDataURL("image/jpeg");
                    var imgWidth = pageWidth - 20;
                    var imgHeight = canvas.height * imgWidth / canvas.width;
                    var heightLeft = imgHeight;
                    var position = 0;
                    doc.addImage(imgData, "JPEG", 10, 10, imgWidth, imgHeight);
                    doc.addPage();
                }
            });
            html2canvas($('#box_answer'), {
                background: "#FFFFFF",
                onrendered: function (canvas) {
                    var imgData = canvas.toDataURL("image/jpeg");
                    var imgWidth = pageWidth - 20;
                    var imgHeight = canvas.height * imgWidth / canvas.width;
                    var heightLeft = imgHeight;
                    var position = 0;
                    doc.addImage(imgData, "JPEG", 10, 10, imgWidth, imgHeight);
                    heightLeft -= pageHeight;

                    while (heightLeft >= 20) {
                        position = heightLeft - imgHeight;
                        doc.addPage();
                        doc.addImage(imgData, "JPEG", 10, position, imgWidth, imgHeight);
                        heightLeft -= pageHeight;
                    }
                    doc.addPage();
                }
            });
            html2canvas($('#item_type_box'), {
                background: "#FFFFFF",
                onrendered: function (canvas) {
                    var imgData = canvas.toDataURL("image/jpeg");
                    var imgWidth = pageWidth - 20;
                    var imgHeight = canvas.height * imgWidth / canvas.width;
                    var heightLeft = imgHeight;
                    var position = 0;
                    doc.addImage(imgData, "JPEG", 10, 10, imgWidth, imgHeight);
                    doc.addPage();
                }
            });
            html2canvas($('#response_box'), {
                background: "#FFFFFF",
                onrendered: function (canvas) {
                    // 한글깨짐현상때문에 jpeg->jspdf 전환
                    var imgData = canvas.toDataURL("image/jpeg");
                    var imgWidth = pageWidth - 20;
                    var imgHeight = canvas.height * imgWidth / canvas.width;
                    var heightLeft = imgHeight;
                    var position = 0;
                    doc.addImage(imgData, "JPEG", 10, 10, imgWidth, imgHeight);
                    doc.save(nickName + '_' + schoolLevel + '_' + subjectId + '_' + examRound + '회_' + endTime);
                }
            });
        }, 100);
    }

</script>
<script>
    function displayExaminationHistory() {
        const selectedIndex = parseInt(document.getElementById("round_select").value) - 1; // 1-based index adjustment
        const examinationHistories = JSON.parse(document.getElementById("examinationHistoriesData").textContent);

        document.getElementById("username").innerText = examinationHistories[selectedIndex].username;
        document.getElementById("grade").innerText = examinationHistories[selectedIndex].grade + " 학년";
        document.getElementById("subjectName").innerText = examinationHistories[selectedIndex].subjectName;
        document.getElementById("modifiedAt").innerText = examinationHistories[selectedIndex].modifiedAt;
    }

    function setBarPosition(achievementPercentage) {
        let position = achievementPercentage + "%";
        document.querySelector(".user_name").style.left = position;
    }

    const achievementPercentage = <%= achievementPercentage %>;
    setBarPosition(achievementPercentage);
</script>
</html>
