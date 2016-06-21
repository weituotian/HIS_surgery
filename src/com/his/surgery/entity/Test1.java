package com.his.surgery.entity;

import javax.persistence.*;

/**
 * Created by ange on 2016/6/18.
 */
@Entity
@Table(name = "test1", schema = "his")
public class Test1 {
    private int id;
    private String str1;
    private Test2 test2;

    @Id
    @Column(name = "id" )
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "str1",nullable = true)
    public String getStr1() {
        return str1;
    }

    public void setStr1(String str1) {
        this.str1 = str1;
    }

    @OneToOne(mappedBy = "test1")
    public Test2 getTest2() {
        return test2;
    }

    public void setTest2(Test2 test2) {
        this.test2 = test2;
    }
}
