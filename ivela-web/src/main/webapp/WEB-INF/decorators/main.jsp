<%--    
#############################################################################################
# Copyright(c) 2009 by IBM Brasil Ltda and others                                           #
# This file is part of ivela project, an open-source                                        #
# Program URL   : http://code.google.com/p/ivela/                                           #  
#                                                                                           #
# This program is free software; you can redistribute it and/or modify it under the terms   #
# of the GNU General Public License as published by the Free Software Foundation; either    #
# version 3 of the License, or (at your option) any later version.                          #
#                                                                                           #
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; #
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. #
# See the GNU General Public License for more details.                                      #  
#                                                                                           #
#############################################################################################
# File: main.jsp                                                                            #
# Document: Decorator for main pages                                                        # 
# Date        - Author(Company)                   - Issue# - Summary                        #
# 05-JUN-2008 - Leoo Moreira                      - XXXXXX - Initial Version                #
# 08-JUN-2009 - Otofuji (Instituto Eldorado)      - 000007 - IE7 compatibility              #
# 15-JUL-2009 - Rafael Lagoa (Instituto Eldorado) - 000012 - Remove breadcrumb area and     # 
#                                                            menu repositioning             #
#############################################################################################
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.userdetails.UserDetails"%>
<%@ page import="br.ufc.ivela.commons.model.SystemUser"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><s:text name="front.pageTitle" /></title>
        <!-- Colocar a logo para aparecer no navegador <link rel="icon" href="../logotipo/logo.jpg" type="image/gif" /> -->
        <link href="css/base.css" rel="stylesheet" type="text/css" />
        <link href="css/lightwindow.css" rel="stylesheet" type="text/css" />
        <!--[if IE 6]>
            <link href="css/ie6.css" rel="stylesheet" type="text/css" />
            <script type="text/javascript">
                var ie6browser = true;         
            </script>   
        <![endif]-->      
        <script type="text/javascript" src="js/util/util.js"></script>
        <script type="text/javascript" src="js/prototype/prototype.js"></script>
        <script type="text/javascript" src="js/scriptaculous/scriptaculous.js"></script>
        <script type="text/javascript" src="js/scriptaculous/effects.js"></script>
        <script type="text/javascript" src="js/scriptaculous/lightwindow.js"></script>

<link rel="stylesheet" type="text/css" href="js/ext/resources/css/ext-all.css">
 
		  <!-- Include here your own css files if you have them. -->
 
		  <!-- First of javascript includes must be an adapter... -->
		  <script type="text/javascript" src="js/ext/adapter/ext/ext-base.js"></script>
		 
		  <!-- ...then you need the Ext itself, either debug or production version. -->
		  <script type="text/javascript" src="js/ext/ext-all-debug.js"></script>
		  <script type="text/javascript" src="js/ext/miframe.js"></script>


        <decorator:head />
    </head>
    <%

        Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        SystemUser systemUser = null;


        if (obj instanceof UserDetails) {
            systemUser = (SystemUser) obj;
        }       
        
    %>
     <script>
     	var tabs=0;
     	var win=0;
     </script>
    <body>

        <div id="container">

            <div id="header">
                <h1><a href="/ivela-web/index.jsp" class="logotipo"  style="position:relative;top:-10px" title="<s:property value="front.home.title" />"><s:text name="front.pageTitle" /></a></h1>

                <div class="profile">

                    <%--<s:property value="profilePhoto" />--%>
                    <span><img src="RenderServletProfile?id=<%= systemUser.getId()%>" title="Perfil" style="height: auto; width:auto; max-height: 43px; max-width: 43px;"/></span>
                    <h2><%= (systemUser.getProfile() != null && !systemUser.getProfile().getFirstName().isEmpty()) ? systemUser.getProfile().getFirstName() : systemUser.getUsername()%></h2>
                    <p></p>

                    <a  href="profile!edit.action" style="font-size: 11px; float: left;" class="lightwindow page-options" params="lightwindow_type=external,lightwindow_width=1024"><s:text name="front.editProfile" /></a>
                    <a href="j_spring_security_logout" class="logout" title="<s:property value="front.logout" />"><s:property value="front.logout" /></a>
                </div>
                <!-- end profile -->
                <br class="clear" />
            </div>
            <!-- end header -->

<div style="width:620px;position:relative;left:107px;top:-56px">
            <div class="tools">
                <span class="btn-tools" onclick="Effect.toggle('hidden', 'slide')" title="<s:text name="main.tools" />"><!--img src="images/icon/icon-tools.gif" /--><!--s:text name="main.tools"/--><!--img src="images/icon/icon-tools-arrow.gif" /--></span>
                <span class="btn-manual" onclick="document.location = '/ivela-manual'"><img src="images/icon/icon-faq.gif" title="<s:text name='main.manual'/>" /></span>
            </div>
            <!-- end tools-->

            <div id="menu">
                <ul>
                    <li id="menu_1" ><a href="index.jsp" title="<s:property value="front.home.title" />"><s:text name="front.home.title" /></a></li>
                    <li id="menu_2" ><a href="course!list.action" title="<s:property value="front.courses.title" />"><s:text name="front.courses" /></a></li>
                    <li id="menu_3" ><a href="history!show.action" title="<s:property value="front.history.title" />"><s:text name="front.history" /></a></li>
                    <!-- li id="menu_4" ><a href="note!show.action" title="<s:property value="front.calendar" />"><s:text name="front.calendar" /></a></li-->
                </ul>
            </div>

            <div class="horizontal-line-t">                 
            </div>
            
            <script>
                var get = "<%=request.getRequestURI()%>";
                var action = get.substring(get.lastIndexOf('/') + 1);
                var tab = 0;

                if(action.startsWith("home") || action.startsWith("discipline")){
                    tab = 1;
                } else if(action.startsWith("course") || action.startsWith("enrollment")) {
                    tab = 2;
                } else if(action.startsWith("history")){
                    tab = 3;
                } 
                //else if(action.startsWith("note")){
                  //  tab = 4;
                //}

                if(tab != 0){
               	 $('menu_'+tab).setAttribute(classCss(),"current");
                }
            </script>
            <!-- end menu -->
</div>

<div class="tools" style="position:relative;top:-56px;left:-5px">
                <div class="container-tools" id="hidden" style="display:none;">
                    <div class="content-tools">
                        
                        <jsp:include page="../jsp/message/tools.jsp"/>
                        
                        <jsp:include page="../jsp/forum/tools.jsp"/>

                        <br class="clear" />
                    </div>
                    <!-- end content-tools-->
                </div>
                <!-- end container-tools-->
</div>
            <div id="content" style="position:relative;top:-50px;margin-bottom: 0px">
                <s:actionmessage/>

                <decorator:body/>
                <br class="clear" />
            </div>
        </div>

        <div id="footer">
            <div id="content-footer">
                <ul>
                    <li><a href="index.jsp" title="<s:text name="front.controlPanel.title" />"><s:text name="front.controlPanel" /></a></li>
                    <li><a href="course!list.action" title="<s:property value="front.courses.title" />"><s:text name="front.courses" /></a></li>
                    <li><a href="history!show.action" title="<s:text name="front.history.title" />" class="last"><s:text name="front.history" /></a></li>
                </ul>
                <img class="logo" src="images/logo-footer.png" alt="<s:property value="front.logo.footer" />" />
            </div>
            <br class="clear" />
        </div>
    </body>
</html>
