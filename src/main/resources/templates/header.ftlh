<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <#if user.animation == 0>
        <link rel="stylesheet" href="/css/headerWithAnimationDarkMode.css">
    <#elseif user.animation == 1>
        <link rel="stylesheet" href="/css/headerWithoutAnimationDarkMode.css">
    </#if>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body>
<#include "settings.ftlh">
<header>
    <ul>
        <#if user.animation == 0>
        <li><span style="font-size: 25px; font-style: italic;" class="container text first-text">${user.getUsername()}</span></li>
        <li><span style="font-size: 25px; font-style: italic;" class="container text sec-text container">be a helper</span> </li>
        <#elseif user.animation == 1>
            <li><span style="font-size: 25px; font-style: italic; text-align: left" class="container" >
                    <b>Welcome, ${user.getUsername()}</b></span></li>
        </#if>
        <li><a href="/mainpage">Main Page</a></li>
        <li id="profile"><a href="/userpage/${user.id}"><i class="ri-user-3-line"></i>Profile</a></li>
        <li><a href="/about-us">About Us</a></li>
        <li><button onclick="show('block')" class="settingsButton"><i class="ri-settings-4-line"></i></button></li>
        <li id="logout"><a href="/logout"><i class="ri-logout-box-r-line"> Logout</i></a></li>
        <li style="flex-grow: 1"></li>
    </ul>
    <script>
        const text = document.querySelector(".sec-text");
        const textload = () => {
            setTimeout(() => {
                text.textContent = " be a helper"
            }, 0);
            setTimeout(() => {
                text.textContent = " be a know-it-all"
            }, 4000);
            setTimeout(() => {
                text.textContent = " be friendly and polite"
            }, 8000);
        }
        textload();
        setInterval(textload, 12000);
    </script>
</header>


</body>
</html>