package com.example.studentmid24229.service;

import com.example.studentmid24229.model.Student;

import java.rmi.RemoteException;
import java.util.List;
import java.util.UUID;

public interface StudentService {
    public boolean addStudent(Student student);
    public List<Student> fetchAllStudents() throws RemoteException;

    Student findById(UUID uuid);
}
