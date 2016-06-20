package com.his.surgery.action;

import com.his.surgery.entity.Patient;
import com.his.surgery.service.IPatientService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * 病人的action
 */
@Controller("patientAction")
@Scope(value = "prototype")
public class PatientAction extends ActionSupport {

    @Autowired
    @Qualifier("patientService")
    private IPatientService patientService;

    //返回的病人
    private Patient patient;
    //网页传过来的病人id
    private Integer id;
    //返回的消息
    private String msg;
    //是否成功
    private boolean success;

    public String getdetail(){
        patient = patientService.getPatient(id);
        if (patient != null) {
            success = true;
            msg = "病人信息获取成功！";
        }else {
            success = false;
            msg = "没有该病人的信息，请重新输入编号！";
        }
        return SUCCESS;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Patient getPatient() {
        return patient;
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
