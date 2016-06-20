package com.his.surgery.serviceImpl;

import com.his.surgery.dao.*;
import com.his.surgery.entity.Surgery;
import com.his.surgery.service.ISurgeryLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by ange on 2016/6/17.
 */
@Service("surgeryLogService")
public class SurgeryLogService implements ISurgeryLogService {

    @Autowired
    @Qualifier("surgeryLogDao")
    private ISurgeryLogDao surgeryLogDao;

    @Autowired
    @Qualifier("surgeryDao")
    private ISurgeryDao surgeryDao;

    @Autowired
    @Qualifier("anaesthesiaDao")
    private IAnaesthesiaDao anaesthesiaDao;

    @Autowired
    @Qualifier("test1Dao")
    private Itest1Dao test1Dao;

    @Autowired
    @Qualifier("test2Dao")
    private Itest2Dao test2Dao;

    @Override
    @Transactional
    public Surgery show() {
        Surgery surgery = surgeryDao.findById(2);
        //surgery = surgeryDao.findByHQL("from Surgery where code=?", 2);
        surgery.getName();
        return surgery;
    }

    @Override
    @Transactional
    public void test() {
//        SurgeryLog surgeryLog = surgeryLogDao.findById(1);
//        surgeryLog.getSurgery().setName("从server log来的更改");
//        surgeryLog.getSurgery().getAna().setConsultation("从server log来的更改！");
//
//        surgeryLog.setLog("还有没有超人啊？");

//        SurgeryLog surgeryLog1 = new SurgeryLog();
//        surgeryLog1.setLog("我是一个新的log2");
//        surgeryLog1.setCode(surgeryDao.findById(1).getCode());
//        surgeryLogDao.save(surgeryLog1);//新建

//        Surgery surgery = new Surgery();
//        surgery.setCode(2);
//        surgery.setName("新建测试");
//        surgery.setState(1);
        //surgeryDao.save(surgery);

//        Anaesthesia anaesthesia = new Anaesthesia();
//        anaesthesia.setCode(1);
//        anaesthesia.setConsultation("新建的咨询");
        //anaesthesia.setSur(surgery);

        //anaesthesiaDao.save(anaesthesia);

//        Anaesthesia anaesthesia = anaesthesiaDao.findById(1);
//        anaesthesia.getSur().setName("联动修改？》22");

        Surgery surgery = surgeryDao.findById(2);
        //surgeryDao.delete(surgery);
        //surgery.getAna().setConsultation("又是联动修改44！");
        //surgery.setAna(anaesthesia);

//        Anaesthesia anaesthesia = anaesthesiaDao.findById(1);
//        anaesthesia.setSur(surgery);


//        Test1 test1 = new Test1();
//        test1.setId(1);
//        test1.setStr1("test1");
//        test1Dao.save(test1);
//        Test2 test2 = new Test2();
//        test2.setId(1);
//        test2.setStr1("123a");
//        test2Dao.save(test2);

        //       Test2 test2 = test2Dao.findById(1);
        //test2.getTest1().setStr1("v4:i am from test2!");
//        test2.setTest1(test1);


//        surgeryDao.delete(surgery);//联动删除了
        //surgery.getLog().setLog("log被联动修改22");
    }
}
