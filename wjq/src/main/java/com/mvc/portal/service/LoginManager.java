package com.mvc.portal.service;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.framework.util.CookieUtils;
import com.mvc.framework.web.FrameworkFilter;
import com.mvc.member.model.Member;
import com.mvc.security.SecurityConstants;
import com.mvc.security.model.LoginLog;
import com.mvc.security.model.User;
import com.mvc.security.service.LoginLogManager;
import com.mvc.security.service.UserManager;
import com.mvc.security.util.SecurityUtils;

@Service
public class LoginManager {
    @Autowired
    protected LoginLogManager loginLogManager;
    @Autowired
    protected UserManager userManager;



    public LoginLog beginLog(User user) {
        LoginLog loginLog = new LoginLog();
        loginLog.setLoginName(user.getLoginName());
        loginLog.setBeginDate(new Date());
        loginLog.setUserType(LoginLog.TYPE_USER);
        return loginLog;
    }


    public void createLog(LoginLog loginLog) {
        loginLog.setEndDate(new Date());
        loginLog.setSpendTime((int) (loginLog.getEndDate().getTime() - loginLog.getBeginDate().getTime()));
        String message = loginLog.getMessage();
        if(message!=null&&message.length()>255){
            loginLog.setMessage(message.substring(0,255));
        }
        loginLog.setStatus(LoginLog.LOGIN_RESULT_FAIL);
        loginLogManager.save(loginLog);
    }

    public void loginSuccess(HttpServletRequest request,HttpServletResponse response, String loginName, LoginLog loginLog) {
        loginLog.setResult(LoginLog.LOGIN_RESULT_SUCCESS);
        String token = SecurityUtils.generateSecurityToken(loginName);
        CookieUtils.setUserTokenCookie(response, token);
        CookieUtils.setEncodedCookie(response, SecurityConstants.LOGIN_NAME, loginName);
        FrameworkFilter.setUserToSession(request, response, token,null);
    }


	public LoginLog beginLog(Member member) {
		   LoginLog loginLog = new LoginLog();
	       loginLog.setLoginName(member.getLoginName());
	       loginLog.setBeginDate(new Date());
	       loginLog.setUserType(LoginLog.TYPE_MEMBER);
	       return loginLog;
	}


}
