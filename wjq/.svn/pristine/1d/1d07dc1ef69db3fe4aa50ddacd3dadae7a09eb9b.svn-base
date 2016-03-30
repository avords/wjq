package com.mvc.base.service;

import java.io.Serializable;
import java.util.Date;
import org.hibernate.Query;
import org.springframework.stereotype.Service;
import com.mvc.base.model.VisitRecord;
import com.mvc.framework.service.BaseService;
@Service
public class VisitRecordManager extends BaseService<VisitRecord, Serializable>{

	@Override
	public void save(VisitRecord entity) {
		super.save(entity);
	}
	
	public Integer queryVisitCount(Long visitObjectId,Integer visitType){
		String sql = "select count(*) from " + VisitRecord.class.getName() + " A WHERE A.visitObjectId="+visitObjectId +" and A.visitType="+visitType;
		Query query = getSession().createQuery(sql);
		return ((Long) query.list().get(0)).intValue();
	}
	
	public void createVisitRecord(Long memberId,String ip,Integer visitType,Long visitObjectId) {
		   VisitRecord visitRecord = new VisitRecord();
		   visitRecord.setMemberId(memberId);
		   visitRecord.setVisitObjectId(visitObjectId);
		   visitRecord.setIp(ip);
		   visitRecord.setVisitType(visitType);
		   visitRecord.setVisitDate(new Date());
		   this.save(visitRecord);
	}
}
