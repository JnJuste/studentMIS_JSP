package com.example.studentmid24229.dao;

import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;
import java.util.UUID;

public class ListingDAO {
    public List<Object[]> getStudentsByCourse(UUID course_id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "SELECT c.course_id, st.regNo, st.studNames, cd.courseCode, cd.courseName FROM CourseDefinition cd JOIN Course c ON cd.course_def_Id = c.courseDefinition.course_def_Id JOIN StudentCourse sc ON c.course_id = sc.course.course_id JOIN StudentRegistration stu ON stu.id = sc.studentRegistration.id JOIN Student st On st.student_id = stu.student.student_id WHERE c.courseDefinition.course_def_Id = :courseId";
            Query<Object[]> query = session.createQuery(hql);
            query.setParameter("courseId", course_id);
            return query.list();
        } finally {
            session.close();
        }
    }

    public List<Object[]> getCoursesByStudent(UUID stud_id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "SELECT s.id, stu.regNo, stu.studNames, cd.courseCode, cd.courseName " +
                    "FROM StudentCourse sc " +
                    "JOIN sc.course c " +
                    "JOIN c.courseDefinition cd " +
                    "JOIN sc.studentRegistration s " +
                    "JOIN s.student stu " +
                    "WHERE s.id = :stud_id";

            Query<Object[]> query = session.createQuery(hql);
            query.setParameter("stud_id", stud_id);
            return query.list();
        } finally {
            session.close();
        }
    }

    public List<Object[]> getCoursesByDepartment(UUID dep_id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "SELECT c.course_id, cd.courseCode, cd.courseName " +
                    "FROM Course c " +
                    "JOIN c.courseDefinition cd " +
                    "JOIN c.accUnit acc " +
                    "WHERE acc.id = :dep_id";

            Query<Object[]> query = session.createQuery(hql);
            query.setParameter("dep_id", dep_id);
            return query.list();
        } finally {
            session.close();
        }
    }

    public List<Object[]> getStudentsBySemester(UUID sem_id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "SELECT sem.ID, st.regNo, st.studNames FROM StudentRegistration stu JOIN Student st On st.student_id = stu.student.student_id JOIN Semester sem ON sem.ID = stu.semester.ID WHERE sem.ID = :sem_id";
            Query<Object[]> query = session.createQuery(hql);
            query.setParameter("sem_id", sem_id);
            return query.list();
        } finally {
            session.close();
        }
    }

    public List<Object[]> getStudentsByDepartment(UUID acc_id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "SELECT st.student_id, st.regNo, st.studNames, acc.name FROM StudentRegistration stu JOIN AcademicUnit acc ON acc.code = stu.academicUnit.code JOIN Student st On st.student_id = stu.student.student_id WHERE acc.code = :accId";
            Query<Object[]> query = session.createQuery(hql);
            query.setParameter("accId", acc_id);
            return query.list();
        } finally {
            session.close();
        }
    }
}
