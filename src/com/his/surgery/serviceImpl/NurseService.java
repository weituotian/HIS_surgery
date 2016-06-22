package com.his.surgery.serviceImpl;

import com.his.surgery.dao.IDoctorDao;
import com.his.surgery.dao.INurseDao;
import com.his.surgery.entity.Doctor;
import com.his.surgery.entity.Nurse;
import com.his.surgery.service.IDoctorService;
import com.his.surgery.service.INurseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 */
@Service("nurseService")
@Transactional
public class NurseService implements INurseService {

    @Autowired
    @Qualifier("nurseDao")
    private INurseDao nurseDao;

    /**
     * 获取护士信息
     * @param id 护士id
     * @return 护士
     */
    @Override
    public Nurse getNurse(Integer id) {
        return nurseDao.findById(id);
    }
}
