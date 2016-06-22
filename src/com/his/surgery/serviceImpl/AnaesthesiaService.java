package com.his.surgery.serviceImpl;

import com.his.surgery.dao.IAnaesthesiaDao;
import com.his.surgery.domain.Page;
import com.his.surgery.domain.PageRequest;
import com.his.surgery.entity.Anaesthesia;
import com.his.surgery.entity.Doctor;
import com.his.surgery.entity.Surgery;
import com.his.surgery.service.IAnaesthesiaService;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.Annotated;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 *
 */
@Service("anaesthesiaService")
@Transactional
public class AnaesthesiaService implements IAnaesthesiaService {

    /**
     * @Filed anaesthesiaDao : 自动注入IAnaesthesiaDao接口的实现类
     */
    @Autowired(required = true)
    @Qualifier("anaesthesiaDao")
    private IAnaesthesiaDao anaesthesiaDao;

    @Override
    public void save(Anaesthesia anaesthesia) {
        anaesthesiaDao.save(anaesthesia);
    }

    @Override
    public Anaesthesia findById(Integer id) {
        return anaesthesiaDao.findById(id);
    }

    /**
     * 更新一个麻醉
     * @param aid
     * @param consult
     * @param method
     * @param did
     */
    @Override
    public void update(int aid, String consult, String method, int did) {
        Doctor doctor = new Doctor();
        doctor.setId(did);

        Anaesthesia anaesthesia = anaesthesiaDao.findById(aid);
        anaesthesia.setConsultation(consult);
        anaesthesia.setMethod(method);
        anaesthesia.setDoctor(doctor);
    }

    @Override
    public void add(int sid, String consult, String method, int did){
        //手术
        Surgery surgery = new Surgery();
        surgery.setCode(sid);

        Doctor doctor = new Doctor();
        doctor.setId(did);

        //新建麻醉
        Anaesthesia anaesthesia = new Anaesthesia();
        //设置属性
        anaesthesia.setConsultation(consult);
        anaesthesia.setMethod(method);
        anaesthesia.setDoctor(doctor);
        anaesthesia.setSur(surgery);
        //0表示正在申请状态
        anaesthesia.setState(0);

        //保存
        anaesthesiaDao.save(anaesthesia);
    }

    @Override
    public void setLog(int aid, String log, String remark) {
        Anaesthesia anaesthesia = anaesthesiaDao.findById(aid);
        anaesthesia.setLog(log);
        anaesthesia.setRemark(remark);
        //设置为已经进行了麻醉记录
        anaesthesia.setState(1);
    }

    /**
     * 获得麻醉list，封装在page中
     *
     * @param pageRequest 网页分页请求
     * @param state       麻醉状态，是否已经进行了记录
     * @return page
     */
    @Override
    public Page<Anaesthesia> getPageList(PageRequest pageRequest, int state) {
        List<Anaesthesia> list = anaesthesiaDao.findListByHQL("from Anaesthesia where state=?", state);
        List<Anaesthesia> newlist = new ArrayList<Anaesthesia>();

        Page<Anaesthesia> mypage = new Page<Anaesthesia>(pageRequest);
        mypage.setTotalItems(list.size());
        //i是起始位置，j代表循环PageSize次
        for (int i = mypage.getOffset(), j = 0; j < mypage.getPageSize(); i++, j++) {
            if (i >= list.size()) {
                break;
            }
            Anaesthesia each = list.get(i);
            //解决懒加载问题
            each.getDoctor().getName();
            newlist.add(each);
        }

        mypage.setResult(newlist);

        return mypage;
    }
}
