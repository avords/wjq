package com.mvc.cms.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.cms.model.ContentPicture;
import com.mvc.framework.service.BaseService;

@Service
public class ContentPictureManager extends BaseService<ContentPicture, Long> {

	public List<ContentPicture> getContentPictureByContentId(Long objectId) {
		String sql = "SELECT A FROM "+ContentPicture.class.getName() +" A where contentId = ?";
		return searchBySql(sql,objectId);
	}
	
	public ContentPicture searchContentPictureByFileId(Long fileId,Long contentId) {
		String sql = "SELECT A FROM "+ ContentPicture.class.getName() +" A  where A.fileId = " + fileId + " AND A.contentId = " + contentId ;
		List<ContentPicture> backups = searchBySql(sql,fileId,contentId);
		if(backups.size()>0){
			return backups.get(0);
		}
		return null;
	}
	
	public void saveContentPicturee(String content, Long objectId) throws Exception {
		List<ContentPicture> deleteFiles = getContentPictureByContentId(objectId);
		List<Long> updateFiles = new ArrayList<Long>();
		if (content == null || "".equals(content)){
			return; 
		}
		String matchAddress = ContentPicture.NEW_UPLOAD_ROOT + "/";
		String temp = content.toLowerCase();
		int orderId = 1;
		while (temp.indexOf("<object") > -1||temp.indexOf("<img") > -1) {
			int left = temp.indexOf(matchAddress);
			if (left != -1){
				String picturePath = temp.substring(left,temp.indexOf("\"",left));
				left = left + matchAddress.length();
				int right = picturePath.indexOf(".");
				if (right != -1){
					Long fileId = Long.parseLong(picturePath.substring(picturePath.lastIndexOf("/")+1,right));
					updateFiles.add(fileId);
					// 查询fileId备份是否存在，不存在则插入，存在则判断objectId是否存在，不存在则更新
					ContentPicture oldContentPicture = searchContentPictureByFileId(fileId,objectId);
					if (oldContentPicture == null) {
						ContentPicture contentPicture = new ContentPicture();
						contentPicture.setPicturePath(picturePath);
						contentPicture.setFileId(fileId);
						contentPicture.setContentId(objectId);
						contentPicture.setOrderId(orderId++);
						super.save(contentPicture);
					}
					temp = temp.substring(right+1);
				} 
			} else {
				return;
			}
		}
		//遍历删除的图片
		for(ContentPicture picture : deleteFiles){
			//如果没有找到指定的FileId则说明  图片被删除
			if(!updateFiles.contains(picture.getFileId())){
				super.delete(picture);
			}
		}
	}
}
