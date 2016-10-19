/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.heig.amt.webapp.services;

import com.heig.amt.webapp.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.sql.DataSource;

/**
 *
 * @author antoi
 */
@Stateless
public class UserService implements UserServiceLocal {

    Connection connection;
    PreparedStatement pstmt;

    @Resource(lookup = "jdbc/webapp_login")
    private DataSource dataSource;

    @Override
    public long create(String username, String password) throws SQLException, IllegalArgumentException {
        if(username.length() > 40){
            throw new IllegalArgumentException("Username should be shorter than 40 characters!");
        }
        if(username.length() < 3){
            throw new IllegalArgumentException("Username should have at least 3 characters!");
        }
        // Already exists
        // Password not empty / not too long
        
        // Else server error
        
        connection = dataSource.getConnection();
        pstmt = connection.prepareStatement("INSERT INTO users (username, password) VALUE (?,?)", Statement.RETURN_GENERATED_KEYS);
        pstmt.setString(1, username);
        pstmt.setString(2, password);

        pstmt.executeUpdate();
        ResultSet rs = pstmt.getGeneratedKeys();
        connection.close();

        if (rs.next()) {
            return rs.getInt(1);
        }
        
        return -1;
    }

    @Override
    public long login(String username, String password) throws SQLException, IllegalArgumentException {
        connection = dataSource.getConnection();
        pstmt = connection.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();
        connection.close();

        if (rs.next()) {
            return rs.getInt("id");
        }
        
        return -1;
    }

    @Override
    public User get(long id) throws SQLException, IllegalArgumentException {
        connection = dataSource.getConnection();
        pstmt = connection.prepareStatement("SELECT * FROM users WHERE id = ?");
        pstmt.setLong(1, id);
        ResultSet rs = pstmt.executeQuery();
        connection.close();

        if (rs.next()) {
            return new User(rs.getString("username"), rs.getString("password"));
        }
        
        return null;
    }

    @Override
    public List<User> findAll() throws SQLException, IllegalArgumentException {
        List<User> users = new ArrayList<>();
        connection = dataSource.getConnection();
        pstmt = connection.prepareStatement("SELECT * FROM users");
        ResultSet rs = pstmt.executeQuery();
        connection.close();

        while (rs.next()) {
            users.add(new User(rs.getString("username"), rs.getString("password")));
        }
        return users;
    }

    @Override
    public boolean delete(long id) throws SQLException, IllegalArgumentException {
        connection = dataSource.getConnection();
        pstmt = connection.prepareStatement("DELETE FROM users WHERE id=?");
        pstmt.setLong(1, id);

        int rows = pstmt.executeUpdate();

        connection.close();

        return rows > 0;
    }

    @Override
    public boolean update(long id, User user) throws SQLException, IllegalArgumentException {
        connection = dataSource.getConnection();
        pstmt = connection.prepareStatement("UPDATE users SET username=?, password=? WHERE id=?");
        pstmt.setString(1, user.getUsername());
        pstmt.setString(2, user.getPassword());
        pstmt.setLong(3, (int) id);

        int rows = pstmt.executeUpdate();

        connection.close();

        return rows > 0;
    }

}
