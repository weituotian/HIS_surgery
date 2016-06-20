package com.his.surgery.action;

import com.his.surgery.entity.Anaesthesia;
import com.his.surgery.entity.Surgery;
import com.his.surgery.service.IAnaesthesiaService;
import com.his.surgery.service.ISurgeryLogService;
import com.his.surgery.service.ISurgeryService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("testAction")
@Scope(value = "prototype")
public class testAction extends ActionSupport {

    @Autowired(required = true)
    @Qualifier("anaesthesiaService")
    private IAnaesthesiaService anaesthesiaService;

    @Autowired(required = true)
    @Qualifier("surgeryService")
    private ISurgeryService surgeryService;

    @Autowired(required = true)
    @Qualifier("surgeryLogService")
    private ISurgeryLogService surgeryLogService;

   private Surgery surgery;

    public String test2(){
        surgery = surgeryLogService.show();
        return SUCCESS;
    }

    public String test1() {
        //测试添加
//        Surgery surgery = new Surgery();
//        surgery.setCode(1);
//        surgery.setName("手术1");
//        surgery.setState(1);
        //surgeryService.save(surgery);

//        Anaesthesia anaesthesia = new Anaesthesia();
//        anaesthesia.setCode(1);
//        anaesthesia.setSurgery(surgeryService.findById(1));
//        anaesthesia.setConsultation("这次麻醉非常地好！");
        //anaesthesiaService.save(anaesthesia);

        //Anaesthesia anaesthesia= anaesthesiaService.findById(1);
        //Surgery surgery = surgeryService.findById(1);

        surgeryLogService.show();
        return SUCCESS;
    }

    public Surgery getSurgery() {
        return surgery;
    }

    public void setSurgery(Surgery surgery) {
        this.surgery = surgery;
    }
}
