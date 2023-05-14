<!DOCTYPE html>
<html>
<head>
    <title>Edit Question</title>
</head>
<body>
<header>
    <#include "header.ftlh">
</header>
<#if user.username??>
    <h3>Edit Question</h3>
    <form method="POST">
        Headline: <input type="text" name="headline" value="${problem.headline}" /><br><br>
        Description: <input type="text" name="description" value="${problem.description}" /><br><br>
        Activity: <input type="checkbox" name="activity" id="activityCheckbox" value="0" aria-required="false">
        <input type="hidden" name="activity" id="activityInput" value="1">
        <input type="submit" value="Edit" onclick="updateActivity()">
    </form>

    <script>
        function updateActivity() {
            const checkbox = document.getElementById("activityCheckbox");
            const input = document.getElementById("activityInput");

            if (checkbox.checked) {
                input.value = 0;
            } else {
                input.value = 1;
            }
        }

        // Проверяем, сохранено ли состояние флажка в localStorage
        if (localStorage.getItem('activityChecked') === 'true') {
            activityCheckbox.checked = true;
        }

        // Добавляем обработчик события на флажок
        activityCheckbox.addEventListener('change', () => {
            // Сохраняем состояние флажка в localStorage
            localStorage.setItem('activityChecked', activityCheckbox.checked);
        });
    </script>
</#if>
</body>
</html>