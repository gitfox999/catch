package me.imvc.lib;

public class StringTools {
public static String firstToUpperCase(String string){
	String firstUpperCase=string.substring(0, 1).toUpperCase();
	return firstUpperCase+string.substring(1,string.length());
}
}
