package me.imvc.app.models;

import java.util.ArrayList;
import java.util.List;
import jxl.write.Label;
import me.imvc.app.entities.Notices;
import me.imvc.core.BaseModel;
import me.imvc.core.Model;
import me.imvc.lib.DateTimeTool;

public class NoticeModel extends BaseModel {

	private Notices notice;
	
	private String[] files;
	

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public Notices getNotice() {
		return notice;
	}

	public void setNotice(Notices notice) {
		this.notice = notice;
	}

	public Notices get(Long id) {
		setNotice((Notices) get(Notices.class, id));
		return getNotice();
	}
	

	public void searchData(){		
		 hdslSearch(Notices.class,getSearch());
	}
	
	public List<Label> getExcel() {
		List<Label> labels = new ArrayList<Label>();
		int k = 0;
		int i = 0;
		labels.add(new Label(k++, i, "标题"));
		labels.add(new Label(k++, i, "发布者"));
		labels.add(new Label(k++, i, "简介"));
		labels.add(new Label(k++, i, "附件"));
		i = 1;
		for (Object object : getDataList()) {
			Notices Notices = (Notices) object;
			k = 0;
			labels.add(new Label(k++, i, Notices.getTitle()));
			labels.add(new Label(k++, i, Notices.getAuthor()));
			labels.add(new Label(k++, i, Notices.getDescription()));
			labels.add(new Label(k++, i, Notices.getFiles()));
			i++;
		}
		return labels;
	}

	public void save() {
		/*String files="";
		if(getFiles()!=null)
		for (String file : getFiles()) {
			files+=file;
		}
		getNotice().setCreatedAt(DateTimeTool.currentTime());
		getNotice().setUpdatedAt(DateTimeTool.currentTime());
		getNotice().setFiles(files);*/
		save(getNotice());
	}

	public void update(Long id) {
		/*Notices newNotice=getNotice();
		Notices loadNotice=get(id);
		String files="";
		if(getFiles()!=null)
		for (String file : getFiles()) {
			files+=file;
		}
		getEntityUtils().copy(getNotUpdate().split(","),newNotice, loadNotice);
		loadNotice.setFiles(files);
		loadNotice.setUpdatedAt(DateTimeTool.currentTime());*/
		//update(loadNotice);
		getNotice().setId(id);
		update(getNotice());
	}
	
	public void delete(Long id) {
		if (id == 0) {
			for (Long nid : getIds()) {
				delete(get(nid));
			}
		}else{
			delete(get(id));
		}		
	}

}