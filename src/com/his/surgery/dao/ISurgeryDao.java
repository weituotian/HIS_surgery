package com.his.surgery.dao;

import com.his.surgery.entity.Surgery;
import org.springframework.stereotype.Repository;

/**
 * Created by ange on 2016/6/16.
 */
public interface ISurgeryDao extends IBaseDao<Surgery,Integer> {
    Surgery hqlFindById(String hqlString,Integer id);
}
