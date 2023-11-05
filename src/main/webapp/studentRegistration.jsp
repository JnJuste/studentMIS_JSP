<%--
  Created by IntelliJ IDEA.
  User: jeanj
  Date: 10/15/2023
  Time: 02:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.example.studentmid24229.service.*" %>
<%@ page import="com.example.studentmid24229.model.*" %>
<jsp:useBean id="studRegBean" class="com.example.studentmid24229.beans.StudentRegistrationBean" scope="request" />
<%
    StudentRegistration studentRegistration = new StudentRegistration();
    StudentRegistrationService studentRegistrationService = new StudentRegistrationServiceImpl();
    SemesterService semesterService = new SemesterServiceImpl();
    StudentService studentService = new StudentServiceImpl();

    AcademicUnitService academicUnitService = new AcademicUnitServiceImpl();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            studentRegistration.setId(UUID.randomUUID());


            String studId = request.getParameter("stud");
            if (studId != null && !studId.trim().isEmpty()) {
                Student stud = studentService.findById(UUID.fromString(studId));
                studentRegistration.setStudent(stud);
            }

            String accUnitId = request.getParameter("acc_unit");
            if (accUnitId != null && !accUnitId.trim().isEmpty()) {
                AcademicUnit acc = academicUnitService.findById(UUID.fromString(accUnitId));
                studentRegistration.setAcademicUnit(acc);
            }

            String semId = request.getParameter("semester");
            if (semId != null && !semId.trim().isEmpty()) {
                Semester sem = semesterService.findById(UUID.fromString(semId));
                studentRegistration.setSemester(sem);
            }

            String unitStr = request.getParameter("status");
            ERegistrationStatus eRegistrationStatusEnum = ERegistrationStatus.valueOf(unitStr);
            studentRegistration.seteRegistrationStatus(eRegistrationStatusEnum);

            LocalDate regDate = LocalDate.parse(request.getParameter("regDate"));
            studentRegistration.setRegistrationDate(regDate);

            // save to db
            studentRegistrationService.addStudentReg(studentRegistration);

            request.setAttribute("Success", "Course successfully created.");
        } catch (Exception ex) {
            ex.printStackTrace();  // Log the error
            request.setAttribute("error", ex);
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
        <h1>Students Registration</h1>
        <h2>---------------------</h2>
        <form action="studentRegistration.jsp" method="post">

            <label class="form-label" for="stud">Student:</label>
            <select class="form-control" id="stud" name="stud" required>
                <%
                    StudentRegistrationService courseDropIntStud = new StudentRegistrationServiceImpl();
                    List<Object[]> courseDropIntStudStudents= courseDropIntStud.getStudents();
                    for(Object[] obj : courseDropIntStudStudents) {
                        String id = String.valueOf(obj[0]);
                        String name = String.valueOf(obj[1]);
                %>
                <option value="<%= id %>"><%= name %></option>
                <%
                    }
                %>
            </select>

        <label class="form-label" for="acc_unit">Academic Unit:</label>
        <select class="form-control" id="acc_unit" name="acc_unit" required>
            <%
                StudentRegistrationService studentDropAccUnitInt = new StudentRegistrationServiceImpl();
                List<Object[]> courseDropAccUnits = studentDropAccUnitInt.getAcademicUnits();
                for(Object[] obj : courseDropAccUnits) {
                    String id = String.valueOf(obj[0]);
                    String name = String.valueOf(obj[1]);
            %>
            <option value="<%= id %>"><%= name %></option>
            <%
                }
            %>
        </select>

        <label class="form-label" for="semester">Semester:</label>
        <select class="form-control" id="semester" name="semester">
            <%
                StudentRegistrationService stDropIntSem = new StudentRegistrationServiceImpl();
                List<Object[]> courseDropsSem = stDropIntSem.getSemesters();
                for(Object[] obj : courseDropsSem) {
                    String id = String.valueOf(obj[0]);
                    String name = String.valueOf(obj[1]);
            %>
            <option value="<%= id %>"><%= name %></option>
            <%
                }
            %>
        </select>
            <label for="status">Status:</label>
            <select name="status" id="status">
                <option value="PENDING">PENDING</option>
                <option value="REJECTED">REJECTED</option>
                <option value="ADMITTED">ADMITTED</option>
            </select>

            <div class="centered-input">
                <label for="regDate">Reg Date:</label>
                <input type="date" name="regDate" id="regDate" required><br>
            </div>

            <input type="submit" value="REGISTER">
        </form>
        <table class="table">
            <thead>
            <tr>
                <th scope="col" hidden="true">ID</th>
                <th scope="col">STUDENT</th>
                <th scope="col">ACADEMIC UNIT</th>
                <th scope="col">SEMESTER</th>
                <th scope="col">REG STATUS</th>
                <th scope="col">REG DATE</th>
            </tr>
            </thead>
            <tbody>
            <%
                StudentRegistrationService studentServ = new StudentRegistrationServiceImpl();
                List<StudentRegistration> studentRegistrations = studentServ.findAllStudentsReg();
                for(StudentRegistration stud : studentRegistrations) {
            %>
            <tr>
                <td hidden="true"><%= stud.getId() %></td>
                <td><%= stud.getStudent() %></td>
                <td><%= stud.getAcademicUnit() %></td>
                <td><%= stud.getSemester() %></td>
                <td><%= stud.geteRegistrationStatus() %></td>
                <td><%= stud.getRegistrationDate() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</section>
<%@include file="footer.jsp"%>