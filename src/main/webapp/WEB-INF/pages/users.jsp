<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Administrator panel</title>

    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://getbootstrap.com/dist/css/bootstrap-responsive.min.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <h1>Users</h1>
    <form:form method="post" action="add" commandName="user" role="form">
        <div class="form-group">
            <form:label path="firstName">First Name:</form:label>
            <form:input path="firstName" class="form-control" placeholder="First Name"/>
        </div>
        <div class="form-group">
            <form:label path="lastName">Last Name:</form:label>
            <form:input path="lastName" class="form-control" placeholder="Last Name"/>
        </div>
        <div class="form-group">
            <form:label path="email">Email:</form:label>
            <form:input path="email" class="form-control" placeholder="Email"/>
        </div>
        <div class="form-group">
            <form:label path="role">Role:</form:label>
            <form:select path="role" class="form-control">
                <c:forEach items="${roles}" var="role">
                    <form:option value="${role}">${role}</form:option>
                </c:forEach>
            </form:select>
        </div>
        <button type="submit" class="btn btn-default">Add User</button>
    </form:form>

    <c:if test="${!empty users}">
        <h3>Users</h3>
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>&nbsp;</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.getLastName()}, ${user.getFirstName()}</td>
                    <td>${user.getEmail()}</td>
                    <td>${user.getRole()}</td>
                    <td>
                        <form:form action="delete/${user.getId()}" method="post">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </form:form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
</body>
</html>
