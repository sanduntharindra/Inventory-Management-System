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
public class OrdersDAO {
    String url = "jdbc:mysql://localhost:3306/store";
    String username = "root";
    String password = "";
    
    
    public void input(String o_id , String o_type, String o_prodname, String o_qty, String o_date) throws Exception{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            Statement st;
        st = conn.createStatement();
        String quary  = "INSERT INTO orders (o_id,o_type,o_prodname,o_qty,o_date) VALUES ('" + o_id  + "','" + o_type + "','" + o_prodname + "','" + o_qty + "','" + o_date +"')";
        st.executeUpdate(quary);
    }
    
}
