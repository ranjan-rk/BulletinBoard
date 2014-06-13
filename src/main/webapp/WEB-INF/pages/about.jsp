<!doctype html>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="utf-8">
    <title>About</title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="/assets/stylesheets/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<c:import url="navbar.jsp" />

<div class="container">
    <h1>About Bulletin Board</h1>
    <p>
        Проект "Доска объявлений" для Exigen. Выполнили Светлана Есина, Мария Шахова и мальчики.
    </p>
    <p>
        В начале в системе есть один администратор.
        Он может добавлять и удалять пользователей в систему, а так же управлять объявлениями.
        <br>
        Пользователь может добавлять объявления и удалять только свои.
    </p>
</div>

</body>
</html>