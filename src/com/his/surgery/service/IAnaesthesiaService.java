package com.his.surgery.service;

import com.his.surgery.domain.Page;
import com.his.surgery.domain.PageRequest;
import com.his.surgery.entity.Anaesthesia;
import com.his.surgery.entity.Surgery;

/**
 *
 */
public interface IAnaesthesiaService {
    void save(Anaesthesia anaesthesia);

    Anaesthesia findById(Integer id);

    void update(int aid, String consult, String method, int did);

    void add(int sid, String consult, String method, int did);

    void setLog(int aid, String log, String remark);

    /**
     * 获得麻醉list，封装在page中
     * @param pageRequest 网页分页请求
     * @param state 麻醉状态，是否已经进行了记录
     * @return page
     */
    Page<Anaesthesia> getPageList(PageRequest pageRequest, int state);
}
