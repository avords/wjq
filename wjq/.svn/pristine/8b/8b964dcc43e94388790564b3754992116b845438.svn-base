package com.mvc.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvc.framework.model.AbstractEntity;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.Member;
import com.mvc.member.service.MemberManager;
import com.mvc.order.service.OrderManager;
import com.mvc.security.util.SecurityUtils;

@Controller
@RequestMapping("/adminMember")
public class AdminMemberController extends PageController<Member>{
    @Autowired
    private MemberManager memberManager;

    @Override
    public PageManager<Member> getEntityManager() {

        return memberManager;
    }

    @Override
    public String getFileBasePath() {

        return "member/";
    }

    @RequestMapping(value = "/resetPassword/{objectId}")
    public String resetPassword(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId)
            throws Exception {
        Member entity=memberManager.getMemberBean(objectId);
        request.setAttribute("entity", entity);
        return getFileBasePath() + "resetPassword";
    }

    @RequestMapping(value = "/saveReset", method = RequestMethod.POST)
    public String saveReset(HttpServletRequest request, Member member) {
        String newPassword = request.getParameter("password");
        String message;
        if (StringUtils.isNotBlank(newPassword)) {
            member.setPassword(SecurityUtils.generatePassword(newPassword));
            memberManager.updatePassword(member);
            message = "user.password.reset.success";
        } else {
            message = "member.password.reset.blank";
        }
        return "redirect:resetPassword/" + member.getObjectId() + getMessage(message, request) + "&"
                + appendAjaxParameter(request)+"&action=" + request.getParameter("action");
    }

    @Override
    public String handleSave(HttpServletRequest request, ModelMap modelMap, Member member) throws Exception {
        String password =request.getParameter("password");
        String md5password="";
        if(StringUtils.isEmpty(password)){
            md5password =SecurityUtils.generatePassword(password);
        }else{
            md5password =password;
        }

        member.setPassword(md5password);
        getManager().save(member);
        return "redirect:edit/" + ((AbstractEntity) member).getObjectId() + getMessage("common.base.success", request)
                + "&" + appendAjaxParameter(request) + "&action=" + request.getParameter("action");
    }

    @Override
    protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId)
            throws Exception {
        if (null != objectId) {
            Member entity = memberManager.getByObjectId(objectId);
            request.setAttribute("entity", entity);
        }
        return getFileBasePath() + "edit" + getActualArgumentType().getSimpleName();
    }
    

    @RequestMapping(value = "/postComment")
    public String postComment(HttpServletRequest request, Long postId) {

    	return "home" +"/postComment";
    }
}
