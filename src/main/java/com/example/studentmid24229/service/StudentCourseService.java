package com.example.studentmid24229.service;

import com.example.studentmid24229.model.StudentCourse;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

public interface StudentCourseService extends Remote {
    public void createStudentCourse(StudentCourse studentCourse) throws RemoteException;
    public List<Object[]> fetchAllStudents() throws RemoteException;
    public List<Object[]> getAllCourses() throws RemoteException;
    public List<Object[]> getRegisteredStudents() throws RemoteException;

}
