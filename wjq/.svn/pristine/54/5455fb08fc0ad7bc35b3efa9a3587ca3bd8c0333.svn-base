package com.mvc.cms.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.cms.model.Channel;
import com.mvc.cms.service.ChannelManager;
import com.mvc.framework.model.AbstractEntity;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.framework.web.WebServiceResult;

//栏目管理
@Controller
@RequestMapping("channel")
public class ChannelController extends PageController<Channel>{

	@Autowired
	private ChannelManager channelManager;

	@Override
	public PageManager<Channel> getEntityManager() {
		return channelManager;
	}

	@Override
	public String getFileBasePath() {
		return "cms/";
	}

	@Override
    protected String handlePage(HttpServletRequest request, PageSearch page) {
		List<Channel> channels=channelManager.getAllByLetter();
		page.setSortProperty("updateTime");
	    page.setSortOrder("desc");
		request.setAttribute("channels", channels);
		return super.handlePage(request, page);
	}

	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, Channel t) throws Exception {
		t.setUpdateTime(new Date());//记录添加时间
		String fullName="";
		if(t.getParentId()!=null){
			fullName=channelManager.getByObjectId(t.getParentId()).getFullName()+" > ";
		}
		t.setFullName(fullName+t.getName());//拼接完整名称
		channelManager.save(t);// 保存对象
		Long objectId=((AbstractEntity) t).getObjectId();//获得当前对象的objectId
		this.updateChildFullName(objectId);//更新子栏目的完整名称
		return "redirect:edit/"+objectId+ getMessage("common.base.success", request);
	}
	
	private void updateChildFullName(Long objectId){
		List<Channel> childChannels=channelManager.getChildChannelByObjectId(objectId);
		for(Channel c : childChannels){//如果有子栏目,就不断遍历更新
			String childFullName=channelManager.getByObjectId(c.getParentId()).getFullName()+" > "+c.getName();
			c.setFullName(childFullName);
			channelManager.save(c);
			Long currentId=((AbstractEntity) c).getObjectId();
			this.updateChildFullName(currentId);//递归调用
		}
	}

	@Override
    protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId) throws Exception {
		List<Channel> channels=channelManager.getAllByLetter();
		request.setAttribute("channels", channels);
		if (null != objectId) {
            Channel entity = getManager().getByObjectId(objectId);
            if(entity.getParentId()!=null){
                Channel parentChannel = getManager().getByObjectId(entity.getParentId());
                request.setAttribute("parentChannel", parentChannel);
            }
            request.setAttribute("entity", entity);
        }
        return getFileBasePath() + "edit" + getActualArgumentType().getSimpleName();
	}
	@RequestMapping("/getChannel")
	public String getChannel(HttpServletRequest request, HttpServletResponse response, ModelMap map,Long objectId){
	    boolean result = false;
	    Channel channel = channelManager.getByObjectId(objectId);
	    map.addAttribute("channel",channel);
	    result = true;
	    map.addAttribute("result", result);
	    return "jsonView";
	}

	@Override
    public String jsonDelete(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId)
			throws Exception {
		WebServiceResult result = new WebServiceResult();
		List<Channel> channels=channelManager.getChildChannelByObjectId(objectId);
		if(channels.size()==0){
			try{
				getManager().delete(objectId);
				result.setResult("true");
			}catch(Exception e){
				result.setResult("false");
			}
		}else{
			result.setResult("false");
		}

		return result.toJson();
	}



	@RequestMapping("/isNewPositionCode")
	public String isNewPositionCode(HttpServletRequest request,HttpServletResponse response,ModelMap map)
			throws Exception {
		boolean result = false;
		map.addAttribute("result", result);
		String positionCode=request.getParameter("positionCode");
		Long objId=0L;
		try {
			objId=Long.parseLong(request.getParameter("objId"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Channel> channels=channelManager.isNewCodeByPositionCodeAndObjId(positionCode,objId);
		if(channels.size()==0){
			result=true;
			map.remove("result");
			map.addAttribute("result", result);
		}
		return "jsonView";
	}

}
