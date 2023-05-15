<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Settings</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
</head>
<style>
    #window{
        text-align: center;
        width: 150px;
        height: 150px;
        margin: 10px auto;
        background: grey;
        border: 1px solid #10559d;
        border-radius: 15px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        display: none;

    }
    #window .ri-close-line {
        cursor: pointer;
        font-size: 25px;
        position: absolute;
        top: 0;
        left: 0;
    }
</style>
<body>
<div id="window">
    <i onclick="show('none')" class="ri-close-line"></i>
    <form action="/mainpage/${user.id}/theme" method="post">
        <label for="theme">Theme:</label>
        <select id="theme" name="theme">
            <option value="1">Light</option>
            <option value="0">Dark</option>
        </select>
        <button type="submit">Save</button>
    </form>

    <form action="/mainpage/${user.id}/animation" method="post">
        <label for="animation">Animation:</label>
        <select id="animation" name="animation">
            <option value="1">Off</option>
            <option value="0">On</option>
        </select>
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