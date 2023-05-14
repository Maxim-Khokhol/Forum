<#import "pager.ftlh" as p>
<!DOCTYPE html>
<html>
<head>
    <title>Questions</title>
</head>
<style>
    .box{
        background-color: #10559d;
        width: 330px;
        height: 20px;
        border-radius: 50px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px;
    }
    .search{
        width: 240px;
        border: none;
        outline: none;
        background: none;
        font-size: 13px;
    }
    .ri-search-line{
        color: darkblue;
        cursor: pointer;

    }
</style>
<body>

<header>
    <#include "header.ftlh">
</header>
<br>

<form action="/mainpage" method="get">
    <div class="box">
         <input class="search" type="text" name="headline"><br>
        <i typeof="submit" class="ri-search-line"></i>
    </div>
</form>
<br>
<#list problems as problem>
    <#if problem.activity == 1>
        <div>
            <p><b><b>${problem.user.username}:
                    </b>${problem.headline} </b><a href="/mainpage/problem/${problem.id}"
                                                    style="text-decoration: none; color: black">
                    <i class="ri-information-line"></i></a> <b style="color: #2ecc71">Status: Active</b></p>
        </div>
    <#elseif problem.activity == 0>
        <div>
            <p><b><b>${problem.user.username}:
                    </b>${problem.headline} </b>  <b style="color: #8B0000">Status: Passive</b></p>
        </div>
    </#if>
</#list>

<#if user.username??>
    <h3>Create new question</h3>
    <form action="/mainpage/problem/create" method="POST">
        <input type="text" name="headline" value="headline" /><br><br>
        <input type="text" name="description" value="description"/><br><br>
        <input type="hidden" name="activity" value="1"/>
        <input type="submit" value="Add Question" />
    </form>

</#if>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const icon = document.querySelector('.ri-search-line');
        icon.addEventListener('click', function() {
            const form = this.closest('form');
            form.submit();
        });
    });
</script>

</body>
</html>
