<%--
  Created by IntelliJ IDEA.
  User: rehnuma
  Date: 9/2/20
  Time: 6:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

            $('input:checkbox').click(function () {
                $('input:checkbox').not(this).prop('checked', false);
            });
        });
    </script>

    <script>

        function openModalDelete(id) {
            console.log(id);
            $('#modalCenterDelete').modal({
                show: true
            });
        }

    </script>
</head>
<body class="showPrescriptions-body">
<jsp:include page="navbar.jsp"/>
<div class="">
    <div class="showtable-headline">View Prescriptions</div>
         <div class=" container ">
            <form:form modelAttribute="monthRange" class="selectMonth-div" method="POST">
                <label>Enter Month:</label>
                <div class="input-append date"
                     style="margin-left: 0.5rem; padding-left: 0.5rem;">
                    <form:input path="month"
                                type="month"
                                min="1950-01"
                                max="2030-12"
                                class="form-control"
                                id="month"
                                value="2020-09"
                                placeholder="YYYY/MM"
                    />
                </div>
                <div style="margin-left: 1rem;">
                    <button type="submit"
                            class="btn btn-primary button-div">Submit</button>
                </div>
            </form:form>

    </div>
    <div class="table-container">
        <table class="table table-div" id="mytable">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Prescription ID</th>
                <th scope="col">Prescription Date</th>
                <th scope="col">Patient Name</th>
                <th scope="col">Age</th>
                <th scope="col">Gender</th>
                <th scope="col">Diagnosis</th>
                <th scope="col">Medicines</th>
                <th scope="col">Next Visit date</th>
                <th scope="col">Edit</th>
                <th scope="col">Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="prescription" items="${prescription}">
                <tr>
                    <th scope="row">${prescription.id}</th>
                    <th scope="row">${prescription.date}</th>
                    <td>${prescription.patient_name}</td>
                    <td>${prescription.age}</td>
                    <td>${prescription.gender}</td>
                    <td>${prescription.diagnosis}</td>
                    <td>${prescription.medicines}</td>
                    <td>${prescription.next_visit_date}</td>
                    <form action="update" method="POST">
                        <input type="hidden" name="id" value="${prescription.id}"/>
                        <td>
                            <button type="submit"
                                    class="btn btn-primary">
                                Edit
                            </button>
                        </td>
                    </form>

                    <td>
                        <button type="button"
                                class="btn btn-primary"
                                data-toggle="modal"
                                onclick="openModalDelete(${prescription.id})">
                            Delete
                        </button>
                    </td>
                </tr>
                <%--                    Modal starts --%>
                <div class="modal fade"
                     id="modalCenterDelete"
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
                                    <label> Are you sure you want to delete this?</label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button"
                                        class="btn btn-secondary"
                                        data-dismiss="modal"
                                        data-modal-cancel>Close
                                </button>
                                <form method="POST" action="/delete">
                                    <input type="hidden" name="pId" value="${prescription.id}"/>
                                    <button class="btn btn-primary" type="submit">Delete</button>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
                <%-------------------------Modal ends------------------------%>

            </c:forEach>

            </tbody>
        </table>
    </div>
</div>

</body>
</html>
