<%-- 
    Document   : list Discipline
    Created on : Jul 15, 2008, 1:48:45 PM
    Author     : nelson
--%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%-- c�digo para testar o layout 2 --%>
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
    <link href="RenderServlet?file=/globals/css/internas<%= ((systemUser2.getUsername().equals("layout")) ? "_v2" : "") %>.css" rel="stylesheet" type="text/css" />
    <link href="RenderServlet?file=/globals/css/accordion<%= ((systemUser2.getUsername().equals("layout")) ? "_v2" : "") %>.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/ead/tools.js"></script>
    <script type="text/javascript" src="js/accordion.js"></script>
    <script type="text/javascript" src="js/ead/ajax.js"></script>
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
            // Open first one
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
                     
                    
                    //$('pnlRepositorio').href = 'repository!list.action?courseId=' + courseId;

                    $('pnlRepositorio').href = 'repository!show.action?courseId=' + courseId

                    $('pnlForum').href = 'forum!listByCourse.action?course.id=' + courseId;
            
                    var html = '';
                    if (type == '1') {
                        
                        html += '<iframe id="pdf" scrolling="no" frameborder="0" width="820">" height="772" src="discipline!showPdf?unitContent.id=' + unitContentId + '&gradeId=' + gradeId + '"></iframe> <br class="clear"/>';
                    
                    } else if(type == 3) {
                        var jsonUnitContent = getJsonFromUrl('unitContent!getUnitContentJson.action?unitContent.id=' + unitContentId);
                        var _width = 820;
                        var _height = 1000;
                        if (jsonUnitContent.unitContent.width != null && jsonUnitContent.unitContent.width != '')
                            _width = jsonUnitContent.unitContent.width;
                        if (jsonUnitContent.unitContent.height != null && jsonUnitContent.unitContent.height != '')
                            _height = jsonUnitContent.unitContent.height;
                        html += '<iframe id="html" scrolling="no" frameborder="0"  width="' + _width + '" height="' + _height + '" src="RenderDynamicHtml?unitContent.id=' + unitContentId + '&gradeId=' + gradeId + '"></iframe> <br class="clear"/>';


                    } else {
                        var jsonUnitContent = getJsonFromUrl('unitContent!getUnitContentJson.action?unitContent.id=' + unitContentId);
                        var unitId = jsonUnitContent.unitContent.unitId;
                        var jsonUnit = getJsonFromUrl('unit!getUnitJson.action?unit.id=' + unitId);
                        var disciplineId = jsonUnit.unit.disciplineId;
                        //width="665" height="1000"
                        var _width = <%= ((systemUser2.getUsername().equals("layout")) ? "925" : "700") %>;
                        var _height = 1000;
                        if (jsonUnitContent.unitContent.width != null && jsonUnitContent.unitContent.width != '')
                            _width = jsonUnitContent.unitContent.width;
                        if (jsonUnitContent.unitContent.height != null && jsonUnitContent.unitContent.height != '')
                            _height = jsonUnitContent.unitContent.height;
                        html += '<iframe id="html" scrolling="no" frameborder="0" width="' + _width + '" height="' + _height + '" src="RenderServlet?file=' + courseId + '/' + disciplineId + '/' + unitId + "/" + unitContentId + '/index.html' + '"></iframe> <br class="clear"/>';
                    }
                    $('unitContent').innerHTML = html;
                   // $('pnlChat').href = 'IRCIvelaClientServlet?course.id=' + courseId +'&discipline.id='+disciplineId;

                }

                function showUnitContentJson(unitContentId, gradeId, courseId, unitName, disciplineName) {
                    $('unitName').innerHTML = unitName;
                    $('disciplineName').innerHTML = disciplineName;
            
                    $('pnlExercicios').href = 'exercise!listExerciseByUnitContent.action?unitContent.id=' + unitContentId+'&course.id='+courseId;
                    $('pnlAvaliacao').href = 'exam!listExamByUnitContent.action?unitContent.id=' + unitContentId+'&course.id='+courseId;
                    $('pnlRepositorio').href = 'repository!show.action?courseId=' + courseId;
                    $('pnlForum').href = 'forum!listByCourse.action?course.id=' + courseId;
            
                    var html = '';
                    html += '<iframe id="pdf" scrolling="no" frameborder="0" width="<%= ((systemUser2.getUsername().equals("layout")) ? "925" : "700") %>" height="772" src="discipline!showPdf.action?unitContent.id=' + unitContentId + '&grade.id=' + gradeId + '"></iframe> <br class="clear"/>';
                    $('unitContent').innerHTML = html;
                }


                function getJsonFromUrl(url){
                    var json;
                    new Ajax.Request(url,
                    {
                        method:'get',
                        requestHeaders: {Accept: 'application/json'}, 
                        asynchronous: false,
                        onSuccess: function(transport) {
                            json = transport.responseText.evalJSON(true);
                        },
                        onFailure: function() { alert('Message: Something went wrong...') }
                    });
                    return json;
                }        
        
                function viewUnitContent() {
                    if (urlUnitContentId != '' && urlGradeId != '') {
                        var unitContent = getJsonFromUrl('unitContent!getUnitContentJson.action?unitContent.id=' + urlUnitContentId);
                        var grade = getJsonFromUrl('grade!getGradeJson.action?grade.id=' + urlGradeId);

                        var gradeId = grade.grade.id;
                        var courseId = grade.grade.course.id;
                        var unitName = unitContent.unitContent.unit.name;
                        var disciplineName = unitContent.unitContent.unit.discipline.name;
            
                        showUnitContentJson(urlUnitContentId, urlGradeId, courseId, unitName, disciplineName);
                    }
                }
    </script>
    
    <%
    
       if (systemUser2.getUsername().equals("layout"))
       {
           
    %>
    
    <script type="text/javascript" src="js/side-bar.js"></script>

<style>


/****************************************/

a{outline: none;}

a:active{outline: none;}

#sideBar{text-align:left;}

#sideBar h2{
	color:#FFFFFF;
	font-size:110%;
	font-family:arial;
	margin:10px 10px 10px 10px;
	font-weight:bold !important;
}

