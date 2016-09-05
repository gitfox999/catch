package me.imvc.core;

import java.io.IOException;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.rest.handler.ContentTypeHandler;

public class XlsHandler implements ContentTypeHandler{

	@Override
	public void toObject(Reader in, Object target) throws IOException {
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String fromObject(Object obj, String resultCode, Writer stream)
			throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		if (obj != null) {
			response.setContentType("application/msexcel");
			OutputStream outputStream = null;
			jxl.write.WritableWorkbook writableWorkbook = null;
			try {
				outputStream = response.getOutputStream();
				writableWorkbook = jxl.Workbook.createWorkbook(outputStream);
				jxl.write.WritableSheet sheet1=writableWorkbook.createSheet("Sheet1",0);
				for (Object label : (List)obj) {
					sheet1.addCell((jxl.write.Label)label);
				}
				writableWorkbook.write();
				outputStream.flush();
				writableWorkbook.close();
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (jxl.write.WriteException e) {
				e.printStackTrace();
			}
        }
		return null;
	}

	@Override
	public String getContentType() {
		   return "application/msexcel";
	}
	@Override
	public String getExtension() {
		 return "xls";
	}

}
