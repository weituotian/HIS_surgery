package com.his.surgery.entity;

import javax.persistence.*;

/**
 * Created by ange on 2016/6/18.
 */
@Entity
@Table(name = "test2", schema = "his")
public class Test2 {
    private int id;
    private String str1;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "str1", nullable = true)
    public String getStr1() {
        return str1;
    }

    public void setStr1(String str1) {
        this.str1 = str1;
    }

    private Test1 test1;

    @OneToOne
    @JoinColumn(name = "fktest1", referencedColumnName = "id", nullable = true)
    public Test1 getTest1() {
        return test1;
    }

    public void setTest1(Test1 test1) {
        this.test1 = test1;
    }

}
