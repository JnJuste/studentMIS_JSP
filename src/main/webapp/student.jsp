<%--
  Created by IntelliJ IDEA.
  User: jeanj
  Date: 10/15/2023
  Time: 02:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.studentmid24229.model.Student" %>
<%@ page import="com.example.studentmid24229.service.StudentServiceImpl" %>
<%@ page import="com.example.studentmid24229.service.StudentService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.time.LocalDate" %>
<jsp:useBean id="teachBean" class="com.example.studentmid24229.beans.StudentBean" scope="request" />
<%
    Student student = new Student();
    StudentService studentServ = new StudentServiceImpl();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            student.setStudent_id(UUID.randomUUID());

            student.setRegNo(request.getParameter("codeStud"));
            student.setStudNames(request.getParameter("nameStud"));

            LocalDate dobDate = LocalDate.parse(request.getParameter("dobStud"));
            student.setDateOfBirth(dobDate);

            // save to db
            studentServ.addStudent(student);

            request.setAttribute("Success", "Student successfully created.");
        } catch (Exception ex) {
            ex.printStackTrace();  // Log the error
            request.setAttribute("error", ex);
            request.getRequestDispatcher("student.jsp").forward(request, response);
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
        <h1>STUDENTS</h1>
        <h2>--------</h2>
        <form action="student.jsp" method="post">
            <label for="codeStud">Student Code:</label>
            <input type="text" name="codeStud" id="codeStud" required><br>

            <label for="nameStud">Student Name:</label>
            <input type="text" name="nameStud" id="nameStud" required><br>

            <label for="dobStud">Student DOB:</label>
            <input type="date" name="dobStud" id="dobStud" required><br>

            <input type="submit" value="REGISTER">
        </form>
        <table class="table">
            <thead>
            <tr>
                <th scope="col" hidden="true">ID</th>
                <th scope="col">STUDENT CODE </th>
                <th scope="col">STUDENT NAME</th>
                <th scope="col">DATE OF BIRTH</th>
            </tr>
            </thead>
            <tbody>
            <%
                StudentService studentService = new StudentServiceImpl();
                List<Student> students = studentService.fetchAllStudents();
                for(Student stud : students) {
            %>
            <tr>
                <td hidden="true"><%= stud.getStudent_id() %></td>
                <td><%= stud.getRegNo() %></td>
                <td><%= stud.getStudNames() %></td>
                <td><%= stud.getDateOfBirth() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</section>
<%@include file="footer.jsp"%>