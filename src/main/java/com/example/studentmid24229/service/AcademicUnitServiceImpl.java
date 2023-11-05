package com.example.studentmid24229.service;

import com.example.studentmid24229.dao.AcademicUnitDAO;
import com.example.studentmid24229.model.AcademicUnit;
import com.example.studentmid24229.service.AcademicUnitService;

import java.rmi.RemoteException;
import java.util.List;
import java.util.UUID;

public class AcademicUnitServiceImpl implements AcademicUnitService {

    AcademicUnitDAO dao = new AcademicUnitDAO();
    @Override
    public boolean addAcademicUnit(AcademicUnit academicUnit) {
        return dao.addAcademicUnit(academicUnit);
    }

    @Override
    public List<AcademicUnit> fetchAllAcademicUnits() throws RemoteException {
        return dao.getAllAcademicUnits();
    }

    @Override
    public boolean updateAcademicUnit(AcademicUnit academicUnit) {
        return dao.updateAcademicUnit(academicUnit);
    }

    @Override
    public AcademicUnit findById(UUID uuid) {
        return dao.findById(uuid);
    }


}
