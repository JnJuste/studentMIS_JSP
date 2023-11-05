package com.example.studentmid24229.service;

import com.example.studentmid24229.dao.CourseDefinitionDAO;
import com.example.studentmid24229.model.CourseDefinition;

import java.rmi.RemoteException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class CourseDefinitionServiceImpl implements CourseDefinitionService{
    CourseDefinitionDAO dao = new CourseDefinitionDAO();

    @Override
    public boolean addCourseDefinition(CourseDefinition courseDefinition) {
        return dao.addCourseDefinition(courseDefinition);
    }

    @Override
    public List<CourseDefinition> fetchAllCourseDefinitions() throws RemoteException {
        return dao.findAllCourseDefinitions();
    }

    @Override
    public CourseDefinition findById(UUID uuid) {
        return dao.findById(uuid);
    }
}
