package com.his.surgery.action;

import com.his.surgery.domain.Page;
import com.his.surgery.domain.PageRequest;
import com.his.surgery.entity.Doctor;
import com.his.surgery.entity.Patient;
import com.his.surgery.entity.Surgery;
import com.his.surgery.service.ISurgeryService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.sql.Timestamp;

/**
 * 处理手术申请和页面转发
 */
@Controller("surgeryAction")
@Scope(value = "prototype")
public class SurgeryAction extends ActionSupport {

    @Autowired
    @Qualifier("surgeryService")
    private ISurgeryService surgeryService;

    //手术
    private Surgery surgery;
    //手术id
    private int sid;
    //手术名称
    private String name;
    //疾病
    private String disease;
    //申请时间
    private Long time;
    //病人id
    private int pid;
    //医生id
    private int did;

    //返回信息
    private String msg;
    private boolean success;

    /**
     * 提交手术申请【json】
     *
     * @return
     */
    public String request() {
        Doctor doctor = new Doctor();
        doctor.setId(did);

        Patient patient = new Patient();
        patient.setId(pid);

        Surgery surgery = new Surgery();
        surgery.setName(name);
        surgery.setState(0);
        surgery.setDisease(disease);
        surgery.setApplyTime(new Timestamp(time));
        surgery.setDoctor(doctor);
        surgery.setPatient(patient);

        try {
            surgeryService.save(surgery);
            success = true;
            msg = "添加成功！";
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
            msg = "添加出错啦！";
        }
        return SUCCESS;
    }

    /**
     * 保存手术申请【json】
     *
     * @return
     */
    public String save() {
        Surgery surgery = surgeryService.findById(sid);

        Doctor doctor = new Doctor();
        doctor.setId(did);

        Patient patient = new Patient();
        patient.setId(pid);

        surgery.setName(name);
        //surgery.setState(0);
        surgery.setDisease(disease);
        surgery.setApplyTime(new Timestamp(time));
        surgery.setDoctor(doctor);
        surgery.setPatient(patient);

        try {
            surgeryService.update(surgery);
            success = true;
            msg = "保存成功！";
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
            msg = "保存出错啦！";
        }
        return SUCCESS;
    }

    /**
     * 废弃手术申请【json】
     *
     * @return
     */
    public String dispose() {
        try {
            surgeryService.dispose(sid);
            success = true;
            msg = "删除成功！";
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
            msg = "删除失败！";
        }
        return SUCCESS;
    }

    public Surgery getSurgery() {
        return surgery;
    }

    public void setSurgery(Surgery surgery) {
        this.surgery = surgery;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
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

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }
}
