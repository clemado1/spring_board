package com.javalec.spring_board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.javalec.spring_board.dto.BDto;
import com.javalec.spring_board.util.Constant;

public class BDao {
	
	DataSource dataSource;
	
	JdbcTemplate template = null;
	
	public BDao() {
		
		template = Constant.template;
	}
	
	public int findbId() {
		
		String query = "SELECT max(bid) FROM board";
		
		int bid =  template.queryForObject(query, Integer.class) + 1;
		
		return bid;
	}
	
	public ArrayList<BDto> list() {

		String query = "SELECT bid, bname, btitle, bdate, bhit, bgroup, bstep, bindent "
				+ "FROM board ORDER BY bgroup DESC, bstep ASC";
		
		return (ArrayList<BDto>) template.query(query, new BeanPropertyRowMapper<BDto>(BDto.class));

	}
	
	public void write(final String bName, final String bTitle, final String bContent) {
		final int bid = findbId();
		
		template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				String query = "INSERT INTO board VALUES(?, ?, ?, ?, sysdate(), 0, ?, 0, 0)";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, bid);
				pstmt.setString(2, bName);
				pstmt.setString(3, bTitle);
				pstmt.setString(4, bContent);
				pstmt.setInt(5, bid);
				
				return pstmt;
			}
		});
	}
	public void upHit(final String bId) {
		
		String query = "UPDATE board SET bhit = bhit + 1 WHERE bid = ?";
		template.update(query, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setInt(1, Integer.parseInt(bId));
				
			}
		});
	
	}
	public BDto contentView(String bId) {
		
		upHit(bId);
		String query = "SELECT * FROM board WHERE bid = ?";
		return template.queryForObject(query, new Object[]{bId}, new BeanPropertyRowMapper<BDto>(BDto.class));

	}
	
	private void replyShape(final String strGroup, final String strStep) {
		String query = "update board set bStep = bStep + 1 where bGroup = ? and bStep > ?";
		
		template.update(query, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setInt(1, Integer.parseInt(strGroup));
				ps.setInt(2, Integer.parseInt(strStep));
			}
		});
	}
	public void reply(final String bId, final String bName, final String bTitle, final String bContent, final String bGroup, final String bStep, final String bIndent) {
		
		replyShape(bGroup, bStep);
		final int bid = findbId();
		String query = "INSERT INTO board VALUES(?, ?, ?, ?, sysdate(), 0, ?, ?, ?)";
		
		template.update(query, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setInt(1, bid);
				ps.setString(2, bName);
				ps.setString(3, bTitle);
				ps.setString(4, bContent);
				ps.setInt(5, Integer.parseInt(bGroup));
				ps.setInt(6, Integer.parseInt(bStep)+1);
				ps.setInt(7, Integer.parseInt(bIndent)+1);
			}
		});
	}
	public BDto replyView(String bId) {
		
		String query = "SELECT * FROM board WHERE bid = ?";
		return template.queryForObject(query, new Object[] { bId }, new BeanPropertyRowMapper<BDto>(BDto.class));
	
	}
	
	public void modify(final String bId, final String bTitle, final String bContent) {
		String sql = "UPDATE board SET btitle = ?, bcontent = ? WHERE bid = ?";
		
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setString(1, bTitle);
				ps.setString(2, bContent);
				ps.setInt(3, Integer.parseInt(bId));
				
			}
		});
	}
	public void delete(final String bId) {
		
		String query = "DELETE FROM board WHERE bid = ?";
		
		template.update(query, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setInt(1, Integer.parseInt(bId));
			}
		});
	}
}
