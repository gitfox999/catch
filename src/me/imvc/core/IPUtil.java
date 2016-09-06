package me.imvc.core;

public class IPUtil {
	private static IPSeeker ipSeeker=new IPSeeker("qqwry.Dat","c:/");  
	public static String getRemoteHost(javax.servlet.http.HttpServletRequest request){
	    String ip = request.getHeader("x-forwarded-for");
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getRemoteAddr();
	    }
	    System.out.println(ip);
	    return ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
	}
	
	public static String getaddress(String ip){
		return ipSeeker.getIPLocation(ip).getCountry()+":"+ipSeeker.getIPLocation(ip).getArea();
	}
}
