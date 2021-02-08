/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 *
 * @author Sandun
 */
public class Stock_updateDAO {
    String url = "jdbc:mysql://localhost:3306/store";
    String username = "root";
    String password = "";
    
    
    public void input(String p_id, String p_name, String p_type, String p_availability, String p_date,String w_id) throws Exception{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            Statement st;
        st = conn.createStatement();
        String quary  = "INSERT INTO products (p_id,p_name,p_type,p_availability,p_date,w_id) VALUES ('" + p_id + "','" + p_name + "','" + p_type + "','" + p_availability + "','" + p_date + "','" + w_id +"')";
        st.executeUpdate(quary);
    }
}
    
    

