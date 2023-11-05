package com.example.studentmid24229.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import java.util.UUID;

@Entity
public class CourseDefinition {
    @Id
    private UUID course_def_Id;
    private String courseCode;
    private String courseName;
    private String description;


    public CourseDefinition() {
    }

    @Override
    public String toString(){
        return this.courseName;
    }
    public CourseDefinition(UUID course_def_Id, String courseCode, String courseName, String description) {
        this.course_def_Id = course_def_Id;
        this.courseCode = courseCode;
        this.courseName = courseName;
        this.description = description;
    }

    public UUID getCourse_def_Id() {
        return course_def_Id;
    }

    public void setCourse_def_Id(UUID course_def_Id) {
        this.course_def_Id = course_def_Id;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
