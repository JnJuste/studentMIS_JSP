package com.example.studentmid24229.service;


import com.example.studentmid24229.model.AcademicUnit;

import java.rmi.RemoteException;
import java.util.List;
import java.util.UUID;


public interface AcademicUnitService {
    public boolean addAcademicUnit(AcademicUnit academicUnit);
    public List<AcademicUnit> fetchAllAcademicUnits() throws RemoteException;
    public boolean updateAcademicUnit(AcademicUnit academicUnit);

    AcademicUnit findById(UUID uuid);
}
