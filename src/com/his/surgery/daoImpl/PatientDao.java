package com.his.surgery.daoImpl;

import com.his.surgery.dao.IPatientDao;
import com.his.surgery.entity.Patient;
import org.springframework.stereotype.Repository;

/**
 * Created by ange on 2016/6/18.
 */
@Repository("patientDao")
public class PatientDao extends BaseDao<Patient,Integer> implements IPatientDao {
}
