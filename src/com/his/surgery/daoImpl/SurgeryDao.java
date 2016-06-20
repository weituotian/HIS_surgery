package com.his.surgery.daoImpl;

import com.his.surgery.dao.ISurgeryDao;
import com.his.surgery.entity.Surgery;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

@Repository("surgeryDao")
public class SurgeryDao extends BaseDao<Surgery, Integer> implements ISurgeryDao {
    @Override
    public Surgery hqlFindById(String hqlString, Integer id) {
        Query query = this.getSession().createQuery(hqlString);
        query.setParameter(0, id);
        return (Surgery) query.uniqueResult();
    }
}
