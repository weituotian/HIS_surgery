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
     * 添加
     * @param surgery
     */
    void save(Surgery surgery);

    /**
     * 寻找
     * @param id 编号
     * @return
     */
    Surgery findById(Integer id);

    /**
     * 更新
     * @param surgery
     */
    void update(Surgery surgery);

    /**
     * 获取已经分页的page list
     * @param pageRequest
     * @return
     */
    Page<Surgery> getPageList(PageRequest pageRequest);

    void dispose(Integer id);
}
