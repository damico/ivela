/**
 * @(#)GetScore.java
 *
 * Eldorado Confidential and Proprietary Information
 * Copyright (C)2010 Eldorado, All Rights Reserved
 *
 * Histórico de Modificações
 *
 * Data           Quem              Descrição
 * ------------------------------------------------------------------------------------------------
 * 07 May 2010    Rafael Lagoa      (4115)Reajuste arquitetural.  
 */
package br.org.eldorado.offline.browser.function;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.browser.BrowserFunction;

import br.org.eldorado.offline.common.ConnectionUtil;
import br.org.eldorado.offline.common.LogWrapper;
import br.org.eldorado.offline.dao.CourseDAO;
import br.org.eldorado.offline.dao.TranscriptDAO;
import br.org.eldorado.offline.dao.ibatis.CourseDAOImpl;
import br.org.eldorado.offline.dao.ibatis.TranscriptDAOImpl;
import br.org.eldorado.offline.domain.Course;
import br.org.eldorado.offline.domain.Transcript;
import br.org.eldorado.offline.domain.TranscriptExample;

public class GetScore extends BrowserFunction {

    private static LogWrapper logger = new LogWrapper(GetScore.class);
    private static CourseDAO courseDao = new CourseDAOImpl(ConnectionUtil.getSqlMapClient());
    private static TranscriptDAO transcriptDao = new TranscriptDAOImpl(ConnectionUtil.getSqlMapClient());

    public GetScore (Browser browser, String name) {
        super (browser, name);
    }
    public Object function (Object[] arguments) {
        String scoreType = arguments[0].toString();
        String score = "";
        TranscriptExample transcriptExample = new TranscriptExample();
        List<Transcript> transcripts = null;
        try {
            transcripts = transcriptDao.selectByExample(transcriptExample);
        } catch (SQLException e) {
        	logger.error(e);
        }

        if (transcripts.isEmpty()) {
            score = "0 pontos";
        } else {
            Transcript transcript = transcripts.get(0);
            StringBuilder builder = new StringBuilder();
            int total = (int) transcript.getChallengesTotal().doubleValue();
            builder.append(total);
            if (scoreType.equals("current")) {
                builder.append(' ');
                int currentP = transcript.getChallengesWeight() * 100;
                builder.append("de ");
                builder.append(currentP);
            } else if (scoreType.equals("total")) {
                builder.append(' ');
                Course course = null;
                try {
                    course = courseDao.selectByPrimaryKey(new Long(1));
                } catch (SQLException e) {
                	logger.error(e);
                }
                int totalP = course.getChallengeWeight() * 100;
                builder.append("de ");
                builder.append(totalP);
            }
            builder.append(" pontos");

            score = builder.toString();
        }
        return score;
    }

    public static String getScore() throws SQLException {
        String score = "";
        TranscriptExample transcriptExample = new TranscriptExample();
        List<Transcript> transcripts = null;
        try {
            transcripts = transcriptDao.selectByExample(transcriptExample);
        } catch (SQLException e) {
        	logger.error(e);
        }

        if (transcripts.isEmpty()) {
            score = "0";
        } else {
            Transcript transcript = transcripts.get(0);
            BigDecimal total = transcript.getAverageChallenge();
            score = total.toString();
        }
        return score;
    }
}