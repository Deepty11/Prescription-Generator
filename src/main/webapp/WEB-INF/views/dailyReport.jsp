<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: rehnuma
  Date: 9/2/20
  Time: 9:35 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Date</th>
                <th>No of Prescriptions</th>
            </tr>

        </thead>
        <tbody>
        <c:forEach var="report" items="${reportList}">
            <tr>
                <td>${report.date}</td>
                <td>${report.count}</td>
            </tr>
        </c:forEach>
        </tbody>

    </table>



</body>
</html>
