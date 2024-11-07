<%@ page import="bgaebalja.exsherpa.question.domain.GetQuestionResponse" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:formatDate value="${today}" pattern="yyyyMMdd" var="nowDate"/>

<%
    GetQuestionResponse getQuestionResponse = (GetQuestionResponse) request.getAttribute("getQuestionResponse");
%>

<!DOCTYPE html>
<html>
<head>
    <title>EX셀파 (정답 및 해설)</title>
    <link rel="stylesheet" href="/css/report.css?ver=${nowDate}">
    <link href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css" rel="stylesheet">
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://kit.fontawesome.com/266dd736a0.js" crossorigin="anonymous"></script>

    <style>
        .question-url h2, .question-answer-url h2, .question-description-url h2 {
            font-size: 1.5em;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
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

    <div class="question-answer-url">
        <% if (getQuestionResponse == null || getQuestionResponse.getAnswerUrl() == null) { %>
        <p>정답이 제공되지 않았습니다.</p>
        <% } else { %>
        <h2>정답</h2>&nbsp;<img src="<%= getQuestionResponse.getAnswerUrl() %>" target="_blank">
        <% } %>
    </div>
    <br/>

    <div class="question-description-url">
        <% if (getQuestionResponse == null || getQuestionResponse.getDescriptionUrl() == null) { %>
        <p>해설이 제공되지 않았습니다.</p>
        <% } else { %>
        <h2>해설</h2>&nbsp;<img src="<%= getQuestionResponse.getDescriptionUrl() %>" target="_blank">
        <% } %>
    </div>
</div>
</body>
</html>
