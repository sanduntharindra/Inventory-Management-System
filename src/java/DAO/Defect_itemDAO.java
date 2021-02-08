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
public class Defect_itemDAO {
    String url = "jdbc:mysql://localhost:3306/store";
    String username = "root";
    String password = "";
    
    /**
     *
     * @param Date
     * @param Type
     * @param Product
     * @param Quantity
     * @throws Exception
     */
    public void input(String d_name, String d_type, String d_quanity, String d_date, String w_id) throws Exception{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            Statement st;
        st = conn.createStatement();
        String quary  = "INSERT INTO defect_items (d_name,d_type,d_quanity,d_date,w_id) VALUES ('" + d_name + "','" + d_type + "','" + d_quanity + "','" + d_date + "','" + w_id + "')";
        st.executeUpdate(quary);
    }
}
    

