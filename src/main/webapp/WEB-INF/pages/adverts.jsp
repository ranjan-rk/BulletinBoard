<!doctype html>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
        <div class="form-group">
            <form:input type="hidden" path="userName" value="${pageContext.request.userPrincipal.name}"></form:input>
        </div>
        <button type="submit" class="btn btn-default">Add</button>
    </form:form>

    <c:if test="${!empty adverts}">
        <h3>Ads</h3>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>Title</th>
                <th>Text</th>
                <th>User</th>
                <th>Datetime</th>
                <th>&nbsp;</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${adverts}" var="ad">
                <%-- if user has ROLE_USER permission - show only his own ads --%>
                <sec:authorize access="!hasRole('ROLE_ADMIN')">
                    <c:if test="${pageContext.request.userPrincipal.name == ad.getUserName()}">
                        <tr>
                            <td>${ad.getTitle()}</td>
                            <td>${ad.getText()}</td>
                            <td>${ad.getUserName()}</td>
                            <td>${ad.getTimeStamp()}</td>
                            <td>
                                <form:form action="/adverts/delete/${ad.getId()}" method="post">
                                    <input type="submit" class="btn btn-danger" value="Delete">
                                </form:form>
                            </td>
                        </tr>
                    </c:if>
                </sec:authorize>
                <%-- show all ads to admin --%>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <tr>
                        <td>${ad.getTitle()}</td>
                        <td>${ad.getText()}</td>
                        <td>${ad.getUserName()}</td>
                        <td>${ad.getTimeStamp()}</td>
                        <td>
                            <form:form action="/adverts/delete/${ad.getId()}" method="post">
                                <input type="submit" class="btn btn-danger" value="Delete">
                            </form:form>
                        </td>
                    </tr>
                </sec:authorize>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
</body>
</html>
