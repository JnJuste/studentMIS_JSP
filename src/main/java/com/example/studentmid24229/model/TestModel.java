package com.example.studentmid24229.model;

import com.example.studentmid24229.dao.HibernateUtil;

public class TestModel {
    public static void main(String[] args) {
        HibernateUtil.getSessionFactory().openSession();
    }
}