#sideBar h2 span{
	font-size:125%;
	font-weight:normal !important;
}


#sideBar li a:link,
#sideBar li a:visited{
	color:#FFFFFF;
	font-family:verdana;
	font-size:100%;
	text-decoration:none;
	display:block;
	margin:0px 0px 0px 0px;
	padding:0px;
	width:100%;
}

#sideBar li a:hover{
	color:#FFFFFF;
	text-decoration:underline;
}

#sideBar{
	position: absolute;
        display: block;
	width: auto;
	height: auto;
	top: 225px;
        left:0px;
        background-color: #fff;
/*	background-image: url(images/background2.gif);
        background-position: top right;
        background-repeat: repeat-y;*/
        z-index: 10;
        
}

#sideBarTab{
	float:left;
	height:137px;
	width:28px;
}

#sideBarTab img{
	border:0px solid #FFFFFF;
}

#sideBarContents{
	float:left;
	overflow:hidden !important;
	width:auto;
	height:auto;
}

#sideBarContentsInner{
	width:auto;
}
</style>

    <%
    
       }
    
    %>
    
</head>
<s:actionerror />
<div id="breadcrumb">
    <p><s:text name="breadcrumb.youAreHere"/></p>
    <ul>
        <li><a href="index.action"><s:text name="home.name"/></a></li>
        <li class="current"><s:text name="home.discipline"/></li>
    </ul>
</div>

<div class="current-course">
    <span class="corner-left">.</span>
    <span class="corner-right">.</span>
    <h1><s:text name="discipline.show.course" /><s:property value="discipline.course.name" /></h1>
    <h2><s:text name="discipline.show.discipline" /><s:property value="discipline.name" /></h2>
    <div class="partner">
        
        
        <img src="RenderServletPartner?id=<s:property value="discipline.course.id" />" width="100"  />
    </div>
</div>

    <%
    
       if (systemUser2.getUsername().equals("layout"))
       {
           
    %>


<div id="sideBar">
	
	<div id="sideBarContents" style="display:none; border: 3px solid #ffe79c; border-left:none;">
		<div id="sideBarContentsInner">
                    

    
    <%
    
       }
                  
    %>
<table border="0">
    <tr>
        <td valign="top">
<div id="vertical_container_course">  
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
<!-- end col-1-home -->

    <%
    
       if (systemUser2.getUsername().equals("layout"))
       {
           
    %>                 
                
		</div>
	</div>
	<a href="#" id="sideBarTab"><img src="images/slide-button.gif" alt="Meus Cursos" title="Meus Cursos" /></a>
	
</div>

    
    <%
    
       }
                  
    %>
</td>
<td>
<div id="col-2-course">
    <div class="lesson-content">
        <div class="lesson-menu">
            <h2><span id="disciplineName">&nbsp;</span><br /><span id="unitName">&nbsp;</span></h2>
            <ul>
                <table>
                <tr>
                <td>
                    <div id="exerciseWithQuestions" style="display:block">
                    <li><a id="pnlExercicios" href="" id="btn-goto-exercicios" class="lightwindow page-options" params="lightwindow_type=external,lightwindow_width=1024"><s:text name ="discipline.show.exercise"/></a></li>
                    </div>

                    <div id="exerciseWithNoQuestions" style="display:none">
                    <li><a style="color:#ccc;"><s:text name ="discipline.show.exercise"/></a></li>
                    </div>
                </td>
                
                <td>
                    <div id="examWithQuestions" style="display:block">
                    <li><a id="pnlAvaliacao" href="" id="btn-goto-avaliacao" class="lightwindow page-options" params="lightwindow_type=external,lightwindow_width=1024" ><s:text name ="discipline.show.exam"/></a></li>
                    </div>

                    <div id="examWithNoQuestions" style="display:none">
                    <li><a style="color:#ccc;"><s:text name ="discipline.show.exam"/></a></li>
                    </div>
                    
                </td>
                
                <td>
                    <li><a id="pnlRepositorio" href="#" id="btn-goto-avaliacao" class="lightwindow page-options" params="lightwindow_type=external,lightwindow_width=1024" ><s:text name="discipline.show.biblioteca"/></a></li>
                </td>
                
                <td>
                    <div id="forumOpened" style="display:block">
                    <li><a id="pnlForum" href="forum!listByCourse.action?course.id=<s:property value="discipline.course.id" />" class="lightwindow page-options" params="lightwindow_type=external,lightwindow_width=1024"><s:text name ="discipline.show.forum"/></a></li>
                    </div>

                    <div id="forumNotOpened" style="display:none">
                    <li><a style="color:#ccc;"><s:text name ="discipline.show.forum"/></a></li>
                    </div>
                    
                    
                </td>
                
                <td>
                   <div id="chatOpened" style="display:block">
                    <li><a href="course!showChatStd.action?course.id=<s:property value="discipline.course.id" />&discipline.id?=<s:property value="discipline.id" />" target="blank"><s:text name="discipline.show.chat" /></a></li>
                    </div>
                </td>
                
                </tr>
                
                </table>
            </ul>
            <br class="clear" />
        </div>
        
        <div id="unitContent"></div>
    </div>
    
    <!-- end col-2-home -->
    
    <br class="clear" />
</div>
</td>
</tr>
</table>