package com.mvc.pay.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.util.DomainUtils;
import com.mvc.pay.model.PayConfig;
import com.mvc.security.util.SecurityUtils;

@Controller
@RequestMapping("/ecpssPay")
public class EcpssPayController {

    private static final Logger LOGGER = Logger.getLogger(EcpssPayController.class);
    private static final String PORTAL_DIR = "pay/";

    @RequestMapping("/payCenter")
    public String payCenter(HttpServletRequest request,HttpServletResponse response){
        String orderNoStr = request.getParameter("orderNo");
        if(StringUtils.isNotBlank(orderNoStr)){
            double totalAmount = 0;
            String[] orderNos = orderNoStr.split(",");
            for(@SuppressWarnings("unused") String orderNo:orderNos){

            }
            //MD5key值
            String md5key = PayConfig.getMd5Key();
            //商户ID
            String merNo = PayConfig.getMerNo();
            String billNo = orderNoStr;
            //支付金额
            String amount = totalAmount+"";
            //返回地址
            String returnURL = DomainUtils.getDynamicDomain()+"/ecpssPay/payResult";
            //[必填]返回数据给商户的地址(商户自己填写):::注意请在测试前将该地址告诉我方人员;否则测试通不过
            @SuppressWarnings("unused")
            String tradeAdd;   //返回地址
            //加密字符串
            String md5src = merNo +"&"+ billNo +"&"+ amount +"&"+ returnURL +"&"+md5key ;
            //MD5加密后的字符串
            String signInfo = SecurityUtils.generatePassword(md5src).toUpperCase();
             //[必填]支付完成后，后台接收支付结果，可用来更新数据库值
             String adviceURL = DomainUtils.getDynamicDomain()+"/ecpssPay/payCallback";
             //送货信息(方便维护，请尽量收集！如果没有以下信息提供，请传空值:'')
             //因为关系到风险问题和以后商户升级的需要，如果有相应或相似的内容的一定要收集，实在没有的才赋空值,谢谢。
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
            String  orderTime = sdf.format(new Date());  //[必填]交易时间：YYYYMMDDHHMMSS
            //账单地址选择传递
            String products="products info";// '------------------物品信息
            request.setAttribute("merNo", merNo);
            request.setAttribute("billNo", billNo);
            request.setAttribute("amount", amount);
            request.setAttribute("returnURL", returnURL);
            request.setAttribute("adviceURL", adviceURL);
            request.setAttribute("signInfo", signInfo);
            request.setAttribute("orderTime", orderTime);
            request.setAttribute("products", products);
        }
        return PORTAL_DIR+"payCenter";
    }
    @RequestMapping("/payResult")
    public String payResult(HttpServletRequest request,HttpServletResponse response){
        return PORTAL_DIR+"payResult";
    }
    @RequestMapping("/payCallback")
    public String test(HttpServletRequest request,HttpServletResponse response){
        //BillNo:商户编号,Amount:金额,Succeed:状态码,Result:订单详情,SignMD5info:验证签名,MD5( BillNo&Amount&Succeed&MD5key)
//Succeed状态码
//        0   失败
//        1   高风险卡    失败  待确认
//        2   黑卡  失败  失败
//        3   交易金额超过单笔限额  失败  失败
//        4   本月交易金额超过月限额 失败  失败
//        5   同一Ip发生多次交易  失败  失败
//        6   同一邮箱发生多次交易  失败  失败
//        7   同一卡号发生多次交易  失败  失败
//        8   同一Cookies发生多次交易 失败  失败
//        9   Maxmind分值过高。    失败  待确认
//        10  商户未注册   取消  取消
//        11  密匙不存在   取消  取消
//        13  签名不配备，数据发生篡改    取消  取消
//        14  返回网址错误  取消  取消
//        15  商户未开通   取消  取消
//        16  通道未开通   取消  取消
//        17  黑卡bean  失败  失败
//        18  系统出现异常  失败  失败
//        19  Vip商户交易处理中  --  --
//        20  通道信息设置不全    失败  失败
//        21  卡号支付超过限制    暂无  暂无
//        22  交易网址不正确 失败  失败
//        23  商户交易卡种不正确   失败  失败
//        24  同一流水号出现多次交易 失败  失败
//        25  持卡人信息错误 失败  失败
//        26  金额超过限定值（50000）  失败  失败
//        27  通道终端未设置 失败  失败
//        28  汇率设置错误  失败  失败
//        88  成功  成功  成功
        String MD5Key = PayConfig.getMd5Key();
        String BillNo = request.getParameter("BillNo");
        String Amount = request.getParameter("Amount");
        String Succeed = request.getParameter("Succeed");
        String SignMD5info = request.getParameter("SignMD5info");
        @SuppressWarnings("unused")
        String Result = request.getParameter("Result");

        String mySignMD5info = SecurityUtils.generatePassword(BillNo+"&"+Amount+"&"+Succeed+"&"+MD5Key);//MD5加密
        if(StringUtils.isNotBlank(Succeed)&&Succeed.equals("88")&&mySignMD5info.equals(SignMD5info)){
            //调用回调接口
        }else{
            //提示各种异常
        }
        try {
            response.getWriter().write("ok");
        } catch (IOException e) {
            LOGGER.error(e);
        }
        return null;
    }
}
