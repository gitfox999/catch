package me.imvc.lib;
import java.io.File;
public class Folder {
	public static void newFolder(String folderPath) {
		try {
			File myfolderPath = new File(folderPath);
			if (!myfolderPath.exists()) {
				myfolderPath.mkdirs();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
