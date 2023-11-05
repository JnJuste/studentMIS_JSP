<%--
  Created by IntelliJ IDEA.
  User: jeanj
  Date: 10/15/2023
  Time: 02:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.studentmid24229.model.CourseDefinition" %>
<%@ page import="com.example.studentmid24229.service.CourseDefinitionServiceImpl" %>
<%@ page import="com.example.studentmid24229.service.CourseDefinitionService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.UUID" %>
<jsp:useBean id="courseDefBean" class="com.example.studentmid24229.beans.CourseDefinitionBean" scope="request" />
<%
    CourseDefinition courseDefinition = new CourseDefinition();
    CourseDefinitionService courseDefinitionServ = new CourseDefinitionServiceImpl();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            courseDefinition.setCourse_def_Id(UUID.randomUUID());

            courseDefinition.setCourseCode(request.getParameter("codeCourseDef"));
            courseDefinition.setCourseName(request.getParameter("nameCourseDef"));

            courseDefinition.setDescription(request.getParameter("descrCourseDef"));

            // save to db
            courseDefinitionServ.addCourseDefinition(courseDefinition);

            request.setAttribute("Success", "Course Definition successfully created.");
        } catch (Exception ex) {
            ex.printStackTrace();  // Log the error
            request.setAttribute("error", ex);
            request.getRequestDispatcher("courseDefinition.jsp").forward(request, response);
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
        <h1>COURSE DEFINITION</h1>
        <h2>-----------------</h2>
        <form action="courseDefinition.jsp" method="post">
            <label for="codeCourseDef">Course Code:</label>
            <input type="text" name="codeCourseDef" id="codeCourseDef" required><br>

            <label for="nameCourseDef">Course Name:</label>
            <input type="text" name="nameCourseDef" id="nameCourseDef" required><br>

            <label for="descrCourseDef">Description:</label>
            <input type="text" name="descrCourseDef" id="descrCourseDef" required><br>

            <input type="submit" value="REGISTER">
        </form>
        <table class="table">
            <thead>
            <tr>
                <th scope="col" hidden="true">ID</th>
                <th scope="col">COURSE CODE </th>
                <th scope="col">COURSE NAME</th>
                <th scope="col">DESCRIPTION</th>
            </tr>
            </thead>
            <tbody>
            <%
                CourseDefinitionService courseDefinitionService = new CourseDefinitionServiceImpl();
                List<CourseDefinition> courseDefinitions = courseDefinitionService.fetchAllCourseDefinitions();
                for(CourseDefinition courseDef : courseDefinitions) {
            %>
            <tr>
                <td hidden="true"><%= courseDef.getCourse_def_Id() %></td>
                <td><%= courseDef.getCourseCode() %></td>
                <td><%= courseDef.getCourseName() %></td>
                <td><%= courseDef.getDescription() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</section>
<%@include file="footer.jsp"%>
