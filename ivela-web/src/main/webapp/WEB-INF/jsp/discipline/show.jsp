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
# File: show.jsp                                                                            #
# Document: Show Discipline                                                                 #
# Date        - Author(Company)                   - Issue# - Summary                        #
# 15-JUL-2008 - Nelson                            - XXXXXX - Initial Version                #
# 08-JUN-2009 - Fabio Fantato(Instituto Eldorado) - 000007 - IE7 compatibility              #
# 30-JUN-2009 - Fabio Fantato(Instituto Eldorado) - 000010 - JS no IE/FF opening repository #
# 15-JUL-2009 - Rafael Lagoa (Instituto Eldorado) - 000012 - Remove breadcrumb area         #
# 23-JUL-2009 - Rafael Lagoa (Instituto Eldorado) - 000012 - Unicode (UTF-8) support        #
# 18-AUG-2009 - Otofuji (Instituto Eldorado)      - 000015 - Initial Layout Change          #
############################################################################################# 
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%-- código para testar o layout 2 --%>
<%@ page import="org.springframework.security.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.userdetails.UserDetails"%>
<%@ page import="br.ufc.ivela.commons.model.SystemUser"%>
    <%

        Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        SystemUser systemUser2 = null;

        if (obj instanceof UserDetails) {
            systemUser2 = (SystemUser) obj;
        }
        
    %>

