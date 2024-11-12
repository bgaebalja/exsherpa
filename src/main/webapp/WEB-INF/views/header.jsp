<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-07-19
  Time: 오후 7:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

    <title>EX셀파</title>

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
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-236784786-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }

        gtag('js', new Date());

        gtag('config', 'UA-236784786-1');
    </script>

    <style>
        /* 상단 공통 영역 */
        #header {
            border-bottom: 0;
        }

        .container {
            padding: 0;
        }

        .container {
            max-width: 1130px;
            min-width: 768px;
            width: 100%;
            padding: 50px 0;
            margin: auto;
        }

        /*.container {position: relative; max-width: 1130px; margin: 0 auto;width: 100%;min-width: 768px;}*/
        #header {
            width: 100%;
            height: 140px;
        }

        #header .menu {
            width: 100%;
            height: 40px;
            background-color: #2f538c;
            color: #fff;
        }

        #header .menu ul {
            height: 100%;
        }

        #header .menu ul li::after {
            content: '|';
            width: 10px;
            height: 10px;
            padding-left: 15px;
            font-size: 13px;
            line-height: 1;
            vertical-align: top;
        }

        #header .menu ul li:last-child::after {
            content: '';
        }

        #header .menu ul li a {
            font-size: 14px;
            color: #fff;
            line-height: 1;
            vertical-align: top;
        }

        #header .top {
            padding: 35px 0;
        }

        #header .top .site_tit {
            font-family: 'SCoreDream';
            font-size: 32px;
            font-weight: 600;
            color: #222;
            cursor: pointer;
            line-height: 1;
            vertical-align: top;
        }

        /*#header .top .user_info {font-size: 18px;}*/
        /*#header .top .user_info .logoutBtn {padding: 12px 18px; align-items: center;  background: var(--gray); color: #fff; border-radius: 20px;}*/

        /* container */
        .container {
            max-width: 1130px;
            min-width: 768px;
            width: 100%;
            padding: 0;
            margin: auto;
        }

        .menu .container {
            height: 27px;
        }

        .justify_between {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .justify_between.user_info {
            align-items: center;
        }

        /*#main {padding-bottom: 40px; }*/
    </style>
</head>
<body>
<header id="header">
    <nav class="menu">
        <div class="container">
            <ul class="justify_start" style="gap: 15px; padding-top: 12px;">
                <li><a href="https://bsherpa.com" target="_blank">B셀파</a></li>
                <li><a href="https://b-log-coral.vercel.app" target="_blank">B로그</a></li>
                <li><a href="https://i.milkt.co.kr/Main/frm_Main.aspx" target="_blank">밀크T아이</a></li>
                <li><a href="http://www.milkt.co.kr/Main/Main_new" target="_blank">밀크T초등</a></li>
                <li><a href="http://mid.milkt.co.kr/Main/frm_Main.aspx" target="_blank">밀크T중학</a></li>
                <li><a href="https://high.milkt.co.kr/Main/frm_Main.aspx" target="_blank">밀크T고등</a></li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <div class="top">
            <div class="justify_between">
                <div class="site_tit" onclick="gotoMain();" style="cursor: pointer;">B셀파 문제풀이 서비스 - EX셀파</div>

                <ul class="justify_between user_info">
                    <%
                        org.springframework.security.core.Authentication authentication =
                                org.springframework.security.core.context.SecurityContextHolder.getContext().getAuthentication();

                        String nickname = null;
                        if (authentication != null && authentication.isAuthenticated()) {
                            nickname = authentication.getName();
                        }
                        System.out.println("nickname = " + nickname);
                        session.setAttribute("email", nickname);
                        assert nickname != null;
                        if (!nickname.equals("anonymousUser")) {
                            out.print("<li><a href=\"#none\">" + nickname + "</a></li><li class=\"ml25\"><a href=\"/users/logout\" class=\"btn logoutBtn\">로그아웃</a></li>");
                        } else {
                            out.print("<li class=\"ml10\"><a href=\"/users/login\" class=\"btn logoutBtn\" style=\"background: #2f538c\">로그인</a></li>");
                        }
                    %>
                </ul>
            </div>
        </div>
    </div>
</header>
<script>
    function gotoMain() {
        location.href = "/";
    }
</script>
</body>
</html>
