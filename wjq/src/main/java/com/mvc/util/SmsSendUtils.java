package com.mvc.util;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Random;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public final class SmsSendUtils {

	private static final Logger LOGGER = Logger.getLogger(SmsSendUtils.class);
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	
	private SmsSendUtils(){
	}
	
	public static String send(String mobile){
		        //服务器
				HttpClient client = new HttpClient(); 
				//提交方式
				PostMethod method = new PostMethod(Url); 
					
				//编码和头信息
				//client.getParams().setContentCharset("GBK");		
				client.getParams().setContentCharset("UTF-8");
				method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");

				//验证码
				String mobile_code =getValidateCode();

				//短信内容
			    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。"); 

			    //需要提交的信息
				NameValuePair[] data = {//提交短信
					    new NameValuePair("account", "cf_whjy"), 
					    new NameValuePair("password", StringUtil.MD5Encode("nonregret")), //密码可以使用明文密码或使用32位MD5加密
					    new NameValuePair("mobile", mobile), 
					    new NameValuePair("content", content),
				};
				
				//提交
				method.setRequestBody(data);		
				
				try {
					client.executeMethod(method);	
					
					String SubmitResult =method.getResponseBodyAsString();
							
					Document doc = DocumentHelper.parseText(SubmitResult); 
					Element root = doc.getRootElement();

					String code = root.elementText("code");	
					LOGGER.info(code);
					String msg = root.elementText("msg");
					LOGGER.info(msg);
					String smsid = root.elementText("smsid");
					LOGGER.info(smsid);
								
					 if("2".equals(code)){
						 LOGGER.info("短息发送成功!");
					}
					
				} catch (HttpException e) {
					e.printStackTrace();
					 LOGGER.error(e);
				} catch (IOException e) {
					LOGGER.error(e);
				} catch (DocumentException e) {
					LOGGER.error(e);
				}
				return mobile_code;	
	}

	 public static String getValidateCode(){
		 String pattern="000000";
	     DecimalFormat df = new DecimalFormat(pattern);
	     Random r = new Random();
	     return df.format(r.nextInt(1000000));
	 }
}
