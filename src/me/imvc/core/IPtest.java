package me.imvc.core;  
  
import junit.framework.TestCase;  
  
public class IPtest extends TestCase {  
      
    public void testIp(){  
                //指定纯真数据库的文件名，所在文件夹  
        IPSeeker ip=new IPSeeker("qqwry.Dat","c:/");  
         //测试IP 58.20.43.13  
        System.out.println(ip.getIPLocation("171.8.108.200").getCountry()+":"+ip.getIPLocation("171.8.108.200").getArea());  
    }  
} 