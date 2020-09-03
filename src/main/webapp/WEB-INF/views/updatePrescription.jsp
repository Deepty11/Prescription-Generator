<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: rehnuma
  Date: 9/2/20
  Time: 11:51 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <script>
        $(document).ready(function () {
            var date_input = $('input[name="dtate"]'); //our date input has the name "date"
            var next_visit_date = $('input[name="next_visit_date"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            var options = {
                showTimePicker: false,
                dateFormat: "yyyy/mm/dd",
                container: container,
                todayHighlight: true,
                autoClose: true,
            };
            date_input.datepicker(options);
            next_visit_date.datepicker(options);

            const monthControl = document.getElementById("month");
            const date = new Date();
            const month = date.getMonth() + 1;
            const year = date.getFullYear();
            monthControl.value = month + " " + year;

            $('.check').click(function() {
                $('.check').not(this).prop('checked', false);
            });
        });
    </script>

</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="section">
    <div class="container">
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success"><c:out value="${successMessage}"></c:out></div>
        </c:if>
        <c:if test="${not empty failureMessage}">
            <div class="alert alert-danger"><c:out value="${failureMessage}"></c:out></div>
        </c:if>
        <div class=" container headline-div"><h2>Update Prescription</h2></div>
        <div class="updateForm-div">
            <form:form modelAttribute="prescriptionUpdate" method="POST" >
                <form:input path="id"
                            type="hidden"
                            value="${prescriptionUpdate.id}"/>
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
                                    name="date"
                                    value="${prescriptionUpdate.date}"/>
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
                                placeholder="Enter Name"
                                value="${prescriptionUpdate.patient_name}"/>

                </div>
                <div class="form-group">
                    <label for="age">Age</label>
                    <form:input path="age" type="text"
                                class="form-control"
                                id="age"
                                placeholder="Enter age"
                                value="${prescriptionUpdate.age}"/>

                </div>
                <div class="form-group">
                    <label>Gender :</label>
                    <form:checkboxes path="gender" items="${genderList}"/>
                        <%--                <form:checkbox path="gender" class="check" value="Male"/> Male--%>
                        <%--                <form:checkbox path="gender" class="check" value="Female"/>Female--%>

                </div>

                <div class="form-group">
                    <label for="diagnosis">Diagnosis</label>
                    <form:input path="diagnosis" type="textarea"
                                class="form-control"
                                id="diagnosis"
                                placeholder="Enter Diagnosis"
                                value="${prescriptionUpdate.diagnosis}"/>
                </div>
                <div class="form-group">
                    <label for="medicines">Medicines</label>
                    <form:input path="medicines" type="textarea"
                                class="form-control"
                                id="medicines"
                                placeholder="Enter Medicines"
                                value="${prescriptionUpdate.medicines}"/>
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
                                    name="date"
                                    value="${prescriptionUpdate.next_visit_date}"/>

                        <div class="input-group-addon">
                            <span class="glyphicon glyphicon-th"></span>
                        </div>
                    </div>
                </div>
                <button type="button"
                        class="btn btn-primary"
                        data-toggle="modal"
                        data-target="#editModal">
                    Save changes
                </button>
                <%--                    Modal starts --%>
                <div class="modal fade"
                     id="editModal"
                     tabindex="-1"
                     role="dialog"
                     aria-labelledby="modalCenterTitle"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalLongTitle">Attention</h5>
                                <button type="button"
                                        class="close"
                                        data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div>
                                    <label> Confirm changes</label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button"
                                        class="btn btn-secondary"
                                        data-dismiss="modal"
                                        data-modal-cancel>Close
                                </button>
                                <button class="btn btn-primary" type="submit">Confirm</button>


                            </div>
                        </div>
                    </div>
                </div>
                <%-------------------------Modal ends------------------------%>
            </form:form>
        </div>



    </div>
</div>

</body>
</html>