<head>        
    <link href="css/courses/accordion.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/ead/tools.js"></script>    
    <script type="text/javascript" src="js/accordion.js"></script>
    <script type="text/javascript" src="js/util/ajax.js"></script>
    <script type="text/javascript" src="js/util/util.js"></script>
 
    <script type="text/javascript">
        var unitId = '<s:property value="unit.id" />';        
        var urlUnitContentId = '<%= ((request.getParameter("unitContentId") != null) ? request.getParameter("unitContentId") : "")%>';
        var urlGradeId = '<%= ((request.getParameter("gradeId") != null) ? request.getParameter("gradeId") : "")%>';

        Event.observe(window, 'load', loadAccordions, false);
        Event.observe(window, 'load', viewUnitContent, false);
        
        function loadAccordions() {     
            var bottomAccordion = new accordion('vertical_container_course', {
                classNames : {
                    toggle : 'accordion_toggle_course',
                    toggleActive : 'accordion_toggle_active_course',
                    content : 'accordion_content_course'
                },
                direction : 'vertical'
            });
            //Open first one
            <s:iterator value="disciplineUnitList" status="stat">
                    if (unitId == '<s:property value="id" />') {
                        bottomAccordion.activate($$('#vertical_container_course .accordion_toggle_course')[<s:property value="%{#stat.index}" />]);
                            
                        <s:iterator value="unitContents" status="inner">
                            if (<s:property value="%{#inner.index}" /> == 0) {                                   
                                   showUnitContent('<s:property value="id" />', '<s:property value="discipline.name" />', '<s:property value="title" />', '<s:property value="grade.id" />', '<s:property value="type" />');
                            }                                
                        </s:iterator>
                    }
            </s:iterator>
                
                    //bottomAccordion.activate($$('#vertical_container_course .accordion_toggle_course')[0]);
                }
        
                function showUnitContent(unitContentId, disciplineName, unitName, gradeId, type) {
                    var courseId = '<s:property value='discipline.course.id' />';                    
                    $('unitName').innerHTML = unitName;
                    $('disciplineName').innerHTML = disciplineName;
                    
                    var hasExercise = getJsonFromUrl('exercise!getExerciseUnitContentJson.action?unitContent.id=' + unitContentId);
                    var hasExam = getJsonFromUrl('exam!getExamUnitContentJson.action?unitContent.id=' + unitContentId);
 
                    var hasForuns = getJsonFromUrl('forum!getOpenForunsByCourseJson.action?course.id=' + courseId);
                    
                    if (hasExercise == "" && sessionTimeout == true) {
                        returnToHome();
                        return;
                    }
                    
                    if(hasExercise.count==0){
                        $('exerciseWithQuestions').style.display = "none";
                        $('exerciseWithNoQuestions').style.display = "block";
                    }else{
                        $('exerciseWithQuestions').style.display = "block";
                        $('exerciseWithNoQuestions').style.display = "none";
                    }
                    
                    if(hasExam.count==0){
                        $('examWithQuestions').style.display = "none";
                        $('examWithNoQuestions').style.display = "block";
                    }else{
                        $('examWithQuestions').style.display = "block";
                        $('examWithNoQuestions').style.display = "none";
                    }
                    
                    if(hasForuns.count==0){
                       $('forumOpened').style.display = "none";
                       $('forumNotOpened').style.display = "block";
                    }else{
                       $('forumOpened').style.display = "block";
                       $('forumNotOpened').style.display = "none";
                    }
                   
                        $('pnlExercicios').href = 'exercise!listExerciseByUnitContent.action?unitContent.id=' + unitContentId+'&course.id='+courseId;
                                       
                        $('pnlAvaliacao').href = 'exam!listExamByUnitContent.action?unitContent.id=' + unitContentId+'&course.id='+courseId;
                     
                    $('pnlRepositorio').href = 'repository!show.action?courseId=' + courseId
                    
                    $('pnlForum').href = 'forum!listByCourse.action?course.id=' + courseId;
            
                    var html = '';                    
                    if (type == '1') {
                        
                        html += '<iframe id="pdf" scrolling="no" frameborder="0" width="820">" height="772" src="discipline!showPdf?unitContent.id=' + unitContentId + '&gradeId=' + gradeId + '"></iframe> <br class="clear"/>';
                    
                    } else if(type == 3) {
                        var jsonUnitContent = getJsonFromUrl('unitContent!getUnitContentJson.action?unitContent.id=' + unitContentId);
                        if (jsonUnitContent == "" && sessionTimeout == true) {
                            returnToHome();
                            return;
                        }
                        var _width = 820;
                        var _height = 1000;
                        if (jsonUnitContent.unitContent.width != null && jsonUnitContent.unitContent.width != '')
                            _width = jsonUnitContent.unitContent.width;
                        if (jsonUnitContent.unitContent.height != null && jsonUnitContent.unitContent.height != '')
                            _height = jsonUnitContent.unitContent.height;
                        html += '<iframe id="html" name="UnitContentFrame" onload="addUnitContentListener(this);" scrolling="no" frameborder="0"  width="' + _width + '" height="' + _height + '" src="RenderDynamicHtml?unitContent.id=' + unitContentId + '&gradeId=' + gradeId + '"></iframe> <br class="clear"/>';


                    } else {
                        var jsonUnitContent = getJsonFromUrl('unitContent!getUnitContentJson.action?unitContent.id=' + unitContentId);
                        if (jsonUnitContent == "" && sessionTimeout == true) {
                            returnToHome();
                            return;
                        } 
                        var unitId = jsonUnitContent.unitContent.unitId;
                        var jsonUnit = getJsonFromUrl('unit!getUnitJson.action?unit.id=' + unitId);
                        var disciplineId = jsonUnit.unit.disciplineId;
                        //width="665" height="1000"
                        var _width =700;
                        var _height = 1000;
                        if (jsonUnitContent.unitContent.width != null && jsonUnitContent.unitContent.width != '')
                            _width = jsonUnitContent.unitContent.width;
                        if (jsonUnitContent.unitContent.height != null && jsonUnitContent.unitContent.height != '')
                            _height = jsonUnitContent.unitContent.height;
                        html += '<iframe id="html" name="UnitContentFrame" onload="addUnitContentListener(this);" scrolling="no" frameborder="0" width="' + _width + '" height="' + _height + '" src="RenderServlet?file=' + courseId + '/' + disciplineId + '/' + unitId + "/" + unitContentId + '/index.html' + '"></iframe> <br class="clear"/>';
                    }
                    $('unitContent').innerHTML = html;
                   // $('pnlChat').href = 'IRCIvelaClientServlet?course.id=' + courseId +'&discipline.id='+disciplineId;
                    
                    // update the progress bar
                    getCourseProgress(courseId);
                }

                function showUnitContentJson(unitContentId, gradeId, courseId, unitName, disciplineName) {
                    $('unitName').innerHTML = unitName;
                    $('disciplineName').innerHTML = disciplineName;
            
                    $('pnlExercicios').href = 'exercise!listExerciseByUnitContent.action?unitContent.id=' + unitContentId+'&course.id='+courseId;
                    $('pnlAvaliacao').href = 'exam!listExamByUnitContent.action?unitContent.id=' + unitContentId+'&course.id='+courseId;
                    $('pnlRepositorio').href = 'repository!show.action?courseId=' + courseId;
                    $('pnlForum').href = 'forum!listByCourse.action?course.id=' + courseId;
            
                    var html = '';
                    html += '<iframe id="pdf" scrolling="no" frameborder="0" width="700") %>" height="772" src="discipline!showPdf.action?unitContent.id=' + unitContentId + '&grade.id=' + gradeId + '"></iframe> <br class="clear"/>';
                    $('unitContent').innerHTML = html;

                    // update the progress bar
                    getCourseProgress(courseId);
                }


    
        
                function viewUnitContent() {
                    if (urlUnitContentId != '' && urlGradeId != '') {
                        var unitContent = getJsonFromUrl('unitContent!getUnitContentJson.action?unitContent.id=' + urlUnitContentId);
                        var grade = getJsonFromUrl('grade!getGradeJson.action?grade.id=' + urlGradeId);
                        if (unitContent == "" && sessionTimeout == true) {
                            returnToHome();
                            return;
                        } 
                        var gradeId = grade.grade.id;
                        var courseId = grade.grade.course.id;
                        var unitName = unitContent.unitContent.unit.name;
                        var disciplineName = unitContent.unitContent.unit.discipline.name;
            
                        showUnitContentJson(urlUnitContentId, urlGradeId, courseId, unitName, disciplineName);
                    }

                    // update the progress bar
                    getCourseProgress('<s:property value='discipline.course.id' />');
                }
    </script>

