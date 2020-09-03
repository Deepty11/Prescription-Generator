<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: rehnuma
  Date: 9/1/20
  Time: 7:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script>
        $(document).ready(function () {
            var date_input = $('input[name="date"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            var options = {
                showTimePicker: false,
                dateFormat: "yyyy/mm/dd",
                container: container,
                todayHighlight: true,
                autoClose: true,
            };
            date_input.datepicker(options);
        })

    </script>
    <script>
        const monthControl = document.getElementById("month");
        const date = new Date();
        const month = date.getMonth() + 1;
        const year = date.getFullYear();
        monthControl.value = month + " " + year;
    </script>
    <script>

        function openModal(id) {
            console.log(id);
            $('#modalCenter').modal({
                show: true
            });
        }

    </script>

    <jsp:include page="header.jsp"/>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class=" container createPrescription-div"><h2>Create Prescription</h2></div>
<div class="section">
    <div class="container form-container">
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success"><c:out value="${successMessage}"></c:out></div>
        </c:if>
        <c:if test="${not empty failureMessage}">
            <div class="alert alert-danger"><c:out value="${failureMessage}"></c:out></div>
        </c:if>

        <form:form modelAttribute="prescription" method="POST">
            <form:input path="id"
                        type="hidden"
            />
            <div class="form-group">
                <label for="date">Prescription Date</label>
                <div class="input-group date"
                     data-provide="datepicker"
                     data-date-format="yyyy-mm-dd">
                    <form:input path="date"
                                type="text"
                                class="form-control"
                                id="date"
                                placeholder="YYYY/DD/MM"
                                name="date"/>
                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-th"></span>
                    </div>
                </div>


            </div>
            <div class="form-group">
                <label for="name">Patient Name</label>
                <form:input path="patient_name" type="text"
                            class="form-control"
                            id="name"
                            placeholder="Enter Name"/>

            </div>
            <div class="form-group">
                <label for="age">Age</label>
                <form:input path="age" type="text"
                            class="form-control"
                            id="age"
                            placeholder="Enter age"/>

            </div>
            <div class="form-group">
                <label>Gender :</label>
                <form:checkbox path="gender" value="Male"/> Male
                <form:checkbox path="gender" value="Female"/>Female

            </div>

            <div class="form-group">
                <label for="diagnosis">Diagnosis</label>
                <form:input path="diagnosis" type="textarea"
                            class="form-control"
                            id="diagnosis"
                            placeholder="Enter Diagnosis"/>
            </div>
            <div class="form-group">
                <label for="medicines">Medicines</label>
                <form:input path="medicines" type="textarea"
                            class="form-control"
                            id="medicines"
                            placeholder="Enter Medicines"/>
            </div>
            <div class="form-group">
                <label for="nextVisitDate">Next Visit Date</label>
                <div class="input-group date"
                     data-provide="datepicker"
                     data-date-format="yyyy-mm-dd">
                    <form:input path="next_visit_date"
                                type="text"
                                class="form-control"
                                id="nextVisitDate"
                                placeholder="YYYY/DD/MM"
                                name="date"/>

                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-th"></span>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form:form>
    </div>
</div>
</body>
</html>
