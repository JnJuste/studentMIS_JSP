package com.example.studentmid24229.dao;

import com.example.studentmid24229.model.Course;
import com.example.studentmid24229.model.CourseDefinition;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class CourseDAO {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public CourseDAO() {
    }

    public boolean createCourse(Course course) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(course);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }

    public List<Course> getAllCourses() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "FROM Course";
            Query<Course> query = session.createQuery(hql, Course.class);
            return query.list();
        } finally {
            session.close();
        }
    }

    // for dropdownlist
    public List<Object[]> getAcademicUnits() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Object[]> results = new ArrayList<>();
        try {
            results = session.createQuery("select au.code, au.name from AcademicUnit au where au.unit = 'DEPARTMENT'").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }

    public List<Object[]> getAllSemesters() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Object[]> results = new ArrayList<>();
        try {
            results = session.createQuery("select sem.ID, sem.semCode, sem.names, sem.startDate, sem.endDate from Semester sem").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }

    public List<Object[]> getCourseDefinition() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Object[]> results = new ArrayList<>();
        try {
            results = session.createQuery("select cd.course_def_Id, cd.courseName from CourseDefinition cd").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }

    public List<Object[]> getTutorsAndAssistants() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Object[]> results = new ArrayList<>();
        try {
            results = session.createQuery("select t.idTeach, t.namesTeach from Teacher t").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }

    public Course findById(UUID course_id) {
        Session session = null;
        Course course = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            course = session.get(Course.class, course_id);
        } catch (HibernateException ex) {
            // Handle exceptions as needed
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return course;
    }
}
