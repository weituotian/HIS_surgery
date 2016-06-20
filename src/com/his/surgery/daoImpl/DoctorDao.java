package com.his.surgery.daoImpl;

import com.his.surgery.dao.IDoctorDao;
import com.his.surgery.entity.Doctor;
import org.springframework.stereotype.Repository;

/**
 * Created by ange on 2016/6/18.
 */
@Repository("doctorDao")
public class DoctorDao extends BaseDao<Doctor,Integer> implements IDoctorDao {
}
