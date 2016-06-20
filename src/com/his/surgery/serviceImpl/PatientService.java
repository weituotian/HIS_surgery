package com.his.surgery.serviceImpl;

import com.his.surgery.dao.IPatientDao;
import com.his.surgery.entity.Patient;
import com.his.surgery.service.IPatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by ange on 2016/6/18.
 */
@Service("patientService")
public class PatientService implements IPatientService {

    @Autowired
    @Qualifier("patientDao")
    private IPatientDao patientDao;

    @Override
    @Transactional
    public Patient getPatient(Integer id) {
        return patientDao.findById(id);
    }
}
