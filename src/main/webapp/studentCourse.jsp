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
<%@ page import="java.math.BigDecimal" %>
<jsp:useBean id="studCourseBean" class="com.example.studentmid24229.beans.StudentCourseBean" scope="request" />
<%
    StudentCourse studentCourse = new StudentCourse();

    StudentService studentService = new StudentServiceImpl();
    CourseService courseService = new CourseServiceImpl();
    StudentCourseService studentCourseService = new StudentCourseServiceImpl();
    StudentRegistrationService studentRegistrationService = new StudentRegistrationServiceImpl();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            studentCourse.setStud_CourseId(UUID.randomUUID());

            String studentId = request.getParameter("student");
            if (studentId != null && !studentId.trim().isEmpty()) {
                StudentRegistration stuRegServ = studentRegistrationService.findByIdStudReg(UUID.fromString(studentId));
                studentCourse.setStudentRegistration(stuRegServ);
            }

            String courseId = request.getParameter("course");
            if (courseId != null && !courseId.trim().isEmpty()) {
                Course courseServ = courseService.findById(UUID.fromString(courseId));
                studentCourse.setCourse(courseServ);
            }

            studentCourse.setResults(BigDecimal.valueOf(0));
            studentCourse.setCredits(6);

            // save to db
            studentCourseService.createStudentCourse(studentCourse);
            request.setAttribute("Success", "Student Course Student successfully added.");
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
        <h1>Student Course</h1>
        <h2>---------------</h2>
        <form action="studentCourse.jsp" method="post">

            <label class="form-label" for="student">Student:</label>
            <select class="form-control" id="student" name="student" required>
                <%
                    StudentCourseService studentCourseService1 = new StudentCourseServiceImpl();
                    List<Object[]> allRegStudents= studentCourseService1.getRegisteredStudents();
                    for(Object[] obj : allRegStudents) {
                        String id = String.valueOf(obj[0]);
                        String studRegNo = String.valueOf(obj[1]);
                        String studFullname = String.valueOf(obj[2]);
                %>
                <option value="<%= id %>"><%= studRegNo + " - " + studFullname %></option>
                <%
                    }
                %>
            </select>

            <label class="form-label" for="course">Course:</label>
            <select class="form-control" id="course" name="course">
                <%
                    StudentCourseService studentCourseService2 = new StudentCourseServiceImpl();
                    List<Object[]> allCourses= studentCourseService2.getAllCourses();
                    for(Object[] obj : allCourses) {
                        String id = String.valueOf(obj[0]);
                        String courseCode = String.valueOf(obj[1]);
                        String courseName = String.valueOf(obj[2]);
                %>
                <option value="<%= id %>"><%= courseCode + " - " + courseName %></option>
                <%
                    }
                %>
            </select>

            <input type="submit" value="REGISTER">
        </form>
        <table class="table">
            <thead>
            <tr>
                <th scope="col" hidden="true">ID</th>
                <th scope="col">COURSE NAME</th>
                <th scope="col">STUDENT NAME</th>
                <th scope="col">RESULTS</th>
                <th scope="col">CREDITS</th>
            </tr>
            </thead>
            <tbody>
            <%
                StudentCourseService studentServ = new StudentCourseServiceImpl();
                List<Object[]> studentRegistrations = studentServ.fetchAllStudents();
                for(Object[] stud : studentRegistrations) {
            %>
            <tr>
                <td hidden="true"><%= stud[0] %></td>
                <td><%= stud[1] %></td>
                <td><%= stud[2] %></td>
                <td><%= stud[3] %></td>
                <td><%= stud[4] %></td>
                <td><%= stud[5] %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</section>
<%@include file="footer.jsp"%>