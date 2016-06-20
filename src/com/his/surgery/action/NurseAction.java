package com.his.surgery.action;

import com.his.surgery.entity.Doctor;
import com.his.surgery.entity.Nurse;
import com.his.surgery.service.IDoctorService;
import com.his.surgery.service.INurseService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 *
 */
@Controller("nurseAction")
@Scope(value = "prototype")
public class NurseAction extends ActionSupport {

    @Autowired
    @Qualifier("nurseService")
    private INurseService nurseService;

    //返回的医生
    private Nurse nurse;
    //传来的参数，指定医生的工号
    private Integer id;
    //返回的消息
    private String msg;
    //返回是否成功
    private boolean success;

    public String getdetail(){
        nurse = nurseService.getNurse(id);
        if (nurse != null) {
            success = true;
            msg = "护士信息获取成功！";
        }else {
            success = false;
            msg = "没有该护士的信息，请重新输入工号！";
        }
        return SUCCESS;
    }

    public Nurse getNurse() {
        return nurse;
    }

    public void setNurse(Nurse nurse) {
        this.nurse = nurse;
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
