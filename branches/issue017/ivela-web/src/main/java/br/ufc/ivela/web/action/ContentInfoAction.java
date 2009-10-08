package br.ufc.ivela.web.action;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import br.ufc.ivela.commons.Constants;
import br.ufc.ivela.commons.model.Course;
import br.ufc.ivela.commons.model.Discipline;
import br.ufc.ivela.commons.model.FinishedUnitContent;
import br.ufc.ivela.commons.model.Grade;
import br.ufc.ivela.commons.model.SystemUser;
import br.ufc.ivela.commons.model.Unit;
import br.ufc.ivela.commons.model.UnitContent;
import br.ufc.ivela.ejb.interfaces.CourseRemote;
import br.ufc.ivela.ejb.interfaces.DisciplineRemote;
import br.ufc.ivela.ejb.interfaces.FinishedUnitContentRemote;
import br.ufc.ivela.ejb.interfaces.GradeUnitContentRemote;
import br.ufc.ivela.ejb.interfaces.SystemUserRemote;
import br.ufc.ivela.ejb.interfaces.UnitContentRemote;
import br.ufc.ivela.ejb.interfaces.UnitRemote;
import br.ufc.ivela.util.PropertiesUtil;
import br.ufc.ivela.util.PropertiesUtil.IVELA_PROPERTIES;

public class ContentInfoAction extends CourseAwareAction {

    private InputStream inputStream;   

    private CourseRemote courseRemote;
    private DisciplineRemote disciplineRemote;
    private UnitRemote unitRemote;
    private UnitContentRemote unitContentRemote;
    private GradeUnitContentRemote gradeUnitContentRemote;
    private FinishedUnitContentRemote finishedUnitContentRemote;
    private SystemUserRemote systemUserRemote;

    private Course course;
    private Discipline discipline;
    private Unit unit;
    private UnitContent unitContent;
    private Grade grade;
    private String goToPage;
    private String pageHtml;

    public String getSystemUser() {
        SystemUser systemUser = getAuthenticatedUser();
        setInputStream(new ByteArrayInputStream((systemUser.getId()+" - "+systemUser.getUsername()+" - "+systemUser.getEmail()).getBytes()));
        return "text";
    }

    public String getProgress() {
        Integer progress = courseRemote.getProgress(getAuthenticatedUser().getId(), course.getId());
        StringBuilder json = new StringBuilder();
        json.append("{");
        json.append("\"progress\":\"" + progress.intValue() + "\"");
        json.append("}");
        setInputStream(new ByteArrayInputStream(json.toString().getBytes()));
        return "json";
    }

    public String showTocCustom() {
        StringBuffer html = new StringBuffer();
        String filename = Constants.DEFAULT_CONTENTPKG_PATH + "/" + course.getId() + "/" + goToPage;
        try {
            BufferedReader in = new BufferedReader(new FileReader(filename));
            String str;
            while ((str = in.readLine()) != null) {
                html.append(str);
            }
            in.close();
        } catch (IOException ioe) {
            // do something
        }
        setPageHtml(html.toString());
        return "show";
    }

    public String showContentCustom() {
        StringBuffer html = new StringBuffer();
        String filename = Constants.DEFAULT_CONTENTPKG_PATH + "/" + course.getId() + "/" + discipline.getId() + "/" + unit.getId() + "/" + unitContent.getId() + "/" + goToPage;
        try {
            BufferedReader in = new BufferedReader(new FileReader(filename));
            String str;
            while ((str = in.readLine()) != null) {
                html.append(str);
            }
            in.close();
        } catch (IOException ioe) {
            // do something
        }

        SystemUser user = systemUserRemote.get(getAuthenticatedUser().getId());
        user.setLastUnitContentId(unitContent.getId());
        systemUserRemote.update(user);

        setPageHtml(html.toString());
        return "show";
    }
    
    
    public String showContent() {
        StringBuffer html = new StringBuffer();
        String filename = Constants.DEFAULT_CONTENTPKG_PATH + "/" + course.getId() + "/" + discipline.getId() + "/" + unit.getId() + "/" + unitContent.getId() + "/" + goToPage;
        try {
            BufferedReader in = new BufferedReader(new FileReader(filename));
            String str;
            while ((str = in.readLine()) != null) {
                html.append(str);
            }
            in.close();
        } catch (IOException ioe) {
            // do something
        }
        setPageHtml(html.toString());

        SystemUser user = systemUserRemote.get(getAuthenticatedUser().getId());
        user.setLastUnitContentId(unitContent.getId());
        systemUserRemote.update(user);

        return "show";
    }

