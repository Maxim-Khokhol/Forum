<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/header.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body>
<#include "settings.ftlh">
<header>
    <ul>
        <li><span style="font-size: 25px; font-style: italic;" class="container text first-text">${user.getUsername()}</span></li>
        <li><span style="font-size: 25px; font-style: italic;" class="container text sec-text container">be a helper</span> </li>
        <li><a href="/mainpage">Main Page</a></li>
        <li id="profile"><a href="/userpage"><i class="ri-user-3-line"></i>Profile</a></li>
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