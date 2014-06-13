<!doctype html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Bulletin Board</title>
    <link href="/assets/stylesheets/bootstrap.min.css" rel="stylesheet">
    <script src="/assets/javascript/jquery-1.11.0.min.js"></script>
</head>
<body>

<c:import url="navbar.jsp" />

<div class="container">
    <h1>Adverts</h1>
    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>Title</th>
            <th>Text</th>
            <th>Datetime</th>
        </tr>
        </thead>
        <tbody class="adverts-list">
            <%-- мы подставим сюда данные с помощью js--%>
        </tbody>
    </table>
</div>

<script>
    $(document).ready(function(){
        reloadAdverts();
        window.setInterval(reloadAdverts, 5000);
    });

    /**
     * Загружаем список всех объявлений
     */
    var reloadAdverts = function() {
        $.getJSON("/api/adverts", function(data) {
            var adverts = [];
            $.each(data, function(key, val) {
                var row = $("<tr></tr>");
                row.append($("<td></td>").text(val.title));
                row.append($("<td></td>").text(val.text));
                row.append($("<td></td>").text(val.timeStamp));
                adverts.push(row);
            });

            $(".adverts-list").html(adverts);
        });
    };
</script>
</body>
</html>
