package com.his.surgery.service;

import com.his.surgery.domain.Page;
import com.his.surgery.domain.PageRequest;
import com.his.surgery.entity.Surgery;

import java.util.List;

/**
 * Created by ange on 2016/6/16.
 */
public interface ISurgeryService {
    /**
     * 添加手术
     * @param surgery
     */
    void save(Surgery surgery);

    /**
     * 寻找手术
     * @param id 编号
     * @return
     */
    Surgery findById(Integer id);

    Surgery eagerFindById(Integer id);

    /**
     * 更新手术
     * @param surgery
     */
    void update(Surgery surgery);

    /**
     * 获取已经分页的page list
     * @param pageRequest
     * @return
     */
    Page<Surgery> getPageList(PageRequest pageRequest);

    /**
     * 删除手术申请
     * @param id
     */
    void dispose(Integer id);

    void updateArrange(int id, int[] doctor_ids,int[] nurse_ids,int room);
}
