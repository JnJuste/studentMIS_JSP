package com.example.studentmid24229.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

import javax.xml.transform.Result;
import java.math.BigDecimal;
import java.util.UUID;
@Entity
public class StudentCourse {
    @Id
    private UUID stud_CourseId;
    @ManyToOne
    private Course course;
    @ManyToOne
    private StudentRegistration studentRegistration;
    private BigDecimal results;
    private Integer credits;

    public StudentCourse() {
    }

    public StudentCourse(UUID stud_CourseId, Course course, StudentRegistration studentRegistration, BigDecimal results, Integer credits) {
        this.stud_CourseId = stud_CourseId;
        this.course = course;
        this.studentRegistration = studentRegistration;
        this.results = results;
        this.credits = credits;
    }

    public UUID getStud_CourseId() {
        return stud_CourseId;
    }

    public void setStud_CourseId(UUID stud_CourseId) {
        this.stud_CourseId = stud_CourseId;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public StudentRegistration getStudentRegistration() {
        return studentRegistration;
    }

    public void setStudentRegistration(StudentRegistration studentRegistration) {
        this.studentRegistration = studentRegistration;
    }

    public BigDecimal getResults() {
        return results;
    }

    public void setResults(BigDecimal results) {
        this.results = results;
    }

    public Integer getCredits() {
        return credits;
    }

    public void setCredits(Integer credits) {
        this.credits = credits;
    }
}
