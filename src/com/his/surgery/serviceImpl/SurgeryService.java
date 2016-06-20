package com.his.surgery.serviceImpl;

import com.his.surgery.dao.ISurgeryDao;
import com.his.surgery.domain.Page;
import com.his.surgery.domain.PageRequest;
import com.his.surgery.entity.Anaesthesia;
import com.his.surgery.entity.Surgery;
import com.his.surgery.service.ISurgeryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ange on 2016/6/16.
 */
@Service("surgeryService")
@Transactional
public class SurgeryService implements ISurgeryService {
    /**
     * @Filed anaesthesiaDao : 自动注入IAnaesthesiaDao接口的实现类
     */
    @Autowired(required = true)
    @Qualifier("surgeryDao")
    private ISurgeryDao surgeryDao;

    @Override
    public void save(Surgery surgery) {
        surgeryDao.save(surgery);
    }

    @Override
    public Surgery findById(Integer id) {
        //a是持久化对象，对a的操作，在本函数，也就是本事务结束之后，a的变化会存到数据库中
        //这是也不需要手动调用save方法
        return surgeryDao.findById(id);
    }

    @Override
    public void update(Surgery surgery){
        surgeryDao.update(surgery);
    }

    /**
     * 获得申请中的手术list
     */
    @Override
    public Page<Surgery> getPageList(PageRequest pageRequest) {
        List<Surgery> list = surgeryDao.findListByHQL("from Surgery where state=?", 0);
        List<Surgery> newlist = new ArrayList<Surgery>();

        Page<Surgery> mypage = new Page<Surgery>(pageRequest);
        mypage.setTotalItems(list.size());
        //i是起始位置，j代表循环PageSize次
        for (int i = mypage.getOffset(), j = 0; j < mypage.getPageSize(); i++, j++) {
            if (i >= list.size()) {
                break;
            }
            newlist.add(list.get(i));
        }

        mypage.setResult(newlist);

        return mypage;
    }

    /**
     * 废弃手术申请
     * @param id 手术id
     */
    @Override
    public void dispose(Integer id) {
        Surgery surgery = surgeryDao.findById(id);
        surgeryDao.delete(surgery);
    }
}
