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

    <link href="/assets/stylesheets/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="container" style="margin-top:30px">
    <div class="col-md-4 col-md-offset-4">
        <div class="panel panel-default">
            <div class="panel-heading"><h3 class="panel-title"><strong>Sign in </strong></h3></div>
            <div class="panel-body">
                <form role="form" method="post" action="<c:url value="/j_spring_security_check" />">
                    <div class="form-group">
                        <label>
                            Username
                            <input class="form-control" name="j_username" type="text" placeholder="Enter username">
                        </label>
                    </div>
                    <div class="form-group">
                        <label>
                            Password
                            <input class="form-control" name="j_password" type="password" placeholder="Password">
                        </label>
                    </div>
                    <button type="submit" class="btn btn-sm btn-default">Sign in</button>
                </form>
            </div>
            <c:if test="${not empty param.error}">
                <div class="panel-footer alert-danger">
                    Error: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
                </div>
            </c:if>
        </div>
    </div>
</div>

</body>
</html>