<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Questions Page</title>
</head>
<body>
<header>
    <#include "header.ftlh">
</header>
<h2>${userProfile.username} Questions:</h2>
<#list problems as problem>
    <#if problem.activity == 1 && userProfile.id == problem.user.id>
        <div>
            <p>${problem.headline}<a href="/mainpage/problem/${problem.id}"
                                     style="text-decoration: none; color: black">
                    <i class="ri-information-line"></i></a> <b style="color: #2ecc71">Status: Active</b></p>
        </div>
    <#elseif problem.activity == 0 && userProfile.id == problem.user.id>
        <div>
            <p>${problem.headline}<a href="/mainpage/problem/${problem.id}"
                                     style="text-decoration: none; color: black">
                    <i class="ri-information-line"></i></a> <b style="color: darkred">Status: Passive</b></p>
        </div>
    </#if>
</#list>
</body>
</html>
