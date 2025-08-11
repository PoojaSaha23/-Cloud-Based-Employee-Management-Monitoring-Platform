package com.ems.dao.AdminPortal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminLoginDao 
{
	@Autowired
    private JdbcTemplate jdbcTemplate;

    public int validateAdmin(String username, String password) 
    {
        String sql = "SELECT COUNT(*) FROM Admin WHERE username=? AND password=?";
        Integer count = jdbcTemplate.queryForObject(sql, new Object[]{username, password}, Integer.class);
        return count;
    }

}
