<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-07-06
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="icon" href="/img/fav.png">
    <title>학업성취도 평가 관리자</title>
    <style>
      html {
        height: 100%;
      }
    </style>
</head>
<body class="h100">
<div class="wrap">
    <div class="login-wrap">
        <h1>로그인</h1>
        <div class="input-box">
            <form id="login_form">
                <input type="text" id="id" class="line" name="user_id" placeholder="아이디를 입력하세요">
                <input type="password" id="password" name="password" class="line" placeholder="비밀번호를 입력하세요"
                       onkeydown="javascript:enterKey();">
                <div class="check">
                    <input type="checkbox" id="idSave">
                    <label for="idSave">아이디 저장</label>
                </div>
                <button type="button" onclick="login();">로그인</button>
            </form>
        </div>
    </div>
</div>
<script>

  function login() {
    const loginForm = document.getElementById('login_form');
    loginForm.action = "/naea-service/auth/admin-auth-proc";
    loginForm.method = "post";
    loginForm.submit();
  }

  document.addEventListener("DOMContentLoaded", function () {
    const userId = getCookie();
    if (userId !== "") {
      document.getElementById("user_id").value = userId;
      $('input:checkbox[id="idSave"]').attr("checked", true);
    } else {
      $('input:checkbox[id="idSave"]').attr("checked", false);
    }
  });

  function getCookie() {
    const cookieData = document.cookie;
    const userId = cookieData.split(';')
    .find(row => row.startsWith('user_id'))
    .split('=')[1];
    return userId;
  }

  function enterKey() {
    if (window.event.keyCode == 13) {
      login();
    }
  }

</script>
</body>
</html>
