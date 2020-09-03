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
    <jsp:include page="header.jsp"/>
</head>
<body class="records-body">
<jsp:include page="navbar.jsp"/>
<div class="container record-container ">
    <div class="table-headline">Daily Records</div>
    <div class="recordTable-container">
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Date</th>
                <th scope="col"># Of Prescriptions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="report" items="${reportList}">
                <tr>
                    <th scope="row">${report.date}</th>
                    <td>${report.count}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
