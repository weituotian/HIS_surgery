package com.his.surgery.action;

import com.his.surgery.service.ISurgeryService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * 处理手术安排
 */
@Controller("surgeryArrangeAction")
@Scope(value = "prototype")
public class SurgeryArrangeAction extends ActionSupport {

    @Autowired
    @Qualifier("surgeryService")
    private ISurgeryService surgeryService;

    //手术id
    private int sid;

    //医生数组
    private int[] dids;

    //护士数组
    private int[] nids;

    //手术室id
    private int room;

    //返回的消息
    private String msg;
    //返回是否成功
    private boolean success;

    /**
     * 更新安排
     * @return
     */
    public String arrange(){
        try {
            surgeryService.updateArrange(sid,dids,nids,room);
            success = true;
            msg = "修改安排成功！";
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
            msg = "修改安排失败！";
        }
        return SUCCESS;
    }

    /**
     * 取消安排
     * @return
     */
    public String cancelArrange(){
        try {
            surgeryService.cancelArrange(sid);
            success = true;
            msg = "取消安排成功！该手术安排失效，转到手术申请";
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
            msg = "取消安排错误！数据有错误！";
        }
        return SUCCESS;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int[] getDids() {
        return dids;
    }

    public void setDids(int[] dids) {
        this.dids = dids;
    }

    public int[] getNids() {
        return nids;
    }

    public void setNids(int[] nids) {
        this.nids = nids;
    }

    public int getRoom() {
        return room;
    }

    public void setRoom(int room) {
        this.room = room;
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
