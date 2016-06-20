package com.his.surgery.entity;

import javax.persistence.*;

/**
 * 手术记录
 */
@Entity
@Table(name = "surgery_log", schema = "his")
public class SurgeryLog {
    private int code;
    private String log;

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
    public String getLog() {
        return log;
    }

    public void setLog(String log) {
        this.log = log;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SurgeryLog that = (SurgeryLog) o;

        if (code != that.code) return false;
        if (log != null ? !log.equals(that.log) : that.log != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = code;
        result = 31 * result + (log != null ? log.hashCode() : 0);
        return result;
    }

    private Surgery surgery;

    @OneToOne(fetch = FetchType.LAZY)
    @PrimaryKeyJoinColumn
    //与@JoinColumn(name = "sur_code", referencedColumnName = "code", nullable = false)一样
    //但是情况特殊一点，name = "sur_code"不用写，因为是指向id的
    public Surgery getSurgery() {
        return surgery;
    }

    public void setSurgery(Surgery oneToOne) {
        this.surgery = oneToOne;
    }
}
