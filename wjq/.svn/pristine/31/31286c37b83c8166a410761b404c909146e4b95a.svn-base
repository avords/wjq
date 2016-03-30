package com.mvc.cms.service;

import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.mvc.WJQConstants;
import com.mvc.cms.model.Tag;
import com.mvc.cms.model.TagLink;
import com.mvc.framework.service.BaseService;

@Service
public class TagManager extends BaseService<Tag, Long>{

	private static final Logger LOGGER = Logger.getLogger(TagManager.class);

	public Tag getTagByName(String name){
		if(StringUtils.isNotBlank(name)){
			return searchByWhere("name=?", name);
		}
		return null;
	}

	@Override
    public void save(Tag entity){
		if(entity.getObjectId()==null){
			entity.setArticleCount(0);
			Tag exist = getTagByName(entity.getName());
			if(exist!=null){
				try {
					BeanUtils.copyProperties(entity, exist);
				} catch (Exception e) {
					LOGGER.error("save",e);
				}
				return ;
			}
			super.save(entity);
		}else{
			update(entity);
		}
	}

	public void update(Tag tag) {
		Session session = getSession();
		Query query = session.createQuery("update " + Tag.class.getName() + " set name = ?,description=?,picture=? where objectId = ?");
		query.setParameter(0, tag.getName());
		query.setParameter(1, tag.getDescription());
		query.setParameter(2, tag.getPicture());
		query.setParameter(3, tag.getObjectId());
		query.executeUpdate();
	}


	public void updateArticleCount(Long tagId){
		Session session = getSession();
		Query query = session.createQuery("update " + Tag.class.getName() + " set articleCount = (select count(*) from " + TagLink.class.getName() + " where tagId = ? and type=?) "
		        + " where objectId = ?");
		query.setParameter(0, tagId);
		query.setParameter(1, tagId);
		query.setParameter(2, WJQConstants.TAG_TYPE_ARTICAL);
		query.executeUpdate();
	}

	public List<Tag> getTags(Long linkItemId, Integer type) {
		String sql = "select A from " + Tag.class.getName() + " A," + TagLink.class.getName() + " B where A.objectId = B.tagId and B.linkItemId =  ? and B.type= ?";
		return searchBySql(sql, linkItemId,type);
	}

}
