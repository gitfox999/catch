package me.imvc.core;

import org.apache.struts2.rest.handler.XStreamHandler;

public class RestXmlXStreamHandler extends XStreamHandler {
	@Override
    public String getExtension() {
        return "xmlx";
    }

}
