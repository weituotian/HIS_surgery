package com.his.surgery.daoImpl;

import com.his.surgery.dao.INurseDao;
import com.his.surgery.dao.IRoomDao;
import com.his.surgery.entity.Nurse;
import com.his.surgery.entity.Operationroom;
import org.springframework.stereotype.Repository;

/**
 *
 */
@Repository("roomDao")
public class RoomDao extends BaseDao<Operationroom,Integer> implements IRoomDao {
}
