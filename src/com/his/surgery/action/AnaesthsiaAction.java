package com.his.surgery.action;

import com.his.surgery.entity.Anaesthesia;
import com.his.surgery.entity.Doctor;
import com.his.surgery.entity.Surgery;
import com.his.surgery.service.IAnaesthesiaService;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.bind.v2.model.core.ID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 *
 */
@Controller("anaesthsiaAction")
@Scope(value = "prototype")
public class AnaesthsiaAction extends ActionSupport {

    @Autowired
    @Qualifier("anaesthesiaService")
    private IAnaesthesiaService anaesthesiaService;

    //手术id
    private int sid;
    //会诊意见
    private String consult;
    //麻醉方法
    private String method;
    //麻醉医生的id
    private int did;
    //麻醉id，保存修改用
    private int aid;

    //麻醉记录
    private String log;
    //麻醉备注
    private String remark;

    //返回的信息
    private boolean success;
    private String msg;

    /**
     * 新建麻醉
     * @return
     */
    public String add(){
        try {
            anaesthesiaService.add(sid, consult, method, did);
            success = true;
            msg = "新建麻醉成功！";
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
            msg = "新建麻醉失败！";
        }

        return SUCCESS;
    }

    public String update(){
        try {
            anaesthesiaService.update(aid, consult, method, did);
            success = true;
            msg = "修改麻醉成功！";
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
            msg = "修改麻醉失败！";
        }

        return SUCCESS;
    }

    public String log(){
        try {
            anaesthesiaService.setLog(aid,log,remark);
            success = true;
            msg = "麻醉记录成功!";
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
            msg = "麻醉记录失败!";
        }

        return SUCCESS;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getConsult() {
        return consult;
    }

    public void setConsult(String consult) {
        this.consult = consult;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
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

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getLog() {
        return log;
    }

    public void setLog(String log) {
        this.log = log;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
