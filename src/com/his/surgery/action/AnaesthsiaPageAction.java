package com.his.surgery.action;

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

    /**
     * 转发
     * @return
     */
    public String dispatch() {
        switch (type) {
            case "add":
                surgery = surgeryService.findById(sid);
                return "pageadd";
            default:

                break;
        }
        return "error";
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
}
