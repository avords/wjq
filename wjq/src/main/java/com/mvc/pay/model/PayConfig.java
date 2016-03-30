package com.mvc.pay.model;
public class PayConfig {
    private static String md5Key;//md5 key
    private  static String merNo;//商户id
    public static String getMd5Key() {
        return md5Key;
    }
    public void setMd5Key(String md5Key) {
        PayConfig.md5Key = md5Key;
    }
    public static String getMerNo() {
        return merNo;
    }
    public void setMerNo(String merNo) {
        PayConfig.merNo = merNo;
    }

}
