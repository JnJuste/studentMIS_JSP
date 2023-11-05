package com.example.studentmid24229.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.UUID;
@Entity
public class StudentRegistration {
    @Id
    private UUID id;
    @OneToOne
    private Student student;
    @OneToOne
    private AcademicUnit academicUnit;
    @OneToOne
    private Semester semester;
    @Enumerated(EnumType.STRING)
    private ERegistrationStatus eRegistrationStatus;
    private LocalDate registrationDate;

    public StudentRegistration() {
    }

    public StudentRegistration(UUID id, Student student, AcademicUnit academicUnit, Semester semester, ERegistrationStatus eRegistrationStatus, LocalDate registrationDate) {
        this.id = id;
        this.student = student;
        this.academicUnit = academicUnit;
        this.semester = semester;
        this.eRegistrationStatus = eRegistrationStatus;
        this.registrationDate = registrationDate;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
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
