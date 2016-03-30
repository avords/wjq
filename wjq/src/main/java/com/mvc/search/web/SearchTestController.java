package com.mvc.search.web;

import java.io.PrintWriter;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.component.mail.EmailManager;
import com.mvc.search.service.SensitiveWordInitManager;
import com.mvc.search.service.SensitivewordFilterManager;

@Controller
@RequestMapping("/searchTest")
public class SearchTestController {

    @Autowired
    private SensitivewordFilterManager sensitivewordFilterManager;
    @Autowired
    private SensitiveWordInitManager sensitiveWordInitManager;
    @Autowired
    private EmailManager emailManager;

    @RequestMapping("/testSensitiveword")
    public String testSensitiveword(HttpServletRequest request,HttpServletResponse response) throws Exception{
        String txt = request.getParameter("txt");
        boolean flag = sensitivewordFilterManager.isContaintSensitiveWord(txt, SensitivewordFilterManager.maxMatchType);
        Set<String> keyWords = sensitivewordFilterManager.getSensitiveWord(txt, SensitivewordFilterManager.maxMatchType);
        PrintWriter pw = response.getWriter();
        if(flag){
            pw.write("是否有敏感词:有\n");
            for(String k:keyWords){
                pw.write(k+"\n");
            }
        }else{
            pw.write("是否有敏感词:没有\n");
        }
        Map map = sensitiveWordInitManager.initKeyWord();
        pw.write(map.toString());
        return null;
    }

    @RequestMapping("/sendEmail")
    public String sendEmail(HttpServletRequest request,HttpServletResponse response) throws Exception{
        String content = request.getParameter("content");
        //MailConfig mailConfig = new MailConfig();
        emailManager.sendEmail("aa", "1021360647@qq.com", content);
        response.getWriter().write("发送成功");
        return null;
    }
}
