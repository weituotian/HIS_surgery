package com.his.surgery.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

/**
 * 手术
 */
@Entity
public class Surgery {
    private int code;
    private String name;
    private String disease;
    private Date applyTime;
    private Integer state;
    private String description;
    private String notation;
    private Anaesthesia ana;
    private Doctor doctor;
    private Patient patient;
    private Set<Doctor> assists;
    private Set<Nurse> nurses;
    private Operationroom room;

    @Id
    @Column(name = "code", nullable = false)
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    @Basic
    @Column(name = "name", nullable = true, length = 20)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "disease", nullable = true, length = 100)
    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

    @Basic
    @Column(name = "apply_time", nullable = true)
    public Date getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    @Basic
    @Column(name = "state", nullable = true)
    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Basic
    @Column(name = "description", nullable = true, length = 200)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "notation", nullable = true, length = 20)
    public String getNotation() {
        return notation;
    }

    public void setNotation(String notation) {
        this.notation = notation;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Surgery surgery = (Surgery) o;

        if (code != surgery.code) return false;
        if (name != null ? !name.equals(surgery.name) : surgery.name != null) return false;
        if (disease != null ? !disease.equals(surgery.disease) : surgery.disease != null) return false;
        if (applyTime != null ? !applyTime.equals(surgery.applyTime) : surgery.applyTime != null) return false;
        if (state != null ? !state.equals(surgery.state) : surgery.state != null) return false;
        if (description != null ? !description.equals(surgery.description) : surgery.description != null) return false;
        if (notation != null ? !notation.equals(surgery.notation) : surgery.notation != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = code;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (disease != null ? disease.hashCode() : 0);
        result = 31 * result + (applyTime != null ? applyTime.hashCode() : 0);
        result = 31 * result + (state != null ? state.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (notation != null ? notation.hashCode() : 0);
        return result;
    }

    @OneToOne(mappedBy = "sur", cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    public Anaesthesia getAna() {
        return ana;
    }

    public void setAna(Anaesthesia ana) {
        this.ana = ana;
    }

    @ManyToOne(fetch = FetchType.LAZY,targetEntity = Doctor.class,optional = false)
    @JoinColumn(name = "doctor_id", foreignKey = @ForeignKey(name = "FK_macin_actor"))
    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    @ManyToOne
    @JoinColumn(name = "patient_id", nullable = false, foreignKey = @ForeignKey(name = "FK_having_surgery"))
    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    @ManyToMany
    @JoinTable(name = "surgery_assistants", schema = "his",
            joinColumns = @JoinColumn(name = "code", referencedColumnName = "code", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "doctor_id", referencedColumnName = "id", nullable = false))
    public Set<Doctor> getAssists() {
        return assists;
    }

    public void setAssists(Set<Doctor> assists) {
        this.assists = assists;
    }

    @ManyToMany
    @JoinTable(name = "surgery_nurse", schema = "his",
            joinColumns = @JoinColumn(name = "code", referencedColumnName = "code", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "nurse_id", referencedColumnName = "nurse_id", nullable = false))
    public Set<Nurse> getNurses() {
        return nurses;
    }

    public void setNurses(Set<Nurse> nurses) {
        this.nurses = nurses;
    }

    @OneToOne
    @JoinColumn(name = "num", referencedColumnName = "num", foreignKey = @ForeignKey(name = "FK_have_room"))
    public Operationroom getRoom() {
        return room;
    }

    public void setRoom(Operationroom room) {
        this.room = room;
    }
}
