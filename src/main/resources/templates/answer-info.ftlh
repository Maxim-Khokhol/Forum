<!DOCTYPE html>
<html>
<head>
    <title>Answers</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <link href="/css/scroll.css" rel="stylesheet">
</head>
<style>
    .text-container {
        word-wrap: break-word;
        overflow-wrap: break-word;
        word-break: break-all;
        width: 100%;
        color: black;
        height: 450px;
        overflow: auto;
    }
    .button-link {
        display: inline-block;
        padding: 10px 20px;
        height: 18px;
        background-color: #4CAF50;
        color: black;
        text-decoration: none;
        border-radius: 4px;
        border: none;
        cursor: pointer;
        font-size: 16px;
        font-weight: 500;
    }

    .button-link:hover {
        background-color: #45a049;
    }
</style>
<body>
<header>
    <#include "header.ftlh">
</header>
<h4 style="font-size: 25px">Answers: </h4>
<div class="text-container">
    <#if answers?size == 0>
        <h2 style="color: darkred; margin-top: 10px;"><i>No one has answered yet. Please, visit this page later</i></h2>
    </#if>
    <#list answers as answer>
        <#if answer.user.getUsername() == problem.user.getUsername() >
            <div style="border-top: 1px solid lightslategray;">
                <p><i>${answer.dateOfCreationProblem}</i></p>
                <p><b>${answer.getUser().getUsername()} <i class="ri-vip-crown-2-line"></i>:</b> ${answer.answer}</p>
            </div>
        <#else>
            <div style="border-top: 1px solid lightslategray;">
                <p><i>${answer.dateOfCreationProblem}</i></p>
                <p><b>${answer.getUser().getUsername()}:</b> ${answer.answer}</p>
            </div>
        </#if>
    </#list>
</div>
<a href="/mainpage/problem/${problem.id}" class="button-link" style="position: fixed;
bottom: 10px; left: 3px; margin: 10px;">Go Back</a>
</body>
</html>
