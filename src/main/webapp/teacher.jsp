<%--
  Created by IntelliJ IDEA.
  User: jeanj
  Date: 10/15/2023
  Time: 02:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.studentmid24229.model.Teacher" %>
<%@ page import="com.example.studentmid24229.service.TeacherServiceImpl" %>
<%@ page import="com.example.studentmid24229.service.TeacherService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.example.studentmid24229.model.EQualification" %>
<jsp:useBean id="teachBean" class="com.example.studentmid24229.beans.TeacherBean" scope="request" />
<%
    Teacher teacher = new Teacher();
    TeacherService teacherServ = new TeacherServiceImpl();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            teacher.setIdTeach(UUID.randomUUID());

            teacher.setCodeTeach(request.getParameter("codeTeach"));
            teacher.setNamesTeach(request.getParameter("nameTeach"));

            String qualifStr = request.getParameter("qualification");
            EQualification teachEnum = EQualification.valueOf(qualifStr);
            teacher.setQualification(teachEnum);

            // save to db
            teacherServ.addTeacher(teacher);

            request.setAttribute("Success", "Teacher successfully created.");
        } catch (Exception ex) {
            ex.printStackTrace();  // Log the error
            request.setAttribute("error", ex);
            request.getRequestDispatcher("teacher.jsp").forward(request, response);
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
        <h1>TEACHERS</h1>
        <h2>--------</h2>
        <form action="teacher.jsp" method="post">
            <label for="codeTeach">Teacher Code:</label>
            <input type="text" name="codeTeach" id="codeTeach" required><br>

            <label for="nameTeach">Teacher Name:</label>
            <input type="text" name="nameTeach" id="nameTeach" required><br>

            <label for="qualification">Qualification:</label>
            <select name="qualification" id="qualification">
                <option value="MASTER">MASTER</option>
                <option value="PHD">PHD</option>
                <option value="PROFESSOR">PROFESSOR</option>
            </select>

            <input type="submit" value="REGISTER">
        </form>
        <table class="table">
            <thead>
            <tr>
                <th scope="col" hidden="true">ID</th>
                <th scope="col">TEACHER CODE </th>
                <th scope="col">TEACHER NAME</th>
                <th scope="col">QUALIFICATION</th>
            </tr>
            </thead>
            <tbody>
            <%
                TeacherService teacherService = new TeacherServiceImpl();
                List<Teacher> teachers = teacherService.fetchAllTeachers();
                for(Teacher teach : teachers) {
            %>
            <tr>
                <td hidden="true"><%= teach.getIdTeach() %></td>
                <td><%= teach.getCodeTeach() %></td>
                <td><%= teach.getNamesTeach() %></td>
                <td><%= teach.getQualification() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</section>
<%@include file="footer.jsp"%>