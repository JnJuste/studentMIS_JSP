<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- CSS -->
  <link rel="stylesheet" href="css/style.css">

  <!-- Iconscout CSS -->
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

  <title>Admin Dashboard Panel</title>
</head>
<body>
<nav>
  <div class="logo-name">
    <div class="logo-image">
    </div>
    <span class="logo_name">AUCA UNIVERSITY</span>
  </div>
  <div class="scrollable-container">
  <div class="menu-items">
    <ul class="nav-links">
      <li><a href="dashboardAdmin.jsp">
        <i class="uil uil-estate"></i>
        <span class="link-name">Dashboard</span>
      </a></li>
      <li><a href="academicUnit.jsp">
        <i class="uil uil-files-landscapes"></i>
        <span class="link-name">ACADEMIC UNITS</span>
      </a></li>
      <li><a href="student.jsp">
        <i class="uil-pentagon"></i>
        <span class="link-name">STUDENT</span>
      </a></li>
      <li><a href="teacher.jsp">
        <i class="uil uil-thumbs-up"></i>
        <span class="link-name">TEACHER</span>
      </a></li>
      <li><a href="semester.jsp">
        <i class="uil uil-chart"></i>
        <span class="link-name">SEMESTER</span>
      </a></li>
      <li><a href="courseDefinition.jsp">
        <i class="uil-book-open"></i>
        <span class="link-name">COURSE DEF</span>
      </a></li>
      <li><a href="studentRegistration.jsp">
        <i class="uil-notebooks"></i>
        <span class="link-name">STUDENT REGISTR</span>
      </a></li>
      <li><a href="course.jsp">
        <i class="uil-pen"></i>
        <span class="link-name">COURSE</span>
      </a></li>
      <li><a href="studentCourse.jsp">
        <i class="uil-prescription-bottle"></i>
        <span class="link-name">STUDENT COURSE</span>
      </a></li>
       <li><a href="listingFinal.jsp">
      <i class="uil-list-ul"></i>
      <span class="link-name">LISTS</span>
       </a></li>
    </ul>

    <ul class="logout-mode">
      <li><a href="#">
        <i class="uil uil-signout"></i>
        <span class="link-name">Logout</span>
      </a></li>

      <li class="mode">
        <a href="#">
          <i class="uil uil-moon"></i>
          <span class="link-name">Dark Mode</span>
        </a>

        <div class="mode-toggle">
          <span class="switch"></span>
        </div>
      </li>
    </ul>
  </div>
  </div>
</nav>
