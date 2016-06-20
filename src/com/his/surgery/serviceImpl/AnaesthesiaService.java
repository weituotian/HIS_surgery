package com.his.surgery.serviceImpl;

import com.his.surgery.dao.IAnaesthesiaDao;
import com.his.surgery.entity.Anaesthesia;
import com.his.surgery.service.IAnaesthesiaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by ange on 2016/6/16.
 */
@Service("anaesthesiaService")
public class AnaesthesiaService implements IAnaesthesiaService {
    /**
     * @Filed anaesthesiaDao : 自动注入IAnaesthesiaDao接口的实现类
     */
    @Autowired(required = true)
    @Qualifier("anaesthesiaDao")
    private IAnaesthesiaDao anaesthesiaDao;

    @Override
    @Transactional  //使用声明式事务
    public void save(Anaesthesia anaesthesia) {
        anaesthesiaDao.save(anaesthesia);
    }

    @Override
    @Transactional
    public Anaesthesia findById(Integer id) {
        Anaesthesia anaesthesia = anaesthesiaDao.findById(id);
        anaesthesia.setConsultation("意见是surgery");
        anaesthesia.getSur().setName("我不是超人啦！");
        return anaesthesia;
    }
}
