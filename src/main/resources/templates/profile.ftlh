<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile page</title>
    <style>
        table, th, td {
            border: 1px solid black;
        }
        img {
            background-blend-mode: multiply;
        }
        input[type="submit"],
        input[type="file"],
        input[type="text"],
        <#if user.theme == 0>
        select {
            background-color: #AEA6A6;
            border: none;
            color: black;
        }
        .custom-file-upload {
            height: 20px;
            background-color: #AEA6A6;
            border: none;
            color: black;
            cursor: pointer;
            display: inline-block;
        }
        <#elseif user.theme == 1>
        select {
            background-color: white;
            border: 1px solid black;
            color: black;
        }
        .custom-file-upload {
            height: 20px;
            background-color: white;
            border: 1px solid black;
            color: black;
            cursor: pointer;
            display: inline-block;
        }
        </#if>
        #fileImage {
            display: none;
        }
    </style>
</head>
<body>
<#include "header.ftlh">
<div>
    <h1 style="margin: 70px auto 0;  text-align: center;">Username: ${userProfile.getUsername()}</h1><br>
    <#if userProfile.avatar?has_content>
        <div style="text-align: center;">
            <img src="${userProfile.getAvatarImagePath()}" alt="user-avatar" style="width: auto; height: 200px; display: inline-block;">
        </div><br>
    <#elseif !userProfile.avatar?has_content && userProfile.gender == "male" || userProfile.gender == "unknown">
        <div style="text-align: center;">
            <img src="/user-avatar/male.png" alt="user-avatar" style="width: auto; height: 200px; display: inline-block;">
        </div><br>
    <#elseif !userProfile.avatar?has_content && userProfile.gender == "female">
        <div style="text-align: center;">
            <img src="/user-avatar/female.png" alt="user-avatar" style="width: auto; height: 200px; display: inline-block;">
        </div><br>
    </#if>
    <#if userProfile.username == user.username>
        <div style="margin: 0 auto; text-align: center;">
            <form action="/userpage/${user.id}/edit" method="post" enctype="multipart/form-data" style="display: inline-block;">
                <label for="fileImage" class="custom-file-upload">Choose file</label>
                <input type="file" name="fileImage" id= "fileImage" accept="image/png, image/jpeg">
                <input type="submit" value="Add avatar" style="height: 19px">
            </form>
            <form action="/userpage/${userProfile.id}/deleteAvatar" method="post" style="display: inline-block;">
                <input type="hidden" name="avatar" value="">
                <input type="submit" value="Delete avatar" style="height: 19px">
            </form>
        </div>
        <form style="margin: 0 auto;  text-align: center;" action="/userpage/${user.id}/changeInfo" method="post">
            <input type="text" name="username" value="${user.username}">
            <select name="gender">
                <#if user.gender == "male" || user.gender == "unknown">
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                <#elseif user.gender = "female">
                    <option value="female">Female</option>
                    <option value="male">Male</option>
                </#if>
            </select>
            <input type="submit" value="Change Info">
        </form>
    </#if>
</div><br>
<table style="margin: 0 auto;  text-align: center;">
    <tr>
        <td>Email</td>
        <td>${userProfile.email}</td>
    </tr>
    <tr>
        <td>Date Of Creation</td>
        <td>${userProfile.dateOfCreation}</td>
    </tr>
    <tr>
        <td>Count of questions</td>
        <td><a href="/userpage/${userProfile.id}/user-questions">${userProfile.countOfQuestions}</a></td>
    </tr>
    <#if userProfile.gender?has_content && userProfile.gender != "unknown">
        <tr>
            <td>Gender</td>
            <td>${userProfile.gender}</td>
        </tr>
    </#if>
</table>
<br>

</body>
</html>