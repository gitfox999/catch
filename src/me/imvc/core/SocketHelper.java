package me.imvc.core;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;

public class SocketHelper {

//	public static void main(String[] args) {
//		TCPClient("begin");
//	}

	public String TCPClient(String msg) {
		String s = "";

		InputStreamReader in = null;
		OutputStreamWriter out = null;

		try {
			Socket mysocket = new Socket("10.59.52.28", 8002);
			in = new InputStreamReader(mysocket.getInputStream(), "UTF-8");
			out = new OutputStreamWriter(mysocket.getOutputStream());

			out.write(msg); // 通过 out向服务器写入信息。
			out.flush();
			int c = 0;

			while ((c = in.read()) > -1) {
				s += (char) c;
			}

			// 除非读取到信息。
//			System.out.println("客户收到服务器数据---->" + s);
			in.close();
			out.close();
			mysocket.close();
		} catch (IOException e) {
			System.out.println(e.toString());
		}
		return s;
	}
}
