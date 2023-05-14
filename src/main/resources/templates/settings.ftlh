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
    <form action="/mainpage/settings" name="settings" method="POST" onsubmit="updateActivity()">
        <br><br>
        <i class="ri-sun-line"></i> Light Theme: <input type="checkbox" name="theme" id="themeCheckbox" value="1" aria-required="false"><br><br>
        No Animation: <input type="checkbox" name="animation" id="animationCheckbox" value="1" aria-required="false"><br><br>
        <input type="hidden" name="theme" id="themeActivityInput">
        <input type="hidden" name="animation" id="animationActivityInput">
        <input type="submit" value="Edit">
    </form>
</div>

<script>
    function show(state){
        document.getElementById('window').style.display = state
    }

    const themeCheckbox = document.getElementById("themeCheckbox");
    const animationCheckbox = document.getElementById("animationCheckbox");

    // Проверяем, сохранены ли состояния флажков в localStorage
    if (localStorage.getItem('themeChecked') === 'true') {
        themeCheckbox.checked = true;
    }
    if (localStorage.getItem('animationChecked') === 'true') {
        animationCheckbox.checked = true;
    }

    // Добавляем обработчики событий на флажки
    themeCheckbox.addEventListener('change', () => {
        // Сохраняем состояние флажка в localStorage
        localStorage.setItem('themeChecked', themeCheckbox.checked);
    });
    animationCheckbox.addEventListener('change', () => {
        // Сохраняем состояние флажка в localStorage
        localStorage.setItem('animationChecked', animationCheckbox.checked);
    });

    function updateActivity() {
        const themeInput = document.getElementById("themeActivityInput");
        const animationInput = document.getElementById("animationActivityInput");

        if (themeCheckbox.checked) {
            themeInput.value = 1;
        } else {
            themeInput.value = 0;
        }

        if (animationCheckbox.checked) {
            animationInput.value = 1;
        } else {
            animationInput.value = 0;
        }
    }
</script>
</body>

</html>