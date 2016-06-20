package com.his.surgery.daoImpl;

import com.his.surgery.dao.IAnaesthesiaDao;
import com.his.surgery.entity.Anaesthesia;
import org.springframework.stereotype.Repository;

@Repository("anaesthesiaDao")
public class AnaesthesiaDao extends BaseDao<Anaesthesia, Integer> implements IAnaesthesiaDao{

}
