<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">Bulletin Board</a>
        </div>

        <ul class="nav navbar-nav">
            <li><a href="/about">About</a></li>
            <sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
                <li><a href="/adverts">Adverts</a></li>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
                <li><a href="/users">Users</a></li>
            </sec:authorize>
        </ul>

        <ul class="nav navbar-nav pull-right">
            <li>
                <sec:authorize access="isAuthenticated()">
                    <a href="/logout">Logout (<sec:authentication property="principal.username" />)</a>
                </sec:authorize>
                <sec:authorize access="!isAuthenticated()">
                    <a href="/login">Login</a>
                </sec:authorize>
            </li>
        </ul>
    </div>
</nav>