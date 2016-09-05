package me.imvc.app.entities;

// Generated 2013-11-23 17:08:22 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * Users generated by hbm2java
 */
public class Users implements java.io.Serializable {

	private Long id;
	private UserExtends userExtends;
	private String username;
	private String password;
	private boolean enabled;
	private Long teacherId;
	private Set<Authorities> authoritieses = new HashSet<Authorities>(0);

	public Users() {
	}

	public Users(String username, String password, boolean enabled) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
	}

	public Users(UserExtends userExtends, String username, String password,
			boolean enabled, Long teacherId, Set<Authorities> authoritieses) {
		this.userExtends = userExtends;
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.teacherId = teacherId;
		this.authoritieses = authoritieses;
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public UserExtends getUserExtends() {
		return this.userExtends;
	}

	public void setUserExtends(UserExtends userExtends) {
		this.userExtends = userExtends;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return this.enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Long getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Long teacherId) {
		this.teacherId = teacherId;
	}

	public Set<Authorities> getAuthoritieses() {
		return this.authoritieses;
	}

	public void setAuthoritieses(Set<Authorities> authoritieses) {
		this.authoritieses = authoritieses;
	}

}
