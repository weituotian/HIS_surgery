package com.his.surgery.daoImpl;

import com.his.surgery.dao.ISurgeryDao;
import com.his.surgery.dao.Itest2Dao;
import com.his.surgery.entity.Surgery;
import com.his.surgery.entity.Test2;
import org.springframework.stereotype.Repository;

@Repository("test2Dao")
public class Test2Dao extends BaseDao<Test2, Integer> implements Itest2Dao {

}
