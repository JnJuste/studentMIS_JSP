package com.example.studentmid24229.service;

import com.example.studentmid24229.model.Semester;

import java.rmi.RemoteException;
import java.util.List;
import java.util.UUID;

public interface SemesterService {
    public boolean addSemester(Semester semester);
    public List<Semester> fetchAllSemesters() throws RemoteException;

    Semester findById(UUID uuid);
}
