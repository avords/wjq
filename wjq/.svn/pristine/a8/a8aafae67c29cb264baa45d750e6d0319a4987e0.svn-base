package com.mvc.cms.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.mvc.cms.model.Channel;
import com.mvc.cms.model.ContentChannel;
import com.mvc.framework.service.BaseService;

@Service
public class ChannelManager extends BaseService<Channel, Serializable>{

	public List<Channel> getContentChannels(Long objectId) {
		String sql = "select A from " + Channel.class.getName() + " A, " + ContentChannel.class.getName() + " B where A.objectId = B.channelId and B.contentId =  ? ";
		return searchBySql(sql, objectId);
	}

    public List<Channel> getAllShowByDisplayLocation(Integer displayLocation) {
        String sql = "select A from " + Channel.class.getName() + " A where (A.displayLocation = ? or A.displayLocation=3 ) and A.isDisplay = 1 order by A.priority asc";
        return searchBySql(sql, displayLocation);
    }
    
    public List<Channel> getAllByParentId(){
    	String sql="select A from " + Channel.class.getName() + " A ORDER BY A.parentId asc,A.name asc";
    	 return searchBySql(sql);
    }
    
    public List<Channel> getAllByLetter(){
    	String sql2="SELECT * FROM cms_channel WHERE 1=1 ORDER BY CONVERT( name USING gbk ) COLLATE gbk_chinese_ci ASC";
    	List<Channel> channels=this.searchByNativeSql(Channel.class, sql2);
    	return channels;
    }
    
    public List<Channel> getAllByOrderPriority(){
    	String sql="select A from " + Channel.class.getName() + " A ORDER BY A.priority asc";
    	 return searchBySql(sql);
    }
    
    public List<Channel> getChildChannelByObjectId(Long objectId) {
		String sql = "select A from " + Channel.class.getName() + " A where A.parentId = ?";
		return searchBySql(sql, objectId);
	}

	@SuppressWarnings("unchecked")
	public List<Channel> getChannelsByName(String name) {
		String sql = "from " + Channel.class.getName() + "  A where A.fullName like :name";
		Query query=getSession().createQuery(sql);
		query.setString("name", "%"+name+"%"); 
		return query.list();
	}

	public List<Channel> isNewCodeByPositionCodeAndObjId(String positionCode, Long objId) {
		if(null==objId){
			String sql1 = "select A from " + Channel.class.getName() + " A where A.positionCode = ?";
			return searchBySql(sql1,positionCode);
		}
		String sql = "select A from " + Channel.class.getName() + " A where A.positionCode = ? And A.objectId != ?";
		return searchBySql(sql,positionCode,objId);
	}

}
