package com.his.surgery.action;

import com.his.surgery.domain.Page;
import com.his.surgery.domain.PageRequest;
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

    //分页请求
    private int page;
    private int size;

    //返回的分页，装有list
    private Page<Surgery> mypage;

    //指定手术状态
    private int state;

    /**
     * 页面分发
     *
     * @return
     */
    public String dispatch() {

        //如果没有指定type和type是add，直接跳到page
        if (type == null || type.equals("add")) {
            return "page";
        }

        //默认返回add
        String flag = "add";

        switch (type) {

            case "update": //手术申请更新
                surgery = surgeryService.findById(sid);
                flag = "page";
                break;

            case "view": //手术申请预览
                surgery = surgeryService.findById(sid);
                flag = "page";
                break;

            case "arrange"://手术安排
                surgery = surgeryService.eagerFindById(sid);
                roomlist = roomService.getlist();
                if (surgery.getState()<=1) {//做了手术记录的不能再做手术安排
                    flag = "page2";
                }else {
                    flag = "errorpage";
                }
                break;

            case "log"://手术记录
                surgery = surgeryService.eagerFindById(sid);
                roomlist = roomService.getlist();
                flag = "log";
                break;

            default:
                //type不符合任何一个操作类型，返回错误页面
                flag = "errorpage";
        }

        //检查有没有该手术，没有就跳到错误页面
        if (surgery == null) {
            return "errorpage";
        }

        return flag;
    }

    /**
     * 分页显示手术申请list
     *
     * @return
     */
    public String list() {
        //
        PageRequest pageRequest = new PageRequest(page, size);
        mypage = surgeryService.getPageList(pageRequest, state);
        return SUCCESS;
    }

    /**
     * 分页显示手术安排list
     *
     * @return
     */
    public String listA() {
        PageRequest pageRequest = new PageRequest(page, size);
        mypage = surgeryService.getPageList(pageRequest, 1);
        return SUCCESS;
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

    public Page<Surgery> getMypage() {
        return mypage;
    }

    public void setMypage(Page<Surgery> mypage) {
        this.mypage = mypage;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}
