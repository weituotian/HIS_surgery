package com.his.surgery.serviceImpl;

import com.his.surgery.dao.IRoomDao;
import com.his.surgery.entity.Operationroom;
import com.his.surgery.service.IRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *
 */
@Service("roomService")
@Transactional
public class RoomService implements IRoomService {

    @Autowired
    @Qualifier("roomDao")
    private IRoomDao roomDao;

    @Override
    public Operationroom getRoom(Integer id) {
        return roomDao.findById(id);
    }

    @Override
    public List<Operationroom> getlist() {
        return roomDao.findListByHQL("from Operationroom where 1");
    }
}
