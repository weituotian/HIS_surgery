package com.his.surgery.action;

import com.his.surgery.entity.Doctor;
import com.his.surgery.service.IDoctorService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created by ange on 2016/6/18.
 */
@Controller("doctorAction")
@Scope(value = "prototype")
public class DoctorAction extends ActionSupport {

    @Autowired
    @Qualifier("doctorService")
    private IDoctorService doctorService;

    //返回的医生
    private Doctor doctor;
    //传来的参数，指定医生的工号
    private Integer id;
    //返回的消息
    private String msg;
    //返回是否成功
    private boolean success;

    public String getdetail(){
        doctor = doctorService.getDoctor(id);
        if (doctor != null) {
            success = true;
            msg = "医生信息获取成功！";
        }else {
            success = false;
            msg = "没有该医生的信息，请重新输入工号！";
        }
        return SUCCESS;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }
}
