package me.imvc.app.entities;

import java.math.BigDecimal;
import java.util.Date;

// Generated 2013-11-23 17:08:22 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * Users generated by hbm2java
 */
public class Iplog implements java.io.Serializable {

	private Long id;
	private String ip;
	private String loca;
	private String oname;
	private String oversion;
	private String bname;
	private String bversion;
	private String bplug;
	private Date itime;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getIp() {
		return ip;
	}
	public String getLoca() {
		return loca;
	}
	public void setLoca(String loca) {
		this.loca = loca;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getOversion() {
		return oversion;
	}
	public void setOversion(String oversion) {
		this.oversion = oversion;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBversion() {
		return bversion;
	}
	public void setBversion(String bversion) {
		this.bversion = bversion;
	}
	public String getBplug() {
		return bplug;
	}
	public void setBplug(String bplug) {
		this.bplug = bplug;
	}
	public Date getItime() {
		return itime;
	}
	public void setItime(Date itime) {
		this.itime = itime;
	}
}
