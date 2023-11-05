package com.example.studentmid24229.model;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
public class AcademicUnit {
    @Id
    private UUID code;
    private String codeNumb;
    private String name;
    @Enumerated(EnumType.STRING)
    private EAcademicUnit unit;

    public AcademicUnit() {
    }

    @Override
    public String toString(){
        return this.name;
    }

    public AcademicUnit(UUID code, String codeNumb, String name, EAcademicUnit unit) {
        this.code = code;
        this.codeNumb = codeNumb;
        this.name = name;
        this.unit = unit;
    }

    public UUID getCode() {
        return code;
    }

    public void setCode(UUID code) {
        this.code = code;
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
