package com.example.studentmid24229.beans;

import com.example.studentmid24229.model.AcademicUnit;
import com.example.studentmid24229.model.ERegistrationStatus;
import com.example.studentmid24229.model.Semester;
import com.example.studentmid24229.model.Student;


import java.time.LocalDate;

public class StudentRegistrationBean {
    private Student student;
    private AcademicUnit academicUnit;
    private Semester semester;
    private ERegistrationStatus eRegistrationStatus;
    private LocalDate registrationDate;

    public StudentRegistrationBean() {
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public AcademicUnit getAcademicUnit() {
        return academicUnit;
    }

    public void setAcademicUnit(AcademicUnit academicUnit) {
        this.academicUnit = academicUnit;
    }

    public Semester getSemester() {
        return semester;
    }

    public void setSemester(Semester semester) {
        this.semester = semester;
    }

    public ERegistrationStatus geteRegistrationStatus() {
        return eRegistrationStatus;
    }

    public void seteRegistrationStatus(ERegistrationStatus eRegistrationStatus) {
        this.eRegistrationStatus = eRegistrationStatus;
    }

    public LocalDate getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(LocalDate registrationDate) {
        this.registrationDate = registrationDate;
    }
}
