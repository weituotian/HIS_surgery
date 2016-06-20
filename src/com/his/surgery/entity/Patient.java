package com.his.surgery.entity;

import org.apache.struts2.json.annotations.JSON;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.xml.stream.events.Comment;
import java.util.Date;

/**
 * 病人
 */
@Entity
public class Patient {
    private int id;
    private String name;
    private String phone;
    private String email;
    private Date birthday;
    private Byte sex;
    private String address;
    private Integer age;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 8)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "phone", nullable = true, length = 11)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "email", nullable = true, length = 20)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "birthday", nullable = true)
    @JSON(format="yyyy-MM-dd HH:mm:ss")
    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @Basic
    @Column(name = "sex", nullable = true)
    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    @Basic
    @Column(name = "age",nullable = true,columnDefinition ="" )
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Basic
    @Column(name = "address", nullable = true, length = 40)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Patient patient = (Patient) o;

        if (id != patient.id) return false;
        if (name != null ? !name.equals(patient.name) : patient.name != null) return false;
        if (phone != null ? !phone.equals(patient.phone) : patient.phone != null) return false;
        if (email != null ? !email.equals(patient.email) : patient.email != null) return false;
        if (birthday != null ? !birthday.equals(patient.birthday) : patient.birthday != null) return false;
        if (sex != null ? !sex.equals(patient.sex) : patient.sex != null) return false;
        if (address != null ? !address.equals(patient.address) : patient.address != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (birthday != null ? birthday.hashCode() : 0);
        result = 31 * result + (sex != null ? sex.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        return result;
    }
}
