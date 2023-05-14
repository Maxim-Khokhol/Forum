<!DOCTYPE html>
<html>
<head>
    <title>Answers</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body>
<header>
    <#include "header.ftlh">
</header>
<h4>Answers</h4>

<#list answers as answer>
    <#if answer.user.getUsername() == problem.user.getUsername() >
    <div><hr>
        <p><b>${answer.getUser().getUsername()} <i class="ri-vip-crown-2-line"></i>: ${answer.answer}</b></p>
    </div>
    <#else>
        <div><hr>
            <p><b>${answer.getUser().getUsername()}: ${answer.answer}</b></p>
        </div>
    </#if>
</#list>
</body>
</html>