<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="header.jsp"/>
</head>
<body>
<div class="section">
    <div class="container login">
        <form:form modelAttribute="user" method="POST" action="/login">
            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    <c:out value="${error}"></c:out>
                </div>
            </c:if>
            <div class="form-group">
                <label for="email">Email address</label>
                <form:input path="email"
                            type="email"
                            class="form-control"
                            aria-describedby="emailHelp"
                            id="email"
                            placeholder="Enter email"/>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <form:input path="password"
                            type="password"
                            class="form-control"
                            id="exampleInputPassword1"
                            placeholder="Password"/>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form:form>
    </div>
</div>
</body>
</html>