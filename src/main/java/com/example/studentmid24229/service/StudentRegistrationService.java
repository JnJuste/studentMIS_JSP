package com.example.studentmid24229.service;

import com.example.studentmid24229.model.StudentRegistration;

import java.util.List;
import java.util.UUID;

public interface StudentRegistrationService {
    public boolean addStudentReg(StudentRegistration studentRegistration);
    public List<StudentRegistration> findAllStudentsReg();
    List<Object[]> getSemesters();
    List<Object[]> getAcademicUnits();
    List<Object[]> getStudents();

    StudentRegistration findById(UUID uuid);

    StudentRegistration findByIdStudReg(UUID reg_Id);
}
