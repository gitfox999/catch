package me.imvc.lib;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class StringToFile {
	public static void writes(String content, String filePath) {
		try {
			FileWriter fileWriter = new FileWriter(filePath, true);
			BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
			bufferedWriter.write(content);
			bufferedWriter.close();
			fileWriter.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