    public String isUnlocked() {
        boolean isUnlocked = gradeUnitContentRemote.isUnlocked(grade.getId(), unitContent.getId());
        setInputStream(new ByteArrayInputStream(new Boolean(isUnlocked).toString().getBytes()));
        return "text";
    }

    public String isCompleted() {
        setInputStream(new ByteArrayInputStream("false".getBytes()));
        List<FinishedUnitContent> finishedUnitContentlist = finishedUnitContentRemote.getByUnitContentAndSystemUser(unitContent.getId(), getAuthenticatedUser().getId());
        if (!finishedUnitContentlist.isEmpty()) {
            setInputStream(new ByteArrayInputStream("true".getBytes()));
        }
        return "text";
    }

    public String finishLesson() {
        List<FinishedUnitContent> finishedUnitContentlist = finishedUnitContentRemote.getByUnitContentAndSystemUser(unitContent.getId(), getAuthenticatedUser().getId());
        if (finishedUnitContentlist.size() == 0) {
            FinishedUnitContent finishedUnitContent = new FinishedUnitContent();
            finishedUnitContent.setSystemUser(getAuthenticatedUser().getId());
            finishedUnitContent.setCourse(course.getId());
            finishedUnitContent.setUnitContent(unitContent.getId());
            finishedUnitContentRemote.add(finishedUnitContent);
        }

        boolean sendMail = gradeUnitContentRemote.sendMail(grade.getId(), unitContent.getId());
        if (sendMail) {
            HttpServletRequest request = ServletActionContext.getRequest();
            String url = "http://" + request.getServerName() + ":"
                    + request.getServerPort() + PropertiesUtil.getPropertiesUtil().getProperty(IVELA_PROPERTIES.WEB_PATH);
            if (!url.endsWith("/")) {
                url += "/";
            }
            unitContent = unitContentRemote.get(unitContent.getId());
            Map params = new HashMap();
            params.put("unitContentTitle", unitContent.getTitle());
            params.put("url", url);
            mailer.send(new SystemUser[] { getAuthenticatedUser() }, null, "lesson.finished", "lesson.finished.velocity", new Map[]{params}, true);
        }
        return "text";
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public void setCourseRemote(CourseRemote courseRemote) {
        this.courseRemote = courseRemote;
    }

    public void setGradeUnitContentRemote(GradeUnitContentRemote gradeUnitContentRemote) {
        this.gradeUnitContentRemote = gradeUnitContentRemote;
    }

    public void setFinishedUnitContentRemote(FinishedUnitContentRemote finishedUnitContentRemote) {
        this.finishedUnitContentRemote = finishedUnitContentRemote;
    }

    public void setUnitContentRemote(UnitContentRemote unitContentRemote) {
        this.unitContentRemote = unitContentRemote;
    }

    public void setSystemUserRemote(SystemUserRemote systemUserRemote) {
        this.systemUserRemote = systemUserRemote;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public void setDiscipline(Discipline discipline) {
        this.discipline = discipline;
    }

    public void setUnit(Unit unit) {
        this.unit = unit;
    }

    public void setUnitContent(UnitContent unitContent) {
        this.unitContent = unitContent;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    public void setGoToPage(String goToPage) {
        this.goToPage = goToPage;
    }

    public String getPageHtml() {
        return pageHtml;
    }

    public void setPageHtml(String pageHtml) {
        this.pageHtml = pageHtml;
    }
}