package com.his.surgery.daoImpl;

import com.his.surgery.dao.ISurgeryLogDao;
import com.his.surgery.entity.SurgeryLog;
import org.springframework.stereotype.Repository;

/**
 * Created by ange on 2016/6/17.
 */
@Repository("surgeryLogDao")
public class SurgeryLogDao extends BaseDao<SurgeryLog,Integer> implements ISurgeryLogDao {
    @Override
    public void test() {

    }
}
