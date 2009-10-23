<%--
#############################################################################################
# Copyright(c) 2008-2009 by IBM Brasil Ltda and others                                      #
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
# File: tools.jsp                                                                           #
# Document: Tools Messages                                                                  # 
# Date        - Author(Company)                   - Issue# - Summary                        #
# 05-SEP-2008 - Jefferson                         - XXXXXX - Initial Version                #
# 23-JUL-2009 - Rafael Lagoa (Instituto Eldorado) - 000012 - Unicode (UTF-8) support        #
#############################################################################################
--%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">
    <!--
    var postBy = '<s:text name="tools.forum.postBy"/>';
    -->
</script>

<div class="forum">
    <h3><s:text name="tools.forum" /></h3>

    <div id="topics.empty">
        <p class="first-access"><s:text name="home.forum.empty" /></p>
    </div>
    <div id="topics.list"></div>
    <a href="../forum!list.action" id="btn-goto-forum" class="lightwindow page-options"
       params="lightwindow_type=external,lightwindow_width=1024"><s:text name ="tools.forum.goToForum"/></a>

</div>
