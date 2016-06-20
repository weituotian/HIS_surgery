package com.his.surgery.action;

import com.his.surgery.entity.Nurse;
import com.his.surgery.entity.Operationroom;
import com.his.surgery.service.INurseService;
import com.his.surgery.service.IRoomService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 *
 */
@Controller("roomAction")
@Scope(value = "prototype")
public class RoomAction extends ActionSupport {

    @Autowired
    @Qualifier("roomService")
    private IRoomService roomService;

    //传来的参数，指定医生的工号
    private Integer id;
    //返回的消息
    private String msg;
    //返回是否成功
    private boolean success;

    private List<Operationroom> list;

    public String getlist(){
        list = roomService.getlist();
        return SUCCESS;
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

    public List<Operationroom> getList() {
        return list;
    }

    public void setList(List<Operationroom> list) {
        this.list = list;
    }
}
