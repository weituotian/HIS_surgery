package com.his.surgery.action;

import com.his.surgery.entity.Operationroom;
import com.his.surgery.entity.Surgery;
import com.his.surgery.service.IRoomService;
import com.his.surgery.service.ISurgeryService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * Created by ange on 2016/6/20.
 */
@Controller("surgeryPageAction")
@Scope(value = "prototype")
public class SurgeryPageAction extends ActionSupport {

    @Autowired
    @Qualifier("surgeryService")
    //手术服务
    private ISurgeryService surgeryService;

    @Autowired
    @Qualifier("roomService")
    //手术室服务
    private IRoomService roomService;

    //返回的手术
    private Surgery surgery;
    //房间列表
    private List<Operationroom> roomlist;

    //手术id
    private int sid;

    //请求的页面类型，新建还是修改还是查看,安排
    private String type;

    /**
     * 页面分发
     *
     * @return
     */
    public String dispatch() {
        switch (type) {
            //手术申请
            case "add":
                return "page";
            //手术申请修改
            case "update":
                surgery = surgeryService.findById(sid);
                return "page";
            //手术申请预览
            case "view":
                surgery = surgeryService.findById(sid);
                return "page";
            case "arrange":
                surgery = surgeryService.eagerFindById(sid);
                roomlist = roomService.getlist();
                return "page2";
            default:
                //错误页面
                return "errorpage";
        }
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Surgery getSurgery() {
        return surgery;
    }

    public void setSurgery(Surgery surgery) {
        this.surgery = surgery;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public List<Operationroom> getRoomlist() {
        return roomlist;
    }

    public void setRoomlist(List<Operationroom> roomlist) {
        this.roomlist = roomlist;
    }

}
