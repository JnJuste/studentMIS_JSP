package com.example.studentmid24229.dao;


import com.example.studentmid24229.model.Student;
import com.example.studentmid24229.model.StudentRegistration;
import com.example.studentmid24229.model.Teacher;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class StudentRegistrationDAO {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public StudentRegistrationDAO () {
    }

    public boolean addStudentReg(StudentRegistration studentRegistration){
        Transaction tr = session.beginTransaction();
        session.merge(studentRegistration);
        tr.commit();
        session.close();
        return true;
    }

    public List<StudentRegistration> findAllStudentsReg() {
        Session session = null;
        List<StudentRegistration> result = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            result = session.createQuery("from StudentRegistration ").list();
        } catch (HibernateException ex) {
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return result;
    }

    public List<Object[]> getAcademicUnits() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Object[]> results = new ArrayList<>();
        try {
            results = session.createQuery("select cd.code, cd.name from AcademicUnit cd WHERE cd.unit='DEPARTMENT'").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }

    public List<Object[]> getSemesters() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Object[]> results = new ArrayList<>();
        try {
            results = session.createQuery("select cd.id, cd.names from Semester cd").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }

    public List<Object[]> getStudents() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Object[]> results = new ArrayList<>();
        try {
            results = session.createQuery("select cd.student_id, cd.studNames from Student cd").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }
    public StudentRegistration findByIdStudReg(UUID id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "FROM StudentRegistration WHERE id = :id";
            Query<StudentRegistration> query = session.createQuery(hql, StudentRegistration.class);
            query.setParameter("id", id);
            return query.uniqueResult();
        } finally {
            session.close();
        }
    }

    public StudentRegistration findById(UUID id) {
        Session session = null;
        StudentRegistration studentRegistration = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            studentRegistration = session.get(StudentRegistration.class, id);
        } catch (HibernateException ex) {
            // Handle exceptions as needed
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return studentRegistration;
    }


}
