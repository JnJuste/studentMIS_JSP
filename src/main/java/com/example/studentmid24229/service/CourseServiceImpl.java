package com.example.studentmid24229.service;

import com.example.studentmid24229.dao.CourseDAO;
import com.example.studentmid24229.model.Course;

import java.rmi.RemoteException;
import java.util.List;
import java.util.UUID;

public class CourseServiceImpl implements CourseService{

    CourseDAO courseDao = new CourseDAO();

    @Override
    public boolean addCourse(Course course) {
        return courseDao.createCourse(course);
    }

    @Override
    public List<Course> fetchAllCourses() throws RemoteException {
        return courseDao.getAllCourses();
    }

    @Override
    public List<Object[]> getCourseDefinition() {
        return courseDao.getCourseDefinition();
    }

    @Override
    public List<Object[]> getAcademicsUnit() {
        return courseDao.getAcademicUnits();
    }

    @Override
    public List<Object[]> getTutorsAndAssistants() {
        return courseDao.getTutorsAndAssistants();
    }

    @Override
    public List<Object[]> getAllSemesters() {
        return courseDao.getAllSemesters();
    }

    @Override
    public Course findById(UUID course_id) {
        return courseDao.findById(course_id);
    }


}
