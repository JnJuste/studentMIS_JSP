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
<%@ page import="com.example.studentmid24229.model.*" %>
<%@ page import="com.example.studentmid24229.service.*" %>
<jsp:useBean id="courBean" class="com.example.studentmid24229.beans.CourseBean" scope="request" />
<%
    Course course = new Course();
    CourseService courseService = new CourseServiceImpl();
    AcademicUnitService academicUnitService = new AcademicUnitServiceImpl();
    CourseDefinitionService courseDefinitionService = new CourseDefinitionServiceImpl();
    SemesterService semesterService = new SemesterServiceImpl();

    TeacherService teacherService = new TeacherServiceImpl();


    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            course.setCourse_id(UUID.randomUUID());

            String accUnitId = request.getParameter("acc_unit");
            if (accUnitId != null && !accUnitId.trim().isEmpty()) {
                AcademicUnit acc = academicUnitService.findById(UUID.fromString(accUnitId));
                course.setAccUnit(acc);
            }

            String courseDefId = request.getParameter("courseDefinition");
            if (courseDefId != null && !courseDefId.trim().isEmpty()) {
                CourseDefinition coursdefi = courseDefinitionService.findById(UUID.fromString(courseDefId));
                course.setCourseDefinition(coursdefi);
            }

            String tutorId = request.getParameter("tutor");
            if (tutorId != null && !tutorId.trim().isEmpty()) {
                Teacher tchr = teacherService.findById(UUID.fromString(tutorId));
                course.setTutor(tchr);
            }

            String assId = request.getParameter("assistant");
            if (assId != null && !assId.trim().isEmpty()) {
                Teacher ass = teacherService.findById(UUID.fromString(assId));
                course.setAssistant(ass);
            }
            String semId = request.getParameter("semester");
            if (assId != null && !semId.trim().isEmpty()) {
                Semester sem = semesterService.findById(UUID.fromString(semId));
                course.setSemester(sem);
            }

            // save to db
            courseService.addCourse(course);

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
        <h1>COURSE</h1>
        <h2>------</h2>
        <form action="course.jsp" method="post">
            <label class="form-label" for="acc_unit">Academic Unit:</label>
            <select class="form-control" id="acc_unit" name="acc_unit" required>
                <%
                    CourseService courseDropAccUnitInt = new CourseServiceImpl();
                    List<Object[]> courseDropAccUnits = courseDropAccUnitInt.getAcademicsUnit();
                    for(Object[] obj : courseDropAccUnits) {
                        String id = String.valueOf(obj[0]);
                        String name = String.valueOf(obj[1]);
                %>
                <option value="<%= id %>"><%= name %></option>
                <%
                    }
                %>
            </select>

            <label class="form-label" for="courseDefinition">Course Definition:</label>
            <select class="form-control" id="courseDefinition" name="courseDefinition" required>
                <%
                    CourseService courseDropIntCDef = new CourseServiceImpl();
                    List<Object[]> courseDropCDefs= courseDropIntCDef.getCourseDefinition();
                    for(Object[] obj : courseDropCDefs) {
                        String id = String.valueOf(obj[0]);
                        String name = String.valueOf(obj[1]);
                %>
                <option value="<%= id %>"><%= name %></option>
                <%
                    }
                %>
            </select>

            <label class="form-label" for="tutor">Course Tutor:</label>
            <select class="form-control" id="tutor" name="tutor" required>
                <%
                    CourseService courseDropIntTutor = new CourseServiceImpl();
                    List<Object[]> courseDropTutors= courseDropIntTutor.getTutorsAndAssistants();
                    for(Object[] obj : courseDropTutors) {
                        String id = String.valueOf(obj[0]);
                        String name = String.valueOf(obj[1]);
                %>
                <option value="<%= id %>"><%= name %></option>
                <%
                    }
                %>
            </select>

            <label class="form-label" for="assistant">Course Assistant:</label>
            <select class="form-control" id="assistant" name="assistant">
                <%
                    CourseService courseDropInt = new CourseServiceImpl();
                    List<Object[]> courseDrops= courseDropInt.getTutorsAndAssistants();
                    for(Object[] obj : courseDrops) {
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
                    CourseService courseDropIntSem = new CourseServiceImpl();
                    List<Object[]> courseDropsSem = courseDropIntSem.getAllSemesters();
                    for(Object[] obj : courseDropsSem) {
                        String id = String.valueOf(obj[0]);
                        String name = String.valueOf(obj[1]);
                %>
                <option value="<%= id %>"><%= name %></option>
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
                <th scope="col">ACADEMIC UNIT</th>
                <th scope="col">COURSE DEFINITION</th>
                <th scope="col">TUTOR</th>
                <th scope="col">ASSISTANT</th>
                <th scope="col">SEMESTER</th>
            </tr>
            </thead>
            <tbody>
            <%
                CourseService courseSer = new CourseServiceImpl();
                List<Course> courses = courseSer.fetchAllCourses();
                for(Course cour : courses) {
            %>
            <tr>
                <td hidden="true"><%= cour.getCourse_id() %></td>
                <td><%= cour.getAccUnit() %></td>
                <td><%= cour.getCourseDefinition() %></td>
                <td><%= cour.getTutor() %></td>
                <td><%= cour.getAssistant() %></td>
                <td><%= cour.getSemester() %></td>

            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</section>
<%@include file="footer.jsp"%>
