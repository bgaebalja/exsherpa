<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:formatDate value="${today}" pattern="yyyyMMdd" var="nowDate"/>

<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">

<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>온라인 학업성취도 평가 (리포트)</title>

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
                            <input type="radio" name="tabmenu" id="tmenu1" class="tab">
                            <a href="/user/exam/user-exam-cbt?school_level=${examInformationResponse.schoolLevel}"
                               class="tlabel2 label">CBT 대표유형</a>
                        </li>
                        <li id="tab1" class="tab_btn">
                            <input type="radio" name="tabmenu" id="tmenu2" class="tab">
                            <a href="/user/exam/user-exam-subject?school_level=${examInformationResponse.schoolLevel}&exam_round=1&year=${examInformationResponse.year}"
                               class="tlabel2 label">실전시험Ⅰ</a>
                        </li>
                        <li id="tab1" class="tab_btn">
                            <input type="radio" name="tabmenu" id="tmenu3" class="tab">
                            <a href="/user/exam/user-exam-subject?school_level=${examInformationResponse.schoolLevel}&exam_round=2&year=${examInformationResponse.year}"
                               class="tlabel2 label">실전시험Ⅱ</a>
                        </li>
                        <li id="tab1" class="tab_btn">
                            <input type="radio" checked name="tabmenu" id="tmenu4" class="tab">
                            <label class="tlabel4 label" for="tmenu4">Report</label>
                            <div class="tab_con pt40">
                                <div class="flex_end3">
                                    <select class="select_box ml05" id="round_select" onchange="changeReportRound();">
                                        <c:choose>
                                            <c:when test="${examInformationResponse.schoolLevel eq 'SL01'}">
                                                <option
                                                        <c:if test="${examInformationResponse.examRound eq 1}">selected</c:if>
                                                        value="2022-1">22년 1회
                                                </option>
                                                <option
                                                        <c:if test="${examInformationResponse.year eq '2022' and examInformationResponse.examRound eq 2}">selected</c:if>
                                                        value="2022-2">22년 2회
                                                </option>
                                                <option
                                                        <c:if test="${examInformationResponse.year eq '2023' and examInformationResponse.examRound eq 2}">selected</c:if>
                                                        value="2023-2">23년 2회
                                                </option>
                                            </c:when>
                                            <c:otherwise>
                                                <option
                                                        <c:if test="${examInformationResponse.examRound eq 1}">selected</c:if>
                                                        value="2022-1">1회
                                                </option>
                                                <option
                                                        <c:if test="${examInformationResponse.examRound eq 2}">selected</c:if>
                                                        value="2022-2">2회
                                                </option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                    <select class="select_box mr05" id="subject_select"
                                            onchange="changeReportSubject();">
                                        <c:forEach var="subjectCodeValue" items="${examData.subjectId}">
                                            <c:choose>
                                                <c:when test="${subjectCodeValue eq 14}">
                                                    <option value="${subjectCodeValue}"
                                                            <c:if test="${exam.subjectId eq subjectCodeValue}">selected</c:if>>
                                                        국어
                                                    </option>
                                                </c:when>
                                                <c:when test="${subjectCodeValue eq 15}">
                                                    <option value="${subjectCodeValue}"
                                                            <c:if test="${exam.subjectId eq subjectCodeValue}">selected</c:if>>
                                                        영어
                                                    </option>
                                                </c:when>
                                                <c:when test="${subjectCodeValue eq 16}">
                                                    <option value="${subjectCodeValue}"
                                                            <c:if test="${exam.subjectId eq subjectCodeValue}">selected</c:if>>
                                                        수학
                                                    </option>
                                                </c:when>
                                                <c:when test="${subjectCodeValue eq 17}">
                                                    <option value="${subjectCodeValue}"
                                                            <c:if test="${exam.subjectId eq subjectCodeValue}">selected</c:if>>
                                                        사회
                                                    </option>
                                                </c:when>
                                                <c:when test="${subjectCodeValue eq 18}">
                                                    <option value="${subjectCodeValue}"
                                                            <c:if test="${exam.subjectId eq subjectCodeValue}">selected</c:if>>
                                                        과학
                                                    </option>
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>
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
                                                            <div class="box box1" style="padding: 50px 70px;">
                                                                <input type="hidden" id="nickname" value="${nickname}"/>
                                                                <ul style="padding-bottom: 20px"><i
                                                                        class="fa-solid fa-rectangle-vertical"
                                                                        style="width: 10px; border-radius: 0; vertical-align: middle;"></i>이름&nbsp&nbsp&nbsp&nbsp
                                                                    <li>${nickname}</li>
                                                                </ul>
                                                                <ul style="padding-bottom: 20px"><i
                                                                        class="fa-solid fa-rectangle-vertical"
                                                                        style="width: 10px; border-radius: 0; vertical-align: middle;"></i>학년&nbsp&nbsp&nbsp&nbsp
                                                                    <li><c:choose>
                                                                        <c:when test="${schoolLevel eq 'SL01'}">6학년</c:when>
                                                                        <c:when test="${schoolLevel eq 'SL02'}">3학년</c:when>
                                                                        <c:otherwise>2학년</c:otherwise>
                                                                    </c:choose></li>
                                                                </ul>
                                                                <ul style="padding-bottom: 20px"><i
                                                                        class="fa-solid fa-rectangle-vertical"
                                                                        style="width: 10px; border-radius: 0; vertical-align: middle;"></i>응시과목
                                                                    <li class="last">
                                                                        <c:if test="${examInformation.subject_id eq 14}">국어</c:if>
                                                                        <c:if test="${examInformation.subject_id eq 15}">영어</c:if>
                                                                        <c:if test="${examInformation.subject_id eq 16}">수학</c:if>
                                                                        <c:if test="${examInformation.subject_id eq 17}">사회</c:if>
                                                                        <c:if test="${examInformation.subject_id eq 18}">과학</c:if>
                                                                    </li>
                                                                </ul>
                                                                <input type="hidden" id="examStartTime"
                                                                       name="examStartTime"
                                                                       value="${examInformation.exam_start_time}">
                                                                <ul style="padding-bottom: 20px"><i
                                                                        class="fa-solid fa-rectangle-vertical"
                                                                        style="width: 10px; border-radius: 0; vertical-align: middle;"></i>응시일자
                                                                    <li class="last">
                                                                        <div id="examStartTimeDiv"
                                                                             style="overflow: hidden; white-space: nowrap; display: inline-block; vertical-align: middle;"></div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="score_box">
                                                    <div class="score_txt">
                                                        <fmt:parseNumber value="${score}" pattern="0" var="num"/>
                                                        <span class="score"><em>${num}점</em> / 100점</span>
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
                                                    <%--@elvariable id="itemResultList" type="java.util.List"--%>
                                                    <c:choose>
                                                        <c:when test="${not empty not_exam}">
                                                            <tr>
                                                                <td colspan="3">응시 이력이 없습니다. 시험에 응시한 뒤 리포트를 조회해 주세요.
                                                                </td>
                                                            </tr>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach var="item" items="${itemList}">
                                                                <tr>
                                                                    <td class="first">${item.itemOrderName}</td>
                                                                    <c:choose>
                                                                        <c:when test="${item.correctYn ne 'Y'}">
                                                                            <td><i class="fa-regular fa-circle-xmark"
                                                                                   style="color: red;"></i></td>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <td><i class="fa-regular fa-circle-check"
                                                                                   style="color: green;"></i></td>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <td><a href="javascript:showItem('${item.itemId}');"
                                                                           id="${item.itemId}" class="viewBtn">상세 보기</a>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:otherwise>
                                                    </c:choose>
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
                                                                        <td><fmt:formatNumber
                                                                                value="${detailReportInfo.item_cnt}"
                                                                                type="number"/></td>
                                                                        <td><fmt:formatNumber
                                                                                value="${detailReportInfo.correct_item_cnt}"
                                                                                type="number"/></td>
                                                                        <td><fmt:formatNumber
                                                                                value="${detailReportInfo.achievePer}"
                                                                                type="percent"/></td>
                                                                        <td><c:choose>
                                                                            <c:when test="${detailReportInfo.achievePer >= 0 && detailReportInfo.achievePer <= 0.19}">1수준</c:when>
                                                                            <c:when test="${detailReportInfo.achievePer >= 0.2 && detailReportInfo.achievePer <= 0.49}">2수준</c:when>
                                                                            <c:when test="${detailReportInfo.achievePer >= 0.5 && detailReportInfo.achievePer <= 0.79}">3수준</c:when>
                                                                            <c:otherwise>4수준</c:otherwise>
                                                                        </c:choose></td>
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
                                                        <div class="box_wrap" id="subject_ability_box">
                                                            <div class="box_tit"><i
                                                                    class="fa-regular fa-pen-to-square"></i>교과 역량별
                                                                성취율
                                                            </div>
                                                            <div class="box box3">
                                                                <table class="tbl_list3 mb30">
                                                                    <caption></caption>
                                                                    <colgroup>
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                    </colgroup>
                                                                    <thead>
                                                                    <tr>
                                                                        <th scope="col"></th>
                                                                        <th scope="col">계산이해</th>
                                                                        <th scope="col">추론</th>
                                                                        <th scope="col">문제해결</th>
                                                                        <th scope="col">정보처리</th>
                                                                        <th scope="col">의사소통</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td>평균</td>
                                                                        <td>90</td>
                                                                        <td>75</td>
                                                                        <td>80</td>
                                                                        <td>75</td>
                                                                        <td>65</td>
                                                                    </tr>
                                                                    <tr class="blue">
                                                                        <td>${nickname}</td>
                                                                        <td>95</td>
                                                                        <td>94</td>
                                                                        <td>91</td>
                                                                        <td>93</td>
                                                                        <td>85</td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>


                                                                <!--그래프 영역-->
                                                                <div class="graph_area">
                                                                    <canvas id="subject_ability_graph" width="878"
                                                                            height="400" style="margin: auto;"></canvas>
                                                                </div>
                                                                <!--그래프 영역-->
                                                            </div>
                                                        </div>

                                                        <div class="box_wrap" id="difficulty_box">
                                                            <div class="box_tit"><i
                                                                    class="fa-regular fa-pen-to-square"></i>문항 난이도별
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
                                                                            <td class="blue">-</td>
                                                                            <td>-</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>상</td>
                                                                            <td class="blue">80</td>
                                                                            <td>70</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>중</td>
                                                                            <td class="blue">80</td>
                                                                            <td>75</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>하</td>
                                                                            <td class="blue">100</td>
                                                                            <td>95</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>최하</td>
                                                                            <td class="blue">100</td>
                                                                            <td>95</td>
                                                                        </tr>
                                                                        </tbody>
                                                                    </table>


                                                                    <!--그래프 영역-->
                                                                    <div class="graph_area ml20">
                                                                        <canvas id="difficulty_graph" width="830"
                                                                                height="350"
                                                                                style="margin: auto;"></canvas>
                                                                    </div>
                                                                    <!--그래프 영역-->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--두번째 단락-->

                                                    <!--세번째 단락-->
                                                    <div class="justify_between mb90">
                                                        <div class="box_wrap" id="content_box">
                                                            <div class="box_tit"><i
                                                                    class="fa-regular fa-pen-to-square"></i>
                                                                <c:choose>
                                                                    <c:when test="${examInformation.subject_id eq 14}">(국어)</c:when>
                                                                    <c:when test="${examInformation.subject_id eq 15}">(영어)</c:when>
                                                                    <c:when test="${examInformation.subject_id eq 16}">(수학)</c:when>
                                                                    <c:when test="${examInformation.subject_id eq 17}">(사회)</c:when>
                                                                    <c:when test="${examInformation.subject_id eq 18}">(과학)</c:when>
                                                                </c:choose> 교과
                                                                내용 영역별 성취율
                                                            </div>
                                                            <div class="box box5">
                                                                <table class="tbl_list4 mb30">
                                                                    <caption></caption>
                                                                    <colgroup>
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                    </colgroup>
                                                                    <thead>
                                                                    <tr>
                                                                        <th scope="col">내용영역</th>
                                                                        <th scope="col">전체평균</th>
                                                                        <th scope="col" style="color: #4b78ca;">내 성취율
                                                                        </th>

                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td>수와 연산</td>
                                                                        <td class="blue">90</td>
                                                                        <td>80</td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>도형</td>
                                                                        <td class="blue">90</td>
                                                                        <td>80</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>측정</td>
                                                                        <td class="blue">80</td>
                                                                        <td>75</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>자료와 가능성</td>
                                                                        <td class="blue">70</td>
                                                                        <td>80</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>규칙성</td>
                                                                        <td class="blue">90</td>
                                                                        <td>60</td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>


                                                                <!--그래프 영역-->
                                                                <div class="graph_area">
                                                                    <canvas id="content_graph" width="830"
                                                                            height="350" style="margin: auto;"></canvas>
                                                                </div>
                                                                <!--그래프 영역-->
                                                            </div>
                                                        </div>

                                                        <div class="box_wrap" id="activity_box" <c:if
                                                                test="${not empty examInformation.subject_id and examInformation.subject_id eq 15}">
                                                            style="display: none";
                                                        </c:if>>
                                                            <div class="box_tit"><i
                                                                    class="fa-regular fa-pen-to-square"></i>
                                                                <c:choose>
                                                                    <c:when test="${examInformation.subject_id eq 14}">(국어)</c:when>
                                                                    <c:when test="${examInformation.subject_id eq 15}">(영어)</c:when>
                                                                    <c:when test="${examInformation.subject_id eq 16}">(수학)</c:when>
                                                                    <c:when test="${examInformation.subject_id eq 17}">(사회)</c:when>
                                                                    <c:when test="${examInformation.subject_id eq 18}">(과학)</c:when>
                                                                </c:choose> 교과
                                                                행동 영역별 성취율
                                                            </div>
                                                            <div class="box box6">
                                                                <table class="tbl_list4 mb50">
                                                                    <caption></caption>
                                                                    <colgroup>
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                    </colgroup>
                                                                    <thead>
                                                                    <tr>
                                                                        <th scope="col">행동영역</th>
                                                                        <th scope="col">전체평균</th>
                                                                        <th scope="col" style="color: #4b78ca">내 성취율
                                                                        </th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td>계산력</td>
                                                                        <td class="blue">90</td>
                                                                        <td>80</td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>이해력</td>
                                                                        <td class="blue">90</td>
                                                                        <td>80</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>문제 해결력</td>
                                                                        <td class="blue">80</td>
                                                                        <td>75</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>추론력</td>
                                                                        <td class="blue">70</td>
                                                                        <td>80</td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>


                                                                <!--그래프 영역-->
                                                                <div class="graph_area">
                                                                    <canvas id="activity_graph" width="830"
                                                                            height="350" style="margin: auto;"></canvas>
                                                                </div>
                                                                <!--그래프 영역-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--세번째 단락-->

                                                    <!--네번째 단락-->
                                                    <div class="justify_between mb90">
                                                        <div class="box_wrap" id="difficulty_time_box">
                                                            <div class="box_tit"><i
                                                                    class="fa-regular fa-pen-to-square"></i>문항 난이도별
                                                                문제 풀이 소요 시간
                                                            </div>
                                                            <div class="box box7">
                                                                <table class="tbl_list4 mb30">
                                                                    <caption></caption>
                                                                    <colgroup>
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                    </colgroup>
                                                                    <thead>
                                                                    <tr>
                                                                        <th scope="col">난이도</th>
                                                                        <th scope="col">전체평균</th>
                                                                        <th scope="col" style="color: #4b78ca;">
                                                                            내 소요시간
                                                                        </th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td>최상</td>
                                                                        <td class="blue">40초</td>
                                                                        <td>50초</td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>상</td>
                                                                        <td class="blue">40초</td>
                                                                        <td>40초</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>중</td>
                                                                        <td class="blue">30초</td>
                                                                        <td>25초</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>하</td>
                                                                        <td class="blue">30초</td>
                                                                        <td>25초</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>최하</td>
                                                                        <td class="blue">20초</td>
                                                                        <td>20초</td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>


                                                                <!--그래프 영역-->
                                                                <div class="graph_area">
                                                                    <canvas id="difficulty_time_graph" width="830"
                                                                            height="350" style="margin: auto;"></canvas>
                                                                </div>
                                                                <!--그래프 영역-->
                                                            </div>
                                                        </div>

                                                        <div class="box_wrap" id="content_time_box">
                                                            <div class="box_tit"><i
                                                                    class="fa-regular fa-pen-to-square"></i>교과 내용
                                                                영역별 평균 풀이 소요 시간
                                                            </div>
                                                            <div class="box box8">
                                                                <table class="tbl_list4 mb30">
                                                                    <caption></caption>
                                                                    <colgroup>
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                        <col width="10%">
                                                                    </colgroup>
                                                                    <thead>
                                                                    <tr>
                                                                        <th scope="col">영역</th>
                                                                        <th scope="col">전체평균</th>
                                                                        <th scope="col" style="color: #4b78ca;">
                                                                            내 소요시간
                                                                        </th>

                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td>수와 연산</td>
                                                                        <td class="blue">70</td>
                                                                        <td>80</td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>도형</td>
                                                                        <td class="blue">40</td>
                                                                        <td>90</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>측정</td>
                                                                        <td class="blue">50</td>
                                                                        <td>100</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>자료와 가능성</td>
                                                                        <td class="blue">30</td>
                                                                        <td>60</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>규칙성</td>
                                                                        <td class="blue">20</td>
                                                                        <td>30</td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>


                                                                <!--그래프 영역-->
                                                                <div class="graph_area">
                                                                    <canvas id="content_time_graph" width="830"
                                                                            height="350" style="margin: auto;"></canvas>
                                                                </div>
                                                                <!--그래프 영역-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--네번째 단락-->

                                                    <!--다섯번째 단락-->
                                                    <div class="justify_between mb90">
                                                        <div class="box_wrap" id="box_answer">
                                                            <div class="box_tit"><i
                                                                    class="fa-regular fa-pen-to-square"></i>문항별 정오표
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
                                                                        <th scope="col">채점결과</th>
                                                                        <th scope="col">시험응시자 평균 정답률</th>
                                                                    </tr>
                                                                    </thead>
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
                                                                                        <a href="javascript:showItem('${item.itemId}');">정답</a>
                                                                                    </td>
                                                                                    <td>
                                                                                        <a href="javascript:showItem('${item.itemId}','${item.itemResultId}');">답안</a>
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
                                                    <!--다섯번째 단락-->


                                                    <!--여섯번째 단락-->
                                                    <div class="justify_between mb90">
                                                        <div class="box_wrap" id="item_type_box">
                                                            <div class="box_tit"><i
                                                                    class="fa-regular fa-pen-to-square"></i>문제 유형별
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
                                                                    <tr>
                                                                        <td>단순 제시형</td>
                                                                        <td class="blue">90</td>
                                                                        <td>80</td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>정보 활용형</td>
                                                                        <td class="blue">80</td>
                                                                        <td>80</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>미디어 활용형</td>
                                                                        <td class="blue">80</td>
                                                                        <td>70</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>조작형</td>
                                                                        <td class="blue">100</td>
                                                                        <td>80</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>대화형</td>
                                                                        <td class="blue">100</td>
                                                                        <td>80</td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>


                                                                <!--그래프 영역-->
                                                                <div class="graph_area">
                                                                    <canvas id="item_type_graph" width="478"
                                                                            height="290"></canvas>
                                                                </div>
                                                                <!--그래프 영역-->
                                                            </div>
                                                        </div>

                                                        <div class="box_wrap" id="response_box">
                                                            <div class="box_tit"><i
                                                                    class="fa-regular fa-pen-to-square"></i>응답
                                                                유형별 정답률
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
                                                                    <tr>
                                                                        <td>선다형</td>
                                                                        <td class="blue">90</td>
                                                                        <td>80</td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>확장 선택형</td>
                                                                        <td class="blue">80</td>
                                                                        <td>80</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>자료 연결형</td>
                                                                        <td class="blue">80</td>
                                                                        <td>70</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>순서 배열형</td>
                                                                        <td class="blue">100</td>
                                                                        <td>60</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>단답형</td>
                                                                        <td class="blue">100</td>
                                                                        <td>70</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>서술형</td>
                                                                        <td class="blue">80</td>
                                                                        <td>80</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>수정형</td>
                                                                        <td class="blue">100</td>
                                                                        <td>80</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>그래프 그림 완성형</td>
                                                                        <td class="blue">100</td>
                                                                        <td>90</td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>


                                                                <!--그래프 영역-->
                                                                <div class="graph_area">
                                                                    <canvas id="response_graph" width="478"
                                                                            height="210"></canvas>
                                                                </div>
                                                                <!--그래프 영역-->
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--여섯번째 단락-->
                                                </div>
                                                <a href="javascript:generatePDF();" class="downBtn btn"
                                                   style="color: white;">다운로드</a>
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
            <a href="/user/exam/user-exam-subject?school_level=${examInformationResponse.schoolLevel}&exam_round=1&year=2022">실전시험I<br>응시하기</a>
            <a href="/user/exam/user-exam-subject?school_level=${examInformationResponse.schoolLevel}&exam_round=2&year=2022">실전시험II<br>응시하기</a>
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
<!-- e: 220722 추가 -->

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

    function showItem(itemId, itemResultId) {
        const el = document.getElementById('item_popup');
        const options = 'height=800, width=1300';
        const popup = window.open('/user/item/report-answer' +
            '?schoolLevel=${exam.schoolLevel}&examRound=${exam.examRound}&subjectId=${exam.subjectId}&year=${exam.year}&item_id=' + itemId + '&result_id=' + itemResultId, "answer", options);
        /*
        const report = new Report({
          el : el,
          itemId : itemId
        });

         */
    }

    function changeReportRound() {
        const subjectId = document.getElementById('subject_select').value;
        const examYearRound = document.getElementById('round_select').value.split('-');
        const year = examYearRound[0];
        const examRound = examYearRound[1];
        location.href = '/user/exam/report?exam_round=' + examRound + '&year=' + year;
    }

    function changeReportSubject() {
        const subjectId = document.getElementById('subject_select').value;
        const examYearRound = document.getElementById('round_select').value.split('-');
        const year = examYearRound[0];
        const examRound = examYearRound[1];
        location.href = '/user/exam/report?subject_id=' + subjectId + '&exam_round=' + examRound + '&year=' + year;
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
        <c:otherwise>''</c:otherwise>
        </c:choose>;
        const nickName = '${nickname}';
        const examRound = '${exam.examRound}';
        <fmt:parseDate value="${exam.examEndTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
        const endTime = '<fmt:formatDate pattern="yyMMdd" value="${parsedDateTime}"/>';
        var pageWidth = 210; //가로 길이 a4 기준
        var pageHeight = pageWidth * 1.414; //출력 페이지 세로길이
        var doc = new jsPDF("p", "mm", [pageHeight, pageWidth]);
        setTimeout(function () {
            html2canvas($('#student_summary'), {
                background: "#FFFFFF",
                onrendered: function (canvas) {
                    // 한글깨짐현상때문에 jpeg->jspdf 전환
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
                    // 한글깨짐현상때문에 jpeg->jspdf 전환
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
                    // 한글깨짐현상때문에 jpeg->jspdf 전환
                    var imgData = canvas.toDataURL("image/jpeg");
                    var imgWidth = pageWidth - 20;
                    var imgHeight = canvas.height * imgWidth / canvas.width;
                    var heightLeft = imgHeight;
                    var position = 0;
                    doc.addImage(imgData, "JPEG", 10, 10, imgWidth, imgHeight);
                    heightLeft -= pageHeight;

                    // 한 페이지 이상일 경우 루프 돌면서 출력
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
<!-- e: 220722 추가 -->
</html>