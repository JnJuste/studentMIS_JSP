package com.example.studentmid24229.service;


import com.example.studentmid24229.dao.StudentCourseDAO;
import com.example.studentmid24229.model.StudentCourse;

import java.rmi.RemoteException;
import java.util.List;

public class StudentCourseServiceImpl implements StudentCourseService{
    StudentCourseDAO dao = new StudentCourseDAO();


    @Override
    public void createStudentCourse(StudentCourse studentCourse) throws RemoteException {
        dao.createStudentCourse(studentCourse);
    }

    @Override
    public List<Object[]> fetchAllStudents() throws RemoteException {
        return dao.getStudentCourses();
    }

    @Override
    public List<Object[]> getAllCourses() throws RemoteException {
        return dao.getAllCourses();
    }

    @Override
    public List<Object[]> getRegisteredStudents() throws RemoteException {
        return dao.getRegisteredStudents();
    }
}
