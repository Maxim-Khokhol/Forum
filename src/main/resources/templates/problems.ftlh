<!DOCTYPE html>
<html lang="en">
<head>
    <title>Questions</title>
    <#if user.theme == 0>
        <link href="/css/searchDarkTheme.css" rel="stylesheet">
    <#elseif user.theme == 1>
        <link href="/css/searchLightTheme.css" rel="stylesheet">
    </#if>
</head>
<style>
    a {
        text-decoration: none;
        color: black;
    }
    .text-container {
        word-wrap: break-word;
        overflow-wrap: break-word;
        word-break: break-all;
        width: 100%;
        color: black;
        height: 450px;
        overflow-y: auto;
        display: flex;
    }
</style>
<body>

<header>
    <#assign username = user.username>
    <#include "header.ftlh">

</header>
<#include "createQuestion.ftlh">
<br>

<form action="/mainpage" method="get">
    <div class="box">
        <input class="search" type="text" name="headline"><br>
        <i typeof="submit" class="ri-search-line"></i>
    </div>
</form>
<br>
<h2><b>Questions</b> <i onclick="show2('block')" class="ri-add-line"></i></h2>
<#list problems as problem>
    <#if problem.activity == 1>
        <div>
            <p><b><b><a href="/userpage/${problem.user.id}">${problem.user.username}: </a>
                    </b>${problem.headline} </b><a href="/mainpage/problem/${problem.id}"
                                                   style="text-decoration: none; color: black">
                    <i class="ri-information-line"></i></a> <b style="color: #2ecc71">Status: Active</b></p>
        </div>
        <#elseif problem.activity == 0>
            <div>
                <p><b><b><a href="/userpage/${problem.user.id}">${problem.user.username}: </a>
                        </b>${problem.headline} </b><a href="/mainpage/problem/${problem.id}"
                                                       style="text-decoration: none; color: black">
                        <i class="ri-information-line"></i></a> <b style="color: darkred">Status: Passive</b></p>
            </div>
    </#if>
</#list>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const icon = document.querySelector('.ri-search-line');
        icon.addEventListener('click', function() {
            const form = this.closest('form');
            form.submit();
        });
    });
</script>

</body>
</html>
