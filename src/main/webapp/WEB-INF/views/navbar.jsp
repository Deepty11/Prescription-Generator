<%--
  Created by IntelliJ IDEA.
  User: rehnuma
  Date: 9/3/20
  Time: 10:15 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark nav-div">
    <div class="brand-div">
        <a class="navbar-brand" href="#">PrescriptionGenerator</a>
        <button class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
    <div class="nav-item" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/home">Create Prescription</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/showPrescription">View Prescriptions</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/dailyCountReport">View Daily Reports</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/logout">Logout</a>
            </li>
        </ul>
    </div>
</nav>
