package com.example.studentmid24229.beans;

import com.example.studentmid24229.model.EAcademicUnit;

import java.io.Serializable;

public class AcademicUnitBean implements Serializable {
    private String codeNumb;
    private String name;
    private EAcademicUnit unit;

    public AcademicUnitBean() {
    }

    public String getCodeNumb() {
        return codeNumb;
    }

    public void setCodeNumb(String codeNumb) {
        this.codeNumb = codeNumb;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public EAcademicUnit getUnit() {
        return unit;
    }

    public void setUnit(EAcademicUnit unit) {
        this.unit = unit;
    }
}
