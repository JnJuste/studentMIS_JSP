package com.example.studentmid24229.beans;

import java.time.LocalDate;

public class SemesterBean {
    private String semCode;
    private String names;
    private LocalDate startDate;
    private LocalDate endDate;

    public SemesterBean() {
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
