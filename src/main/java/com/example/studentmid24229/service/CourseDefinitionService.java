package com.example.studentmid24229.service;

import com.example.studentmid24229.model.CourseDefinition;

import java.rmi.RemoteException;
import java.util.List;
import java.util.UUID;

public interface CourseDefinitionService {
    public boolean addCourseDefinition(CourseDefinition courseDefinition);
    public List<CourseDefinition> fetchAllCourseDefinitions() throws RemoteException;

    CourseDefinition findById(UUID uuid);
}
