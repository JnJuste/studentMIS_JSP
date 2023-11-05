package com.example.studentmid24229.service;

import com.example.studentmid24229.dao.ListingDAO;

import java.rmi.RemoteException;
import java.util.List;
import java.util.UUID;

public class ListingServiceImpl implements ListingService{
    ListingDAO dao = new ListingDAO();

    public ListingServiceImpl() throws RemoteException {
    }

    @Override
    public List<Object[]> listStudentsByCourse(UUID course_id) throws RemoteException {
        return dao.getStudentsByCourse(course_id);
    }

    @Override
    public List<Object[]> listStudentsByDepartment(UUID acc_id) throws RemoteException {
        return dao.getStudentsByDepartment(acc_id);
    }

    @Override
    public List<Object[]> listCoursesByStudent(UUID course_id) throws RemoteException {
        return dao.getCoursesByStudent(course_id);
    }

    @Override
    public List<Object[]> listCoursesByDepartment(UUID course_id) throws RemoteException {
        return dao.getCoursesByDepartment(course_id);
    }

    @Override
    public List<Object[]> listStudentsBySemester(UUID stud_id) throws RemoteException {
        return dao.getStudentsBySemester(stud_id);
    }
}
