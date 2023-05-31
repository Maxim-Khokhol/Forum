<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <link href="/css/scroll.css" rel="stylesheet">
    <#if user.theme == 0>
        <link href="/css/panelDarkTheme.css" rel="stylesheet">
    <#elseif user.theme == 1>
        <link href="/css/panelLightTheme.css" rel="stylesheet">
    </#if>
    <style>
        h1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        p {
            margin-bottom: 10px;
        }

    </style>
</head>
<body>
<header>
    <#include "header.ftlh">
</header>
<div>
    <h1>About Us</h1>
    <p>Welcome to our vibrant forum community, where like-minded individuals come together to share knowledge, engage in
        discussions, and connect with fellow enthusiasts. We provide a platform for users from diverse backgrounds to explore
        a wide range of topics.</p>
    <p>At our forum, we believe in the power of collaboration and the value of diverse perspectives. Whether you're seeking
        advice, looking to share your expertise, or simply interested in engaging conversations, our community is here to
        support and inspire you.</p>
    <p>Our dedicated team works tirelessly to ensure a safe and inclusive environment for all users. We encourage respectful
        and constructive interactions, fostering an atmosphere of mutual respect and learning. Our goal is to cultivate an
        engaging space where everyone feels welcome to participate and contribute.</p>
    <p>Join our forum today and become part of our growing community. Explore the various sections, ask questions, provide
        insights, and make meaningful connections. We look forward to your active participation and the knowledge you bring
        to our community.</p>
    <p>Remember, the strength of our forum lies in its members, and together, we can create a thriving hub of knowledge,
        discussions, and camaraderie. Let's embark on this exciting journey together!</p>
    <p>Thank you for choosing our forum.</p>
</div>
</body>
</html>