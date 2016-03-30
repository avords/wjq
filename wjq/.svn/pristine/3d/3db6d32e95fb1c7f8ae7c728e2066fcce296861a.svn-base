package com.mvc.search.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.search.service.SensitivewordFilterManager;

@Controller
@RequestMapping("/sensitivewordFilter")
public class SensitivewordFilterController {

    @Autowired
    private SensitivewordFilterManager sensitivewordFilterManager;

    @RequestMapping("/isHaveSensitiveword")
    public String isHaveSensitiveword(HttpServletRequest request,HttpServletResponse response,ModelMap map){
        String text = request.getParameter("text");
        boolean result = sensitivewordFilterManager.isContaintSensitiveWord(text, SensitivewordFilterManager.minMatchTYpe);
        map.addAttribute("result", result);
        return "jsonView";
    }
}
