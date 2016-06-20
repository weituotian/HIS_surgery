package com.his.surgery.serviceImpl;

import com.his.surgery.dao.IDoctorDao;
import com.his.surgery.entity.Doctor;
import com.his.surgery.service.IDoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by ange on 2016/6/18.
 */
@Service("doctorService")
public class DoctorService implements IDoctorService {

    @Autowired
    @Qualifier("doctorDao")
    private IDoctorDao doctorDao;

    @Override
    @Transactional
    public Doctor getDoctor(Integer id) {
        return doctorDao.findById(id);
    }
}
