<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Settings</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <#if user.theme == 0>
        <link href="/css/panelDarkTheme.css" rel="stylesheet">
    <#elseif user.theme == 1>
        <link href="/css/panelLightTheme.css" rel="stylesheet">
    </#if>
</head>
<body>
<div id="window">
    <i onclick="show('none')" class="ri-close-line"></i>
    <form action="/mainpage/${user.id}/theme" method="post">
        <br>
        <label for="theme">Theme:</label>
        <select id="theme" name="theme">
            <#if user.theme == 1>
                <option value="1">Light</option>
                <option value="0">Dark</option>
            <#elseif user.theme == 0>
                <option value="0">Dark</option>
                <option value="1">Light</option>
            </#if>
        </select>
        <br>
        <button type="submit">Save</button>
    </form>

    <form action="/mainpage/${user.id}/animation" method="post">
        <br>
        <label for="animation">Animation:</label>
        <select id="animation" name="animation">
            <#if user.animation == 1>
                <option value="1">Off</option>
                <option value="0">On</option>
            <#elseif user.animation == 0>
                <option value="0">On</option>
                <option value="1">Off</option>
            </#if>
        </select>
        <br>
        <button type="submit">Save</button>
    </form>


</div>

<script>
    function show(state){
        document.getElementById('window').style.display = state
    }

</script>
</body>

</html>