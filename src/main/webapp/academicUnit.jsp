<%--
  Created by IntelliJ IDEA.
  User: jeanj
  Date: 10/15/2023
  Time: 02:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.studentmid24229.model.AcademicUnit" %>
<%@ page import="com.example.studentmid24229.service.AcademicUnitServiceImpl" %>
<%@ page import="com.example.studentmid24229.service.AcademicUnitService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.example.studentmid24229.model.EAcademicUnit" %>
<jsp:useBean id="acadBean" class="com.example.studentmid24229.beans.AcademicUnitBean" scope="request" />
<%
    AcademicUnit academicUnit = new AcademicUnit();
    AcademicUnitService academic = new AcademicUnitServiceImpl();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            academicUnit.setCode(UUID.randomUUID());

            academicUnit.setCodeNumb(request.getParameter("codeNumb"));
            academicUnit.setName(request.getParameter("name"));

            String unitStr = request.getParameter("unit");
            EAcademicUnit unitEnum = EAcademicUnit.valueOf(unitStr);
            academicUnit.setUnit(unitEnum);

            // save to db
            academic.addAcademicUnit(academicUnit);

            request.setAttribute("Success", "Unit successfully created.");
        } catch (Exception ex) {
            ex.printStackTrace();  // Log the error
            request.setAttribute("error", ex);
            request.getRequestDispatcher("academicUnit.jsp").forward(request, response);
        }
    }
%>

<%@include file="leftNavBar.jsp"%>
<section class="dashboard">
    <%@include file="header.jsp"%>
    <style>
        .dashboard {
            padding: 20px;
            text-align: center;
        }

        .dashboard h1 {
            color: #0077b6;
            margin-bottom: 20px;
        }

        input[type="submit"] {
            background-color: #f3722c;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 5px;
            margin: 5px 0;
        }

        .dash-content {
            margin-top: 20px;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        table.table {
            width: 100%;
            border-collapse: collapse;
        }

        table.table th, table.table td {
            border: 1px solid #ccc;
            padding: 8px;
        }
    </style>
    <div class="dash-content">
        <h1>ACADEMIC UNITS</h1>
        <h2>--------------</h2>
        <form action="academicUnit.jsp" method="post">
            <label for="codeNumb">Code Number:</label>
            <input type="text" name="codeNumb" id="codeNumb" required><br>

            <label for="name">Name:</label>
            <input type="text" name="name" id="name" required><br>

            <label for="unit">Unit:</label>
            <select name="unit" id="unit">
                <option value="PROGRAM">PROGRAM</option>
                <option value="FACULTY">FACULTY</option>
                <option value="DEPARTMENT">DEPARTMENT</option>
            </select>

            <input type="submit" value="REGISTER">
        </form>
        <table class="table">
            <thead>
            <tr>
                <th scope="col" hidden="true">ID</th>
                <th scope="col">CODE NUMBER</th>
                <th scope="col">NAME</th>
                <th scope="col">UNIT</th>
            </tr>
            </thead>
            <tbody>

            <%
                AcademicUnitService academicUni = new AcademicUnitServiceImpl();
                List<AcademicUnit> academicUnits = academicUni.fetchAllAcademicUnits();
                for(AcademicUnit unit : academicUnits) {
            %>
            <tr>
                <td hidden="true"><%= unit.getCode() %></td>
                <td><%= unit.getCodeNumb() %></td>
                <td><%= unit.getName() %></td>
                <td><%= unit.getUnit() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</section>
<%@include file="footer.jsp"%>