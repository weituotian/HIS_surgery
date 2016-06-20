package com.his.surgery.service;

import com.his.surgery.entity.Nurse;
import com.his.surgery.entity.Operationroom;

import java.util.List;

/**
 *
 */
public interface IRoomService {

    Operationroom getRoom(Integer id);

    List<Operationroom> getlist();
}
