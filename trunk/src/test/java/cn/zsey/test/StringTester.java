package cn.zsey.test;

import cn.zsey.common.MD5;

public class StringTester {
	public static void main(String[] args){
		MD5 md5 = new MD5();
		String md5pwd = md5.getMD5ofStr("123456");
		System.out.println(md5pwd);
	}
}
