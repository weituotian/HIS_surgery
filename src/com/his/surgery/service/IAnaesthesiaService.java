package com.his.surgery.service;

import com.his.surgery.entity.Anaesthesia;

/**
 * Created by ange on 2016/6/16.
 */
public interface IAnaesthesiaService {
    void save(Anaesthesia anaesthesia);

    Anaesthesia findById(Integer id);
}
