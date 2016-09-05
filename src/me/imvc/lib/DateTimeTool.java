package me.imvc.lib;

public class DateTimeTool {
	
	public static java.sql.Timestamp currentTime(){
		java.util.Date date=new java.util.Date();
		java.sql.Timestamp timestamp=new java.sql.Timestamp(date.getTime());
		return timestamp;
	}

}
