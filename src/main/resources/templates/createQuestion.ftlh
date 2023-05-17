<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CreateQuestion</title>
    <link href="/css/buttons.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <#if user.theme == 0>
        <link href="/css/panelDarkTheme.css" rel="stylesheet">
    <#elseif user.theme == 1>
        <link href="/css/panelLightTheme.css" rel="stylesheet">
    </#if>
</head>
<body>
<div id="window2">
    <i onclick="show2('none')" class="ri-close-line"></i>
    <form action="/mainpage/problem/create" method="POST">
        <textarea name="headline" placeholder="headline" class="custom-textarea"></textarea>
        <textarea name="description" placeholder="description" class="custom-textarea"></textarea><br><br>
        <input type="hidden" name="activity" value="1"/>
        <button type="submit" class="button" style="vertical-align:middle"><span>Create </span></button>
    </form>
</div>

<script>
    function show2(state){
        document.getElementById('window2').style.display = state;

    }
</script>
</body>
</html>

