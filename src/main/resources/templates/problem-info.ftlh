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
        width: 1400px;
        height: 300px;
        overflow: auto;
    }
</style>
<body>
<header>
    <#include "header.ftlh">
</header>
<h2>${problem.headline}</h2>
<h3>Created By: ${problem.getUser().username} <br>
    Date Of Creation: ${problem.getDateOfCreationProblem()} <br>
    Panel <i onclick="show3('block')" class="ri-menu-line"></i></h3>


<div class="text-container">
<h4> Description: ${problem.description} <br><br>
</h4>
</div>
<div id="window3">
    <i onclick="show3('none')" class="ri-close-line"></i>

        <#if user.username == problem.user.getUsername()>
            <form action="/mainpage/problem/${problem.id}/delete" method="post" onsubmit="return confirmDelete(event)">
                <button onsubmit="return confirmDelete()" class="button2" style="vertical-align:middle" type="submit"><span> Delete Question </span></button>
            </form>

            <a href="/mainpage/problem/${problem.id}/edit">Edit</a>
        <#elseif user.username != problem.user.getUsername() >
            <h3>Create new answer</h3>
            <form action="/mainpage/answer/create" method="POST">
                Answer: <input type="text" name="answer" /><br><br>
                Question Id: <input type="hidden" name="idProblem" value="${problem.id}" /><br><br>
                <button class="button" style="vertical-align:middle" type="submit"><span>Add Answer </span></button>
            </form>
        </#if>
        <#assign hasAnswer = false>
        <#list answers as answer>
            <#if answer.idProblem == problem.id && answer.answer?? && !hasAnswer
            && user.username == problem.user.getUsername()>
                <#assign hasAnswer = true>
                <h3>Start a dialogue</h3>
                <form action="/mainpage/answer/create" method="POST">
                    <textarea name="answer" placeholder="answer" class="custom-textarea"></textarea><br><br>
                    <input type="hidden" name="idProblem" value="${problem.id}" />
                    <button class="button" style="vertical-align:middle" type="submit"><span>  Add Answer </span> </button>
                </form>
            </#if>
        </#list>
        <a href="/mainpage/answer/${problem.id}">Go to answers ...</a>
</div>

<script>
    function show3(state){
        document.getElementById('window3').style.display = state;

    }
    function confirmDelete(event) {
        const result = confirm("Are you sure you want to delete?");
        if (!result) {
            event.preventDefault();
        }
        return result;
    }
</script>
</body>
</html>