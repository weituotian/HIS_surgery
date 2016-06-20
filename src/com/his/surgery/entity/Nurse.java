package com.his.surgery.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * 护士
 */
@Entity
public class Nurse {
    private int nurseId;
    private String nurseName;

    @Id
    @Column(name = "nurse_id", nullable = false)
    public int getNurseId() {
        return nurseId;
    }

    public void setNurseId(int nurseId) {
        this.nurseId = nurseId;
    }

    @Basic
    @Column(name = "nurse_name", nullable = true, length = 8)
    public String getNurseName() {
        return nurseName;
    }

    public void setNurseName(String nurseName) {
        this.nurseName = nurseName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Nurse nurse = (Nurse) o;

        if (nurseId != nurse.nurseId) return false;
        if (nurseName != null ? !nurseName.equals(nurse.nurseName) : nurse.nurseName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = nurseId;
        result = 31 * result + (nurseName != null ? nurseName.hashCode() : 0);
        return result;
    }
}
