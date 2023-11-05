package com.example.studentmid24229.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import java.time.LocalDate;
import java.util.UUID;

@Entity
public class Semester {
    @Id
    private UUID ID;
    private String semCode;
    private String names;
    private LocalDate startDate;
    private LocalDate endDate;

    public Semester() {
    }

    @Override
    public String toString(){
        return this.names;
    }

    public Semester(UUID ID, String semCode, String names, LocalDate startDate, LocalDate endDate) {
        this.ID = ID;
        this.semCode = semCode;
        this.names = names;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public UUID getID() {
        return ID;
    }

    public void setID(UUID ID) {
        this.ID = ID;
    }

    public String getSemCode() {
        return semCode;
    }

    public void setSemCode(String semCode) {
        this.semCode = semCode;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }
}
