package com.his.surgery.entity;

import javax.persistence.*;

/**
 *  麻醉
 */
@Entity
public class Anaesthesia {
    private int code;
    //麻醉方法
    private String method;
    //会诊意见
    private String consultation;
    private Surgery sur;
    //麻醉医生
    private Doctor doctor;

    @Id
    @Column(name = "code", nullable = false)
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    @Basic
    @Column(name = "consultation", nullable = true, length = 60)
    public String getConsultation() {
        return consultation;
    }

    public void setConsultation(String consultation) {
        this.consultation = consultation;
    }

    @Basic
    @Column(name = "method",nullable = true,length = 20)
    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Anaesthesia that = (Anaesthesia) o;

        if (code != that.code) return false;
        if (consultation != null ? !consultation.equals(that.consultation) : that.consultation != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = code;
        result = 31 * result + (consultation != null ? consultation.hashCode() : 0);
        return result;
    }

    @OneToOne(fetch =FetchType.LAZY)
    @JoinColumn(name = "sur_code", referencedColumnName = "code", nullable = false)
    public Surgery getSur() {
        return sur;
    }

    public void setSur(Surgery sur) {
        this.sur = sur;
    }

    @OneToOne
    @JoinColumn(name = "doctor_id", referencedColumnName = "id")
    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }
}
