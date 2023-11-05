package com.example.studentmid24229.beans;

import com.example.studentmid24229.model.Course;
import com.example.studentmid24229.model.Student;
import com.example.studentmid24229.model.StudentRegistration;
import jakarta.persistence.ManyToOne;

import java.math.BigDecimal;
import java.util.UUID;

public class StudentCourseBean {
    private UUID stud_CourseId;
    private Course course;
    private StudentRegistration studentRegistration;
    private BigDecimal results;
    private Integer credits;

    public StudentCourseBean() {
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