</head>
<s:actionerror />

   <div id="sidebar">
            <h2 style="display:none"><span id="disciplineName">&nbsp;</span><br /><span id="unitName">&nbsp;</span></h2>

    <div class="units-container">
        <div class="units-content" style="padding-left: 0px; padding-right: 0px; width: 105px;>
            <div class="accordion_content_course">
            <ul>
                <div class="list-class">
            <ul>
                <li><a><s:text name="home.progress" /> <span class="label" id="course.<s:property value="discipline.course.id" />.progress">0%</span></a></li>
                    <p class="progress">
                        <span class="box-bar"><img id="course.<s:property value="discipline.course.id" />.image" height="11" width="35" src="images/progress-bar/bar.gif" alt="progress bar" /></span>
                    </p>
            </ul>
                    <div id="exerciseWithQuestions" style="display:block">
            <ul>
                    <li><a id="pnlExercicios" href="" id="btn-goto-exercicios" class="lightwindow page-options" params="lightwindow_type=external,lightwindow_width=1024"><s:text name ="discipline.show.exercise"/></a></li>
            </ul>
                    </div>

                    <div id="exerciseWithNoQuestions" style="display:none">
            <ul>
                    <li><a style="color:#ccc;"><s:text name ="discipline.show.exercise"/></a></li>
            </ul>
                    </div>
                    <div id="examWithQuestions" style="display:block">
            <ul>
                    <li><a id="pnlAvaliacao" href="" id="btn-goto-avaliacao" class="lightwindow page-options" params="lightwindow_type=external,lightwindow_width=1024" ><s:text name ="discipline.show.exam"/></a></li>
            </ul>
                    </div>

                    <div id="examWithNoQuestions" style="display:none">
            <ul>
                    <li><a style="color:#ccc;"><s:text name ="discipline.show.exam"/></a></li>
            </ul>
                    </div>
                    <div id="repositorioOpened" style="display:block;height:40px;min-height:35px">
            <ul>
                    <li ><a id="pnlRepositorio" href="repository!show.action?courseId=<s:property value="discipline.course.id" />" class="lightwindow page-options" params="lightwindow_type=external,lightwindow_width=1024" ><s:text name="discipline.show.biblioteca"/></a></li>
            </ul>
                    </div>
                    <div id="forumOpened" style="display:block">
            <ul>
                    <li><a id="pnlForum" href="forum!listByCourse.action?course.id=<s:property value="discipline.course.id" />" class="lightwindow page-options" params="lightwindow_type=external,lightwindow_width=1024"><s:text name ="discipline.show.forum"/></a></li>
            </ul>
                    </div>

                    <div id="forumNotOpened" style="display:none">
            <ul>
                    <li><a style="color:#ccc;"><s:text name ="discipline.show.forum"/></a></li>
            </ul>
                    </div>
                   <div id="chatOpened" style="display:block">
            <ul>
                    <li><a href="course!showChatStd.action?courseId=<s:property value="discipline.course.id" />&disciplineId=<s:property value="discipline.id" />" target="blank"><s:text name="discipline.show.chat" /></a></li>
            </ul>
                    </div>
                </div>
            </div>
        </div>     
    </div>
<!-- end sidebar -->

<div id="vertical_container_course" style="margin-top:10px">
    <div class="units-container">
        <div class="units-content">
            <s:iterator value="disciplineUnitList" status="stat">
                <s:if test="(name.trim().length() > 17)">
                    <h3 class="accordion_toggle_course"><s:property value="name.substring(0, 17)" />...</h3>
                </s:if>
                <s:else>
                    <h3 class="accordion_toggle_course"><s:property value="name" /></h3>
                </s:else>
                <div class="accordion_content_course">
                    <div class="list-class">
                        <ul>
                            <s:iterator value="unitContents">
                                <li><a href="#" onclick="showUnitContent('<s:property value="id" />', '<s:property value="discipline.name" />', '<s:property value="title" />', '<s:property value="grade.id" />', '<s:property value="type" />')"><s:property value="title" /></a></li>
                            </s:iterator>
                        </ul>
                    </div>
                </div>
            </s:iterator>
        </div>
    </div>
</div>
<!-- end Unit Index -->


<!-- Lesson Content -->
<div class="lesson-content">
     <div id="unitContent"></div>
</div>
    
    
    <br class="clear" />

