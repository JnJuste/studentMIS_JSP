package com.example.studentmid24229.service;

import com.example.studentmid24229.dao.StudentRegistrationDAO;
import com.example.studentmid24229.model.StudentRegistration;

import java.util.List;
import java.util.UUID;

public class StudentRegistrationServiceImpl implements StudentRegistrationService{
    StudentRegistrationDAO dao = new StudentRegistrationDAO();
    @Override
    public boolean addStudentReg(StudentRegistration studentRegistration) {
        return dao.addStudentReg(studentRegistration);
    }

    @Override
    public List<StudentRegistration> findAllStudentsReg() {
        return dao.findAllStudentsReg();
    }

    @Override
    public List<Object[]> getSemesters() {
        return dao.getSemesters();
    }

    @Override
    public List<Object[]> getAcademicUnits() {
        return dao.getAcademicUnits();
    }

    @Override
    public List<Object[]> getStudents() {
        return dao.getStudents();
    }

    @Override
    public StudentRegistration findById(UUID uuid) {
        return dao.findById(uuid);
    }

    @Override
    public StudentRegistration findByIdStudReg(UUID reg_Id) {
        return dao.findByIdStudReg(reg_Id);
    }
}
