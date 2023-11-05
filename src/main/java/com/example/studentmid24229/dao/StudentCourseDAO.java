package com.example.studentmid24229.dao;

import com.example.studentmid24229.model.StudentCourse;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class StudentCourseDAO {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public StudentCourseDAO () {
    }

    public boolean createStudentCourse(StudentCourse studentCourse) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(studentCourse);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }

    public List<Object[]> getStudentCourses() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "SELECT sc.stud_CourseId, st.regNo, st.studNames, cd.course_def_Id, cd.courseName, sc.credits, sc.results FROM CourseDefinition cd JOIN Course c ON cd.course_def_Id = c.courseDefinition.course_def_Id JOIN StudentCourse sc ON c.course_id = sc.course.course_id JOIN StudentRegistration stu ON stu.id = sc.stud_CourseId JOIN Student st On st.student_id = stu.student.student_id";
            Query<Object[]> query = session.createQuery(hql);
            return query.list();
        } finally {
            session.close();
        }
    }

    public List<Object[]> getAllCourses() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Object[]> results = new ArrayList<>();
        try {
            results = session.createQuery("SELECT cs.course_id,  cd.courseCode, cd.courseName FROM Course cs JOIN CourseDefinition cd ON cd.course_def_Id = cs.courseDefinition.course_def_Id").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }

    public List<Object[]> getRegisteredStudents() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Object[]> results = new ArrayList<>();
        try {
            results = session.createQuery("SELECT studreg.id, stud.regNo, stud.studNames FROM StudentRegistration studreg JOIN Student stud ON stud.id = studreg.student.id").list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }
}
