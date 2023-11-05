package com.example.studentmid24229.beans;

import com.example.studentmid24229.model.AcademicUnit;

import java.time.LocalDate;


public class StudentBean {
    private String regNo;
    private String studNames;
    private LocalDate dateOfBirth;

    public StudentBean() {
    }

    public String getRegNo() {
        return regNo;
    }

    public void setRegNo(String regNo) {
        this.regNo = regNo;
    }

    public String getStudNames() {
        return studNames;
    }

    public void setStudNames(String studNames) {
        this.studNames = studNames;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}
