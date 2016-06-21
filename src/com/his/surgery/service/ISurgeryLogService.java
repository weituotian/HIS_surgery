package com.his.surgery.service;

/**
 *
 */
public interface ISurgeryLogService {
    void save(int sid, String remark,String firstConsult,String endConsult,String process);
}
