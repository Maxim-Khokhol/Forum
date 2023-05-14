<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Questions</title>
</head>
<body>
<header>
    <#include "header.ftlh">
</header>


<#if user.username??>
    <#if user.username == problem.user.getUsername()>
        <form action="/mainpage/problem/${problem.id}/delete" method="post">
            <input type="submit"  value="delete" />
        </form>

        <a href="/mainpage/problem/${problem.id}/edit">Edit</a>

    <#elseif user.username != problem.user.getUsername() >
        <h3>Create new answer</h3>
        <form action="/mainpage/answer/create" method="POST">
            Answer: <input type="text" name="answer" /><br><br>
            Question Id: <input type="hidden" name="idProblem" value="${problem.id}" /><br><br>
            <input type="submit" value="Add Answer" />
        </form>
    </#if>
    <#assign hasAnswer = false>
    <#list answers as answer>
        <#if answer.idProblem == problem.id && answer.answer?? && !hasAnswer
        && user.username == problem.user.getUsername()>
            <#assign hasAnswer = true>
            <h3>Start a dialogue</h3>
            <form action="/mainpage/answer/create" method="POST">
                Answer: <input type="text" name="answer" /><br><br>
                Question Id: <input type="hidden" name="idProblem" value="${problem.id}" /><br><br>
                <input type="submit" value="Add Answer" />
            </form>
        </#if>
    </#list>
    <a href="/mainpage/answer/${problem.id}">Go to answers ...</a>
</#if>

</body>
</html>