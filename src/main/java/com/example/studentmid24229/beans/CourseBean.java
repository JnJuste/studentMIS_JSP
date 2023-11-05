package com.example.studentmid24229.beans;

import com.example.studentmid24229.model.AcademicUnit;
import com.example.studentmid24229.model.CourseDefinition;
import com.example.studentmid24229.model.Semester;
import com.example.studentmid24229.model.Teacher;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;

public class CourseBean {
    private AcademicUnit accUnit;
    private CourseDefinition courseDefinition;
    private Teacher tutor;
    private Teacher assistant;
    private Semester semester;

    public CourseBean() {
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
