package com.example.studentmid24229.beans;

import com.example.studentmid24229.model.EQualification;

public class TeacherBean {
    private String codeTeach;
    private String namesTeach;

    private EQualification qualification;

    public TeacherBean() {
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
