/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Beans.Login;
import Services.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sandun
 */
public class LoginDAO {
    
    Statement stmt;
    
    public boolean userLogin(Login bean){
        
        boolean rslt = false;
        
        Connection ucon = new DbConnection().getCon();
        
        try{
            
            PreparedStatement pst = ucon.prepareStatement("SELECT * FROM users WHERE u_email='"+bean.getEmail()+"' and u_pwd='"+bean.getPassword()+"' ");
            
            ResultSet rs = pst.executeQuery();
            
            if (rs.next()) {
                rslt = true;
            } else {
                rslt = false;
            }
            
        }catch(SQLException ex){
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return rslt;
        
        
    }
}
