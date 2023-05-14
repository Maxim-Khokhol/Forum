<#macro pager url page>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    </head>
    <style>
    a {
        display: inline;
        font-size: 20px;
        color: black;
        text-decoration: none;
        padding: 0 20px;
    }
    </style>
    <body>
    <div>
        <#list 1..page.getTotalPages() as p>
            <#if (p - 1) == page.getNumber()>
                <a href="#" tabindex="-1">${p}</a>
            <#else>
                <a href="${url}?page=${p - 1}&size=${5}" tabindex="-1">${p}</a>
            </#if>
            </#list>
            <div class="bar"></div>
        </div>
    </body>
    </html>
</#macro>
