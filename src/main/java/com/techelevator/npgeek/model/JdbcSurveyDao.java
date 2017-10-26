package com.techelevator.npgeek.model;

import java.util.Map;
import java.util.TreeMap;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcSurveyDao implements SurveyDao {
	
	private JdbcTemplate jdbcTemplate;
	
	
	@Autowired  //telling Spring give me these objects  (dependency injection)
	public JdbcSurveyDao(DataSource dataSource) {  //datasource that defined in Spring dispatcher servlet
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	
	@Override
	public Map<String, Integer> getTop5Results() {
		
		Map<String, Integer> surveyResults = new TreeMap<>();
		
		String sqlSelectAllSurveys = "SELECT COUNT(s.parkcode) AS countpark, p.parkname FROM survey_result s JOIN park p ON p.parkcode = s.parkcode GROUP BY p.parkcode ORDER BY countpark, p.parkname ASC LIMIT 5";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllSurveys);
		
		while(results.next()) {
			surveyResults.put(results.getString("parkname"), results.getInt("countpark"));
		}
		
		return surveyResults;
	}

	@Override
	public void save(Survey survey) {
		
			Long id = getNextId();
			String sqlInsertSurveyResult = "INSERT INTO survey_result(surveyid, parkcode, emailaddress, state, activitylevel) VALUES (?,?,?,?,?)";
			jdbcTemplate.update(sqlInsertSurveyResult, id, survey.getParkcode(), survey.getEmailAddress(), survey.getState(), survey.getActivityLevel());
			survey.setSurveyId(id);
		}

		private Long getNextId() {
			String sqlSelectNextId = "SELECT NEXTVAL('seq_surveyId')";
			SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
			Long id = null;
			if(results.next()) {
				id = results.getLong(1);
			} else {
				throw new RuntimeException("Something strange happened, unable to select next forum post id from sequence");
			}
			return id;
		}
		

	}

