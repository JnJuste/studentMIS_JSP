package com.example.studentmid24229.service;

import com.example.studentmid24229.model.Course;

import java.rmi.RemoteException;
import java.util.List;
import java.util.UUID;

public interface CourseService {
    public boolean addCourse(Course course);
    public List<Course> fetchAllCourses() throws RemoteException;

    List<Object[]> getCourseDefinition();

    List<Object[]> getAcademicsUnit();

    List<Object[]> getTutorsAndAssistants();
    List<Object[]> getAllSemesters();

    Course findById(UUID course_id);
}
