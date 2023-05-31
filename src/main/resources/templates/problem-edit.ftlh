<!DOCTYPE html>
<html>
<head>
    <title>Edit Question</title>
    <style>
        .custom-textarea::placeholder {
            color: black;
        }

        .edit-button {
            background-color: #4CAF50;
            color: black;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            border-radius: 4px;
            margin-right: 10px;
        }

        .edit-button:hover {
            background-color: #45a049;
        }

        .button-link {
            display: inline-block;
            padding: 10px 20px;
            height: 18px;
            background-color: #4CAF50;
            color: black;
            text-decoration: none;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
        }

        .button-link:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<header>
    <#include "header.ftlh">
</header>
<#if user.username??>
    <h3>Edit Question</h3>
    <form method="POST">
        <textarea name="headline" class="custom-textarea" maxlength="150"
                  style="border-color: black">${problem.headline}</textarea>
        <textarea name="description" class="custom-textarea"
                  style="border-color: black; ">${problem.description}</textarea><br><br>
        Answer received?: <input type="checkbox" name="activity" id="activityCheckbox" value="0" aria-required="false">
        <input type="hidden" name="activity" id="activityInput" value="1">
        <button type="submit" onclick="updateActivity()" class="edit-button">Edit</button>
        <a href="/mainpage/problem/${problem.id}" class="button-link">Go Back</a>
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

        if (localStorage.getItem('activityChecked') === 'true') {
            activityCheckbox.checked = true;
        }

        activityCheckbox.addEventListener('change', () => {
            localStorage.setItem('activityChecked', activityCheckbox.checked);
        });
    </script>
</#if>
</body>
</html>