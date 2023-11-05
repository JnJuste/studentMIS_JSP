package com.example.studentmid24229.model;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
public class Course {
    @Id
    private UUID course_id;
    @ManyToOne
    private AcademicUnit accUnit;
    @ManyToOne
    private CourseDefinition courseDefinition;
    @ManyToOne
    private Teacher tutor;
    @ManyToOne
    private Teacher assistant;
    @ManyToOne
    private Semester semester;

    public Course() {
    }

    public Course(UUID course_id, AcademicUnit accUnit, CourseDefinition courseDefinition, Teacher tutor, Teacher assistant, Semester semester) {
        this.course_id = course_id;
        this.accUnit = accUnit;
        this.courseDefinition = courseDefinition;
        this.tutor = tutor;
        this.assistant = assistant;
        this.semester = semester;
    }

    public UUID getCourse_id() {
        return course_id;
    }

    public void setCourse_id(UUID course_id) {
        this.course_id = course_id;
    }

    public AcademicUnit getAccUnit() {
        return accUnit;
    }

    public void setAccUnit(AcademicUnit accUnit) {
        this.accUnit = accUnit;
    }

    public CourseDefinition getCourseDefinition() {
        return courseDefinition;
    }

    public void setCourseDefinition(CourseDefinition courseDefinition) {
        this.courseDefinition = courseDefinition;
    }

    public Teacher getTutor() {
        return tutor;
    }

    public void setTutor(Teacher tutor) {
        this.tutor = tutor;
    }

    public Teacher getAssistant() {
        return assistant;
    }

    public void setAssistant(Teacher assistant) {
        this.assistant = assistant;
    }

    public Semester getSemester() {
        return semester;
    }

    public void setSemester(Semester semester) {
        this.semester = semester;
    }
}
