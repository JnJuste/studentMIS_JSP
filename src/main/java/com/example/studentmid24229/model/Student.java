package com.example.studentmid24229.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;

import java.time.LocalDate;
import java.util.UUID;

@Entity
public class Student {
    @Id
    private UUID student_id;
    private String regNo;
    private String studNames;
    private LocalDate dateOfBirth;

    public Student() {
    }

    @Override
    public String toString(){
        return this.studNames;
    }
    public Student(UUID student_id, String regNo, String studNames, LocalDate dateOfBirth) {
        this.student_id = student_id;
        this.regNo = regNo;
        this.studNames = studNames;
        this.dateOfBirth = dateOfBirth;
    }

    public UUID getStudent_id() {
        return student_id;
    }

    public void setStudent_id(UUID student_id) {
        this.student_id = student_id;
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