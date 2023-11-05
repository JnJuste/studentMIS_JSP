package com.example.studentmid24229.model;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;

import java.util.UUID;

@Entity
public class Teacher {
    @Id
    private UUID idTeach;
    private String codeTeach;
    private String namesTeach;
    @Enumerated(EnumType.STRING)
    private EQualification qualification;

    public Teacher() {
    }

    @Override
    public String toString(){
        return this.namesTeach;
    }
    public Teacher(UUID idTeach, String codeTeach, String namesTeach, EQualification qualification) {
        this.idTeach = idTeach;
        this.codeTeach = codeTeach;
        this.namesTeach = namesTeach;
        this.qualification = qualification;
    }

    public UUID getIdTeach() {
        return idTeach;
    }

    public void setIdTeach(UUID idTeach) {
        this.idTeach = idTeach;
    }

    public String getCodeTeach() {
        return codeTeach;
    }

    public void setCodeTeach(String codeTeach) {
        this.codeTeach = codeTeach;
    }

    public String getNamesTeach() {
        return namesTeach;
    }

    public void setNamesTeach(String namesTeach) {
        this.namesTeach = namesTeach;
    }

    public EQualification getQualification() {
        return qualification;
    }

    public void setQualification(EQualification qualification) {
        this.qualification = qualification;
    }
}
