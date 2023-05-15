<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile page</title>
</head>
<style>
    table, th, td {
        border: 1px solid black;
    }
</style>
<body>
<#include "header.ftlh">
<h1>${user.username}</h1>
<br>
<table>
    <tr>
        <td>Email</td>
        <td>${user.email}</td>
    </tr>
    <tr>
        <td>Date Of Creation</td>
        <td>${user.dateOfCreation}</td>
    </tr>
</table>
<br>
<#if user.username??>
<#list problems as problem>
    <#if problem.activity == 0 && userProblem.id == problem.getUser().id>
        <div>
            <p><b>${problem.headline} </b>  <a href="/mainpage/problem/${problem.id}"
                                               style="text-decoration: none; color: black">
                    <i class="ri-information-line"></i></a> <b style="color: darkred">Status: Passive</b></p>
        </div>
    </#if>
</#list>
</#if>
</body>
</html>