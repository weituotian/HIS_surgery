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
     *
     * @param surgery
     */
    Surgery save(Surgery surgery);

    /**
     * 寻找手术
     *
     * @param id 编号
     * @return
     */
    Surgery findById(Integer id);

    Surgery eagerFindById(Integer id);

    /**
     * 更新手术
     *
     * @param surgery
     */
    void update(Surgery surgery);

    /**
     * 获取已经分页的page list
     * 需要指定手术状态
     * @param pageRequest 页面请求
     * @param state       手术状态
     * @return
     */
    Page<Surgery> getPageList(PageRequest pageRequest, int state);

    /**
     * 删除手术申请
     *
     * @param id
     */
    void dispose(Integer id);

    /**
     * 更新手术安排
     *
     * @param id         手术id
     * @param doctor_ids 医生数组
     * @param nurse_ids  护士数组
     * @param room       房间号
     */
    void updateArrange(int id, int[] doctor_ids, int[] nurse_ids, int room);

    /**
     * 取消手术安排
     *
     * @param id 手术id
     */
    void cancelArrange(int id);
}
