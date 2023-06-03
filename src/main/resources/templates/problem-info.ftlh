<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Questions</title>
    <link href="/css/buttons.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <link href="/css/scroll.css" rel="stylesheet">
    <#if user.theme == 0>
        <link href="/css/panelDarkTheme.css" rel="stylesheet">
    <#elseif user.theme == 1>
        <link href="/css/panelLightTheme.css" rel="stylesheet">
    </#if>
</head>
<style>
    .text-container {
        word-wrap: break-word;
        overflow-wrap: break-word;
        word-break: break-all;
        width: 100%;
        color: black;
        height: 400px;
        overflow-y: auto;
        display: flex;
    }
    .button-link {
        display: inline-block;
        padding: 10px 20px;
        font-weight: normal;
        background-color: #4CAF50;
        color: black;
        text-decoration: none;
        border-radius: 4px;
    }
    .button-link:hover {
        background-color: #45a049;
    }

</style>
<body>
<header>
    <#include "header.ftlh">
</header>
<h2>${problem.headline}</h2>
<h3>Created By: ${problem.getUser().username} <br>
    Date Of Creation: ${problem.getDateOfCreationProblem()} <br>
    <#if problem.activity == 1 || user.username == problem.user.getUsername()>
    Panel <i onclick="show3('block')" class="ri-menu-line"></i></h3>
    </#if>

<div class="text-container">
    <h4><i style="font-size: 20px">Description: ${problem.description} </i><br><br>
</h4>
</div>
<#if problem.activity == 0 && user.username != problem.user.getUsername()>
    <a href="/mainpage/answer/${problem.id}" class="button-link" style="position: fixed;
bottom: 10px; left: 3px; margin: 10px;">Go to answers ...</a>
</#if>
<div id="window3">
    <i onclick="show3('none')" class="ri-close-line"></i>

    <#if user.username == problem.user.getUsername()>
        <form action="/mainpage/problem/${problem.id}/delete" method="post" id="myForm">
            <button class="button2" style="vertical-align:middle" type="submit"><span>Delete Question</span></button>
        </form>

        <a href="/mainpage/problem/${problem.id}/edit" class="button-link">Edit</a>
        <a href="/mainpage/answer/${problem.id}" class="button-link">Go to answers ...</a>
    <#elseif user.username != problem.user.getUsername()>
        <#if problem.activity == 1>
            <h3 style="font-size: 25px">Create new answer</h3>
            <form action="/mainpage/answer/create" method="POST">
                <label>
                    <textarea name="answer" placeholder="answer" class="custom-textarea"></textarea>
                </label><br>
                <input type="hidden" name="idProblem" value="${problem.id}" /><br><br>
                <button class="button" style="vertical-align:middle" type="submit"><span>Add Answer</span></button>
            </form>
            <a href="/mainpage/answer/${problem.id}" class="button-link">Go to answers ...</a>
        </#if>
    </#if>
    <#assign hasAnswer = false>
    <#list answers as answer>
        <#if answer.idProblem == problem.id && answer.answer?? && !hasAnswer && user.username == problem.user.getUsername()>
            <#assign hasAnswer = true>
            <h3>Start a dialogue</h3>
            <form action="/mainpage/answer/create" method="POST">
                <label>
                    <textarea name="answer" placeholder="answer" class="custom-textarea"></textarea>
                </label>
                <input type="hidden" name="idProblem" value="${problem.id}" />
                <button class="button" style="vertical-align:middle" type="submit"><span>Add Answer</span></button>
            </form>
        </#if>
    </#list>

</div>

<script>
    function show3(state){
        document.getElementById('window3').style.display = state;
    }

    const form = document.getElementById('myForm');

    form.addEventListener('submit', function(event) {
        // Запобігаємо відправленню форми
        event.preventDefault();

        // Додатковий код для обробки відправлення форми
        if (confirm('Are you sure you want to delete the question?')) {
            // Если подтверждено удаление, отправляем форму
            form.submit();
        }
    });
</script>
</body>
</html>
