package com.his.surgery.daoImpl;

import com.his.surgery.dao.ISurgeryDao;
import com.his.surgery.dao.Itest1Dao;
import com.his.surgery.entity.Surgery;
import com.his.surgery.entity.Test1;
import org.springframework.stereotype.Repository;

@Repository("test1Dao")
public class Test1Dao extends BaseDao<Test1, Integer> implements Itest1Dao {

}
