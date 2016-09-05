package me.imvc.lib;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class StringToMd5 {

	public static String encode(String string) {
		byte[] code = null;
		try {
			code = MessageDigest.getInstance("md5").digest(string.getBytes());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return byte2hex(code);
	}

	private static String byte2hex(byte[] b) {
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; n++) {
			stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
			if (stmp.length() == 1)
				hs = hs + "0" + stmp;
			else
				hs = hs + stmp;
		}
		return hs.toLowerCase();
	}
}
