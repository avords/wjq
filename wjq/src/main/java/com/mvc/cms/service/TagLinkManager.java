package com.mvc.cms.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cms.model.Tag;
import com.mvc.cms.model.TagLink;
import com.mvc.framework.service.BaseService;

@Service
public class TagLinkManager extends BaseService<TagLink, Long>{

	@Autowired
	private TagManager tagManager;

	public void deleteTagByLinkItemId(Long linkItemId,Integer type){
		deleteByWhere("linkItemId="+ linkItemId + " and type = " + type);
	}

	public List<TagLink> getTagLinks(Long linkItemId,Integer type){
		return searchBySql("select A from " + TagLink.class.getName() +" A where A.linkItemId=? and type = ?", linkItemId, type);
	}

	public String getTagIds(Long linkItemId,Integer type){
		List<TagLink> tagLinks = getTagLinks(linkItemId,type);
		StringBuilder tags = new StringBuilder();
		for(TagLink askTag : tagLinks){
			tags.append(-askTag.getTagId()).append(",");
		}
		if(tags.length()>0){
			return tags.substring(0,tags.length()-1);
		}
		return null;
	}

	public void updateTagLink(String tags, Long linkItemId,Integer type){
		deleteTagByLinkItemId(linkItemId,type);
		if(StringUtils.isNotBlank(tags)){
			String[] tag = tags.split(",");
			for(String temp : tag){
				Long tagId = null;
				try{
					tagId = -Long.parseLong(temp);
				}catch(Exception e){
				}
				if(tagId==null || tagId < 0){
					Tag tagEntity = new Tag();
					tagEntity.setName(temp);
					tagManager.save(tagEntity);
					tagId = tagEntity.getObjectId();
				}
				TagLink tagLink = new TagLink();
				tagLink.setTagId(tagId);
				tagLink.setLinkItemId(linkItemId);
				tagLink.setType(type);
				super.save(tagLink);
			}
		}
	}
}
