<%@ page import="bgaebalja.exsherpa.question.domain.GetQuestionResponse" %>
<%@ page import="bgaebalja.exsherpa.examination.domain.GetSolvedQuestionResponse" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:formatDate value="${today}" pattern="yyyyMMdd" var="nowDate"/>

<!DOCTYPE html>
<html>
<head>
    <title>EX셀파 (내가 선택한 답안)</title>
    <link rel="stylesheet" href="/css/report.css?ver=${nowDate}">
    <link href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css" rel="stylesheet">
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://kit.fontawesome.com/266dd736a0.js" crossorigin="anonymous"></script>

    <style>
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .question-url h2, .question-answer h2 {
            font-size: 1.5em;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .question-answer h3 {
            font-size: 1.2em;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<%
    GetQuestionResponse getQuestionResponse = (GetQuestionResponse) request.getAttribute("getQuestionResponse");
    GetSolvedQuestionResponse getSolvedQuestionResponse = (GetSolvedQuestionResponse) request.getAttribute("getSolvedQuestionResponse");
%>
<div class="container">
    <div class="question-url">
        <div>
            <% if (getQuestionResponse == null || getQuestionResponse.getContent() == null) { %>
            <p>문제가 제공되지 않았습니다.</p>
            <% } else { %>
            <h2>문제</h2>&nbsp;<img src="<%= getQuestionResponse.getUrl() %>">
            <% } %>
        </div>
    </div>
    <br/>

    <div class="question-answer">
        <% if (getQuestionResponse == null || getQuestionResponse.getAnswerUrl() == null) { %>
        <p>정답이 제공되지 않았습니다.</p>
        <% } else { %>
        <h2>내가 제출한 답안</h2>
        <h3><%= getSolvedQuestionResponse.getSubmittedAnswer() %>
        </h3>
        <% } %>
    </div>
</div>
</div>
</body>
</html>
