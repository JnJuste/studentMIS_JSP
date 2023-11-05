<%--
  Created by IntelliJ IDEA.
  User: jeanj
  Date: 10/15/2023
  Time: 02:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.studentmid24229.model.Semester" %>
<%@ page import="com.example.studentmid24229.service.SemesterServiceImpl" %>
<%@ page import="com.example.studentmid24229.service.SemesterService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.time.LocalDate" %>
<jsp:useBean id="semBean" class="com.example.studentmid24229.beans.SemesterBean" scope="request" />
<%
    Semester semester = new Semester();
    SemesterService semesterSer = new SemesterServiceImpl();


    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            semester.setID(UUID.randomUUID());

            semester.setSemCode(request.getParameter("codeSem"));
            semester.setNames(request.getParameter("namSem"));
            LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
            semester.setStartDate(startDate);
            LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));
            semester.setEndDate(endDate);

            // save to db
            semesterSer.addSemester(semester);

            request.setAttribute("Success", "Semester successfully created.");
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("error", ex);
            request.getRequestDispatcher("semester.jsp").forward(request, response);
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

        .centered-input {
            text-align: center;
            display: inline-block;
            margin: 0 10px;
        }

        .centered-input label,
        .centered-input input[type="date"] {
            display: block;
            margin: 0 auto;
            width: 100%;
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
        <h1>SEMESTERS</h1>
        <h2>---------</h2>
        <form action="semester.jsp" method="post">
            <div class="centered-input">
                <label for="codeSem">Semester Code:</label>
                <input type="text" name="codeSem" id="codeSem" required><br>
            </div>

            <div class="centered-input">
                <label for="nameSem">Semester Name:</label>
                <input type="text" name="namSem" id="nameSem" required><br>
            </div>

            <div class="centered-input">
                <label for="startDate">Start Date:</label>
                <input type="date" name="startDate" id="startDate" required><br>
            </div>

            <div class="centered-input">
                <label for="endDate">End Date:</label>
                <input type="date" name="endDate" id="endDate" required><br>
            </div>
            <input type="submit" value="REGISTER">
        </form>
        <table class="table">
            <thead>
            <tr>
                <th scope="col" hidden="true">ID</th>
                <th scope="col">SEMESTER CODE</th>
                <th scope="col">SEMESTER NAME</th>
                <th scope="col">START DATE</th>
                <th scope="col">END DATE</th>
            </tr>
            </thead>
            <tbody>
            <%
                SemesterService semesterService = new SemesterServiceImpl();
                List<Semester> semesters = semesterService.fetchAllSemesters();
                for(Semester sem : semesters) {
            %>
            <tr>
                <td hidden="true"><%= sem.getID() %></td>
                <td><%= sem.getSemCode() %></td>
                <td><%= sem.getNames() %></td>
                <td><%= sem.getStartDate() %></td>
                <td><%= sem.getEndDate() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</section>
<%@include file="footer.jsp"%>
