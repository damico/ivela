<%-- 
    Document   : chat
    Created on : Jan 7, 2009, 1:02:20 PM
    Author     : jefferson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><s:text name="chat.title"/>t</title>
    </head>
    <body>
        
<center>
    <h2><s:text name="chat.name"/></h2>     
    <% String serverAddr = request.getLocalAddr(); %>       

<applet code="org.jdamico.ircivelaclient.view.HandleApplet"
    archive="applet/ivela_chat.jar, applet/jerklib.jar""    
    width="920" height="505">

<param name="nick" value='<s:property value="nick" />' >

<param name="teacher" value='<s:property value="teacherName" />' >

<param name="channel" value='<s:property value="chatRoomName" />'>

<param name="bgcolor" value="FFFFFF">

<param name="server" value="<%=serverAddr%>">

</applet> 
</center>

    </body>
</html>
