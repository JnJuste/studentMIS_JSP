<%--
  Created by IntelliJ IDEA.
  User: jeanj
  Date: 10/24/2023
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.studentmid24229.model.Semester" %>
<%@ page import="com.example.studentmid24229.service.*" %>
<%@ page import="java.util.UUID" %>
<%
    ListingService listingService = new ListingServiceImpl();
    List<Object[]> listDepartments = null;
    List<Object[]> listCourses = null;
    List<Object[]> listSemesters = null;
    List<Object[]> listStudents = null;
    List<Object[]> listDepartmentCourses = null;
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            if (!request.getParameter("listDepartment").toString().equals("NONE")) {
                String listDepartment = request.getParameter("listDepartment");
                if (listDepartment != null && !listDepartment.trim().isEmpty()) {
                    listDepartments = listingService.listStudentsByDepartment(UUID.fromString(listDepartment));
                }
            } else if (!request.getParameter("listCourse").toString().equals("NONE")) {
                String listCourse = request.getParameter("listCourse");
                if (listCourse != null && !listCourse.trim().isEmpty()) {
                    listCourses = listingService.listStudentsByCourse(UUID.fromString(listCourse));
                }
            } else if (!request.getParameter("listSemester").toString().equals("NONE")) {
                String listSemester = request.getParameter("listSemester");
                if (listSemester != null && !listSemester.trim().isEmpty()) {
                    listSemesters = listingService.listStudentsBySemester(UUID.fromString(listSemester));
                }
            } else if (!request.getParameter("listStudent").toString().equals("NONE")) {
                String listStudent = request.getParameter("listStudent");
                if (listStudent != null && !listStudent.trim().isEmpty()) {
                    listStudents = listingService.listCoursesByStudent(UUID.fromString(listStudent));
                }
            } else if (!request.getParameter("listDepartmentCourse").toString().equals("NONE")) {
                String listDepartmentCourse = request.getParameter("listDepartmentCourse");
                if (listDepartmentCourse != null && !listDepartmentCourse.trim().isEmpty()) {
                    listDepartmentCourses = listingService.listCoursesByDepartment(UUID.fromString(listDepartmentCourse));
                }
            }
            else {
                request.setAttribute("error", "Please select type of listing first");
            }
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

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        select, .btn {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            background-color: #f3722c;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #005b91;
        }

        .centered-input {
            text-align: center;
            display: inline-block;
            margin: 0 10px;
        }

        .centered-content {
            text-align: center;
        }

        .centered-input label,
        .centered-input input[type="date"] {
            text-align: center;
            display: block;
            margin: 0 auto;
            width: 100%;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .table th, .table td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        .table th {
            background-color: #0077b6;
            color: #fff;
        }

        .table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .table tr:hover {
            background-color: #d4edda;
        }
    </style>

    <div class="dash-content" style="text-align: center;" >
        <h1>AUCA FINAL LISTING PAGE</h1>
        <p>Choose below the list you want to view:</p>
            <form method="post" action="listingFinal.jsp">
                <div class="row mb-3">
                    <div class="mb-3 col-xl">
                        <label class="form-label" for="listType">LIST BY:</label>
                        <select class="form-control" id="listType" name="listType">
                            <option value="NONE">SELECT</option>
                            <option value="SEMESTER">LIST OF STUDENTS PER SEMESTER</option>
                            <option value="DEPARTMENT">LIST OF STUDENTS PER DEPARTMENT</option>
                            <option value="COURSE">LIST OF STUDENTS PER COURSE</option>
                            <option value="COURSE_DEPARTMENT">LIST OF COURSES PER DEPARTMENT</option>
                            <option value="COURSE_STUDENT">LIST OF COURSES PER STUDENT</option>
                        </select>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="mb-3 col-xl" id="semesterForm" style="display: none">
                        <label class="form-label" for="listSemester">Semester</label>
                        <select class="form-control" id="listSemester" name="listSemester">
                            <option value="NONE">SELECT</option>
                            <%
                                SemesterService sem = new SemesterServiceImpl();
                                List<Semester> semesters = sem.fetchAllSemesters();
                                for(Semester semes : semesters) {
                                    String id = semes.getID().toString();
                                    String name = semes.getNames();
                            %>
                            <option value="<%= id %>"><%= name %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="mb-3 col-xl" id="departmentForm" style="display: none">
                        <label class="form-label" for="listDepartment">Department</label>
                        <select class="form-control" id="listDepartment" name="listDepartment">
                            <option value="NONE">SELECT</option>
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
                    </div>

                    <div class="mb-3 col-xl" id="courseForm" style="display: none">
                        <label class="form-label" for="listCourse">Course</label>
                        <select class="form-control" id="listCourse" name="listCourse">
                            <option value="NONE">SELECT</option>
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
                    </div>

                    <div class="mb-3 col-xl" id="departmentCourseForm" style="display: none">
                        <label class="form-label" for="listDepartmentCourse">Department</label>
                        <select class="form-control" id="listDepartmentCourse" name="listDepartmentCourse">
                            <option value="NONE">SELECT</option>
                            <%
                                CourseService courseService1 = new CourseServiceImpl();
                                List<Object[]> accads = courseService1.getAcademicsUnit();
                                for(Object[] obj : accads) {
                                    String id = String.valueOf(obj[0]);
                                    String name = String.valueOf(obj[1]);
                            %>
                            <option value="<%= id %>"><%= name %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="mb-3 col-xl" id="studentForm" style="display: none">
                        <label class="form-label" for="listStudent">Student</label>
                        <select class="form-control" id="listStudent" name="listStudent">
                            <option value="NONE">SELECT</option>
                            <%
                                StudentCourseService studentCourseService = new StudentCourseServiceImpl();
                                List<Object[]> studCourseServs = studentCourseService.getRegisteredStudents();
                                for(Object[] obj : studCourseServs) {
                                    String id = String.valueOf(obj[0]);
                                    String name = String.valueOf(obj[2]);
                            %>
                            <option value="<%= id %>"><%= name %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>

                <div class="mb-2">
                    <button class="btn btn-primary" type="submit" id="listBtn">List</button>
                    <span class="form-label text-danger" id="error-msg">${error}</span>
                </div>
            </form>

            <div class="card mt-4">
                <div class="card-body">
                    <span class="form-label text-success" id="success-msg">${success}</span>
                    <div class="table-responsive">
                        <%--         by student per semester               --%>
                        <%
                            if (listSemesters != null) {
                        %>
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col" hidden="true">ID</th>
                                <th scope="col">Student Reg. No</th>
                                <th scope="col">Student Name</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if (listSemesters != null) {
                                    for(Object[] listSem : listSemesters) {
                            %>
                            <tr>
                                <td hidden="true"><%= listSem[0] %></td>
                                <td><%= listSem[1] %></td>
                                <td><%= listSem[2] %></td>
                            </tr>
                            <%
                                    }}
                            %>
                            </tbody>
                        </table>
                        <%
                            }
                        %>
                        <%--         by courses per student               --%>
                        <%
                            if (listStudents != null) {
                        %>
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col" hidden="true">ID</th>
                                <th scope="col">Student Reg. No</th>
                                <th scope="col">Student Name</th>
                                <th scope="col">Course Code</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if (listStudents != null) {
                                    for(Object[] listStud : listStudents) {
                            %>
                            <tr>
                                <td hidden="true"><%= listStud[0] %></td>
                                <td><%= listStud[1] %></td>
                                <td><%= listStud[2] %></td>
                                <td><%= listStud[3] %></td>
                            </tr>
                            <%
                                    }}
                            %>
                            </tbody>
                        </table>
                        <%
                            }
                        %>

                        <%--         by courses per department               --%>
                        <%
                            if (listDepartmentCourses != null) {
                        %>
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col" hidden="true">ID</th>
                                <th scope="col">Course Code</th>
                                <th scope="col">Course Name</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if (listDepartmentCourses != null) {
                                    for(Object[] listDepartCourse : listDepartmentCourses) {
                            %>
                            <tr>
                                <td hidden="true"><%= listDepartCourse[0] %></td>
                                <td><%= listDepartCourse[1] %></td>
                                <td><%= listDepartCourse[2] %></td>
                            </tr>
                            <%
                                    }}
                            %>
                            </tbody>
                        </table>
                        <%
                            }
                        %>

                        <%--         by department               --%>
                        <%
                            if (listDepartments != null) {
                        %>
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col" hidden="true">ID</th>
                                <th scope="col">Student Reg. No</th>
                                <th scope="col">Student Name</th>
                                <th scope="col">Department</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if (listDepartments != null) {
                                    for(Object[] listDepart : listDepartments) {
                            %>
                            <tr>
                                <td hidden="true"><%= listDepart[0] %></td>
                                <td><%= listDepart[1] %></td>
                                <td><%= listDepart[2] %></td>
                                <td><%= listDepart[3] %></td>
                            </tr>
                            <%
                                    }}
                            %>
                            </tbody>
                        </table>
                        <%
                            }
                        %>
                        <%--         by student taking courses              --%>
                        <%
                            if (listCourses != null) {
                        %>
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col" hidden="true">ID</th>
                                <th scope="col">Reg. No</th>
                                <th scope="col">Fullname</th>
                                <th scope="col">Course Code</th>
                                <th scope="col">Course Name</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if (listCourses != null) {
                                    for(Object[] listcourse : listCourses) {
                            %>
                            <tr>
                                <td hidden="true"><%= listcourse[0] %></td>
                                <td><%= listcourse[1] %></td>
                                <td><%= listcourse[2] %></td>
                                <td><%= listcourse[3] %></td>
                                <td><%= listcourse[4] %></td>
                            </tr>
                            <%
                                    }}
                            %>
                            </tbody>
                        </table>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </section>
<%@include file="footer.jsp"%>
</main>
<script>
    const listType = document.getElementById("listType");

    const departmentForm = document.getElementById("departmentForm");
    const courseForm = document.getElementById("courseForm");

    const semesterForm = document.getElementById("semesterForm");
    const departmentCourseForm = document.getElementById("departmentCourseForm");
    const studentForm = document.getElementById("studentForm");

    listType.addEventListener("change", () => {
        // Hide all forms initially
        departmentForm.style.display = "none";
        courseForm.style.display = "none";
        semesterForm.style.display = "none";
        departmentCourseForm.style.display = "none";
        studentForm.style.display = "none";

        switch (listType.value) {
            case "DEPARTMENT":
                departmentForm.style.display = "block";
                break;
            case "COURSE":
                courseForm.style.display = "block";
                break;
            case "SEMESTER":
                semesterForm.style.display = "block";
                break;
            case "COURSE_DEPARTMENT":
                departmentCourseForm.style.display = "block";
                break;
            case "COURSE_STUDENT":
                studentForm.style.display = "block";
                break;
        }
    });
</script>
