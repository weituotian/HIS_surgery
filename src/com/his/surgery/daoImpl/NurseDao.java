package com.his.surgery.daoImpl;

import com.his.surgery.dao.IDoctorDao;
import com.his.surgery.dao.INurseDao;
import com.his.surgery.entity.Doctor;
import com.his.surgery.entity.Nurse;
import org.springframework.stereotype.Repository;

/**
 *
 */
@Repository("nurseDao")
public class NurseDao extends BaseDao<Nurse,Integer> implements INurseDao {
}
