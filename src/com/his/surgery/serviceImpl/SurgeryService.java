package com.his.surgery.serviceImpl;

import com.his.surgery.dao.ISurgeryDao;
import com.his.surgery.domain.Page;
import com.his.surgery.domain.PageRequest;
import com.his.surgery.entity.Doctor;
import com.his.surgery.entity.Nurse;
import com.his.surgery.entity.Operationroom;
import com.his.surgery.entity.Surgery;
import com.his.surgery.service.ISurgeryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.support.ManagedSet;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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
    public Surgery eagerFindById(Integer id) {
        Surgery surgery = surgeryDao.loadById(id);
        //解决延迟加载问题
        try {
            surgery.getAssists().size();
            surgery.getNurses().size();
        } catch (Exception e) {
            e.printStackTrace();
            surgery = null;
        }
        return surgery;
    }

    @Override
    public void update(Surgery surgery) {
        surgeryDao.update(surgery);
    }

    /**
     * 获得申请中的手术list
     */
    @Override
    public Page<Surgery> getPageList(PageRequest pageRequest, int state) {
        List<Surgery> list = surgeryDao.findListByHQL("from Surgery where state=?", state);
        List<Surgery> newlist = new ArrayList<Surgery>();

        Page<Surgery> mypage = new Page<Surgery>(pageRequest);
        mypage.setTotalItems(list.size());
        //i是起始位置，j代表循环PageSize次
        for (int i = mypage.getOffset(), j = 0; j < mypage.getPageSize(); i++, j++) {
            if (i >= list.size()) {
                break;
            }
            Surgery each = list.get(i);
            //解决懒加载问题
            each.getDoctor().getName();
            if (state > 0) {
                //解决懒加载问题
                each.getAssists().size();
                each.getNurses().size();
            }
            newlist.add(each);
        }

        mypage.setResult(newlist);

        return mypage;
    }

    /**
     * 废弃手术申请
     *
     * @param id 手术id
     */
    @Override
    public void dispose(Integer id) {
        Surgery surgery = surgeryDao.findById(id);
        surgeryDao.delete(surgery);
    }

    /**
     * 更新手术安排
     *
     * @param id         手术id
     * @param doctor_ids 医生数组
     * @param nurse_ids  护士数组
     * @param room       房间号
     */
    @Override
    public void updateArrange(int id, int[] doctor_ids, int[] nurse_ids, int room) {
        Surgery surgery = surgeryDao.findById(id);
        //设置从申请状态到安排状态
        surgery.setState(1);
        //Set<Doctor> assists = surgery.getAssists();
//        Doctor doctor = new Doctor();
//        doctor.setId(1);
//        doctor.setName("一拳");
//        assists.add(doctor);
//        for (Doctor doctor1 : assists) {
//            doctor1.setName("只有我不在的");
//        }

        //重新建立数组,设置医生
        Set<Doctor> assists = new ManagedSet<Doctor>();
        for (int doctor_id : doctor_ids) {
            Doctor doctor = new Doctor();
            doctor.setId(doctor_id);
            assists.add(doctor);
        }
        surgery.setAssists(assists);

        //设置护士
        Set<Nurse> nurses = new ManagedSet<Nurse>();
        for (int nurse_id : nurse_ids) {
            Nurse nurse = new Nurse();
            nurse.setNurseId(nurse_id);
            nurses.add(nurse);
        }
        surgery.setNurses(nurses);

        //设置手术室
        Operationroom operationroom = new Operationroom();
        operationroom.setNum(room);
        surgery.setRoom(operationroom);
    }

    /**
     * 取消手术安排
     *
     * @param id 手术id
     */
    public void cancelArrange(int id) {
        Surgery surgery = surgeryDao.findById(id);
        //设置从安排状态到申请状态
        surgery.setState(0);

        //重新建立数组,设置医生
        Set<Doctor> assists = new ManagedSet<Doctor>();
        //设置护士
        Set<Nurse> nurses = new ManagedSet<Nurse>();

        surgery.setAssists(assists);
        surgery.setNurses(nurses);
        surgery.setRoom(null);
    }
}
