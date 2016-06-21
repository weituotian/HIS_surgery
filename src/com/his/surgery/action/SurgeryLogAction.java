package com.his.surgery.action;

import com.his.surgery.service.ISurgeryLogService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 *
 */
@Controller("surgeryLogAction")
@Scope(value = "prototype")
public class SurgeryLogAction extends ActionSupport {

    @Autowired
    @Qualifier("surgeryLogService")
    private ISurgeryLogService surgeryLogService;

    //手术id
    private int sid;
    //备注
    private String remark;
    //术前诊断
    private String firstConsult;
    //术后诊断
    private String endConsult;
    //手术过程
    private String process;

    //返回的消息
    private boolean success;
    private String msg;

    public String savelog(){
        try {
            surgeryLogService.save(sid, remark, firstConsult, endConsult, process);
            success = true;
            msg = "手术记录成功";
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
            msg = "手术记录失败了！";
        }
        return SUCCESS;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getFirstConsult() {
        return firstConsult;
    }

    public void setFirstConsult(String firstConsult) {
        this.firstConsult = firstConsult;
    }

    public String getEndConsult() {
        return endConsult;
    }

    public void setEndConsult(String endConsult) {
        this.endConsult = endConsult;
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
