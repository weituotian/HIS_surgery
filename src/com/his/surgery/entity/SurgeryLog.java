package com.his.surgery.entity;

import javax.persistence.*;

/**
 * 手术记录
 */
@Entity
@Table(name = "surgery_log", schema = "his", catalog = "")
public class SurgeryLog {
    private int code;
    private String remark;
    private Surgery surgery;
    private String firstDiagnosis;
    private String endDiagnosis;
    private String process;

    @Id
    @Column(name = "code", nullable = false)
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    @Basic
    @Column(name = "log", nullable = false, length = 200)
    public String getRemark() {
        return remark;
    }

    public void setRemark(String log) {
        this.remark = log;
    }

    @Basic
    @Column(name = "first_diagnosis", nullable = true, length = 20)
    public String getFirstDiagnosis() {
        return firstDiagnosis;
    }

    public void setFirstDiagnosis(String firstDiagnosis) {
        this.firstDiagnosis = firstDiagnosis;
    }

    @Basic
    @Column(name = "end_diagnosis", nullable = true, length = 20)
    public String getEndDiagnosis() {
        return endDiagnosis;
    }

    public void setEndDiagnosis(String endDiagnosis) {
        this.endDiagnosis = endDiagnosis;
    }

    @Basic
    @Column(name = "process", nullable = true, length = 400)
    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SurgeryLog that = (SurgeryLog) o;

        if (code != that.code) return false;
        if (remark != null ? !remark.equals(that.remark) : that.remark != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = code;
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        return result;
    }

    @OneToOne
    @PrimaryKeyJoinColumn(referencedColumnName = "code",foreignKey = @ForeignKey(name = "FK_have_log"))
    //与@JoinColumn(name = "sur_code", referencedColumnName = "code", nullable = false)一样
    //但是情况特殊一点，name = "sur_code"不用写，因为是指向id的
    public Surgery getSurgery() {
        return surgery;
    }

    public void setSurgery(Surgery oneToOne) {
        this.surgery = oneToOne;
    }
}
