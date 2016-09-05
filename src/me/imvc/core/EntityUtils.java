package me.imvc.core;

import org.springframework.beans.BeanUtils;
public class EntityUtils extends BeanUtils{
	public void copy(Object source, Object target, String... ignoreProperties) {
		String[] ignoreProperties_A = ignoreProperties;
		super.copyProperties(source, target, ignoreProperties_A);
	}
	public void copy(String[] ignoreProperties,Object source,Object target) {
		super.copyProperties(source, target, ignoreProperties);
	}
}
