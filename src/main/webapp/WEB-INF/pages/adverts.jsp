<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Ads</title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="/assets/stylesheets/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<c:import url="navbar.jsp" />

<div class="container">
    <h1>Ads</h1>
    <form:form method="post" action="/adverts/add" commandName="advert" role="form">
        <div class="form-group">
            <form:label path="title">Title:</form:label>
            <form:input path="title" class="form-control" placeholder="Title"/>
        </div>
        <div class="form-group">
            <form:textarea path="text" class="form-control" rows="3" placeholder="Text"></form:textarea>
        </div>
        <div class="form-group">
            <form:input type="hidden" path="timeStamp"></form:input>
        </div>
        <button type="submit" class="btn btn-default">Add an ad</button>
    </form:form>

    <c:if test="${!empty adverts}">
        <h3>Ads</h3>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>Title</th>
                <th>Text</th>
                <th>Datetime</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${adverts}" var="ad">
                <tr>
                    <td>${ad.getTitle()}</td>
                    <td>${ad.getText()}</td>
                    <td>${ad.getTimeStamp()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
</body>
</html>
