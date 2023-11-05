package com.example.studentmid24229.service;

import com.example.studentmid24229.dao.TeacherDAO;
import com.example.studentmid24229.model.Teacher;

import java.rmi.RemoteException;
import java.util.List;
import java.util.UUID;

public class TeacherServiceImpl implements TeacherService{
    TeacherDAO dao = new TeacherDAO();
    @Override
    public boolean addTeacher(Teacher teacher) {
        return dao.addTeacher(teacher);
    }

    @Override
    public List<Teacher> fetchAllTeachers() throws RemoteException {
        return dao.findAllTeachers();
    }

    @Override
    public Teacher findById(UUID uuid) {
        return dao.findById(uuid);
    }
}
