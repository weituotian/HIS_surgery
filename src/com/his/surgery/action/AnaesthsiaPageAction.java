package com.his.surgery.action;

import com.his.surgery.domain.Page;
import com.his.surgery.domain.PageRequest;
import com.his.surgery.entity.Anaesthesia;
import com.his.surgery.entity.Surgery;
import com.his.surgery.service.IAnaesthesiaService;
import com.his.surgery.service.ISurgeryService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * 转发麻醉页面
 */
@Controller("anaesthsiaPageAction")
@Scope(value = "prototype")
public class AnaesthsiaPageAction extends ActionSupport {

    @Autowired
    @Qualifier("anaesthesiaService")
    private IAnaesthesiaService anaesthesiaService;

    @Autowired
    @Qualifier("surgeryService")
    private ISurgeryService surgeryService;
    //请求类型
    private String type;

    //返回的麻醉
    private Anaesthesia anaesthesia;
    //返回的手术
    private Surgery surgery;

    //传过来的手术id
    private int sid;

    //错误消息提示
    private String errormsg;

    //分页请求
    private int page;
    private int size;

    //指定麻醉状态，0代表申请中，1代表已经记录
    private int state;

    //返回的分页，装有list
    private Page<Anaesthesia> mypage;

    /**
     * 分页显示麻醉list
     *
     * @return
     */
    public String list() {
        PageRequest pageRequest = new PageRequest(page, size);
        mypage = anaesthesiaService.getPageList(pageRequest, state);
        return SUCCESS;
    }

    /**
     * 转发
     *
     * @return
     */
    public String dispatch() {
        surgery = surgeryService.findById(sid);
        Anaesthesia anaesthesia = surgery.getAna();
        switch (type) {
            case "view":
                //查看麻醉
                return "pageview";
            case "add":
                //兼顾了新增和修改
                return "pageadd";
            case "log":
                //麻醉申请转为麻醉记录
                if (anaesthesia == null) {
                    //麻醉申请都没有
                    errormsg = "有麻醉申请才能有麻醉记录";
                    return "errorpage";
                }
                return "pagelog";
            default:
                break;
        }
        errormsg = "到了无人的地方！";
        return "errorpage";
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Anaesthesia getAnaesthesia() {
        return anaesthesia;
    }

    public void setAnaesthesia(Anaesthesia anaesthesia) {
        this.anaesthesia = anaesthesia;
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

    public String getErrormsg() {
        return errormsg;
    }

    public void setErrormsg(String errormsg) {
        this.errormsg = errormsg;
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

    public Page<Anaesthesia> getMypage() {
        return mypage;
    }

    public void setMypage(Page<Anaesthesia> mypage) {
        this.mypage = mypage;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}
