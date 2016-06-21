package com.his.surgery.serviceImpl;

import com.his.surgery.dao.ISurgeryDao;
import com.his.surgery.dao.ISurgeryLogDao;
import com.his.surgery.entity.Surgery;
import com.his.surgery.entity.SurgeryLog;
import com.his.surgery.service.ISurgeryLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 */
@Service("surgeryLogService")
@Transactional
public class SurgeryLogService implements ISurgeryLogService {

    @Autowired
    @Qualifier("surgeryLogDao")
    private ISurgeryLogDao surgeryLogDao;

    @Autowired
    @Qualifier("surgeryDao")
    private ISurgeryDao surgeryDao;

    /**
     * 保存一个手术记录
     * @param sid 手术id
     * @param remark 备注
     * @param firstConsult 术前诊断
     * @param endConsult 术后诊断
     * @param process 过程
     */
    @Override
    public void save(int sid, String remark, String firstConsult, String endConsult, String process) {
        Surgery surgery = surgeryDao.findById(sid);
        SurgeryLog surgeryLog = surgery.getLog();
        if (surgeryLog == null) {//做新建动作
            //设置状态从手术安排到手术记录
            surgery.setState(2);
            //新建手术记录
            surgeryLog = new SurgeryLog();
            surgeryLog.setCode(sid);

            surgeryLog.setRemark(remark);
            surgeryLog.setEndDiagnosis(endConsult);
            surgeryLog.setFirstDiagnosis(firstConsult);
            surgeryLog.setProcess(process);
            //surgeryLog.setSurgery(surgery);
            //保存surgerylog
            surgeryLogDao.save(surgeryLog);
        }else {
            //做更新动作
            surgeryLog.setRemark(remark);
            surgeryLog.setEndDiagnosis(endConsult);
            surgeryLog.setFirstDiagnosis(firstConsult);
            surgeryLog.setProcess(process);
        }
    }
}
