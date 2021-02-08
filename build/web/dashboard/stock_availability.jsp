<%-- 
    Document   : login
    Created on : 04-Feb-2021, 13:12:24
    Author     : Sandun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Dashboard | Stock Availability</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.0.2/tailwind.min.css'>
  <link rel="stylesheet" href="../css/dsh_style.css">
  <script>
    var stockObject = {
      "Cables": {
        "Copper": [],
        "Fiber Optic": [],
        "Telephone": []    
      },
      "Fiber Accessories": {
        "Fiber Patch": [],
        "PIG Talis": [],
        "Fiber Connectors": []
      },
      "WifiSystem": {
        "Outdoor Accesspoint": [],
        "indoor Accesspoint": [],
        "Access point": []
      },
      "Home Automation": {
        "Smartlock System": [],
        "Smart Lighting": [],
        "IP intercom": []
     }
 }
    window.onload = function() {
      var typeSel = document.getElementById("type");
      var productSel = document.getElementById("product");
      for (var x in stockObject) {
        typeSel.options[typeSel.options.length] = new Option(x, x);
      }
      typeSel.onchange = function() {
        //empty Product dropdown
        productSel.length = 1;
        //display correct values
        for (var y in stockObject[this.value]) {
          productSel.options[productSel.options.length] = new Option(y, y);
        }
      }
    }
  </script>
  <style>
      .Lbtn{
    height:40px;
    width:100px;
    background-color:red;
    color: white;
     border-radius: 8px;
}
      .sbtn{
    height:40px;
    width:100px;
    background-color:orange;
    color: white;
    border-radius: 8px;
}
  </style>


</head>

<body>
<%@include file="logged_header.jsp" %>
  <!-- partial:index.partial.html -->
  <aside id="sidenav-open" class="h-screen">
    <nav class="flex flex-col justify-between h-full p-5 border-r bg-gray-50">
      <div>
        <a href="stock_update.jsp" class="flex items-center p-3 rounded-xl hover:bg-gray-200">
          <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-7 text-gray-900" fill="currentColor"
            viewBox="0 0 16 16">
            <path
              d="M6 1H1v14h5V1zm9 0h-5v5h5V1zm0 9v5h-5v-5h5zM0 1a1 1 0 0 1 1-1h5a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V1zm9 0a1 1 0 0 1 1-1h5a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1h-5a1 1 0 0 1-1-1V1zm1 8a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1v-5a1 1 0 0 0-1-1h-5z" />
          </svg>
          <span class="text-gray-900">Stock Update</span>
        </a>

        <a href="stock_availability.jsp" class="flex items-center p-3 rounded-xl bg-gray-200">
          <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-7 text-gray-900" fill="currentColor"
            viewBox="0 0 16 16">
            <path
              d="M4 11a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1zm6-4a1 1 0 1 1 2 0v5a1 1 0 1 1-2 0V7zM7 9a1 1 0 0 1 2 0v3a1 1 0 1 1-2 0V9z" />
            <path
              d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z" />
            <path
              d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z" />
          </svg>
          <span class="text-gray-900">Stock Availability >></span>
        </a>

        <a href="orders.jsp" class="flex items-center p-3 rounded-xl hover:bg-gray-200">
          <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-7 text-gray-900" fill="currentColor"
            viewBox="0 0 16 16">
            <path
              d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
          </svg>
          <span class="text-gray-900">Orders</span>
        </a>

        <a href="defect_item.jsp" class="flex items-center p-3 rounded-xl hover:bg-gray-200">
          <svg xmlns="http://www.w3.org/2000/svg" class="mr-2 w-7 text-gray-900" fill="currentColor"
            viewBox="0 0 16 16">
            <path d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z" />
            <path
              d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z" />
            <path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4z" />
          </svg>
          <span class="text-gray-900">Defect Items</span>
        </a>


      </div>

      <div class="flex justify-between">
        <a href="#" class="flex items-center p-2 rounded-xl hover:bg-gray-50 hover:text-blue-700">
            <path
              d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
          </svg>
          <span class="text-xs">Inventory</span>
        </a>
        <a href="#" class="flex items-center p-2 rounded-xl hover:bg-gray-50 hover:text-blue-700">
            <path
              d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z" />
          </svg>
          <span class="text-xs">Management</span>
        </a>
        <a href="#" class="flex items-center p-2 rounded-xl hover:bg-gray-50 hover:text-blue-700">
            <path
              d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.122C.002 7.343.01 6.6.064 5.78l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z" />
          </svg>
          <span class="text-xs">System</span>
        </a>
      </div>
    </nav>

    <a href="#" id="sidenav-close" title="Close Menu" aria-label="Close Menu"></a>
  </aside>

  <main class="overflow-y-scroll h-screen">
    <!----------------- Header ----------------->
    <p class="mt20 text-right">User : <%= session.getAttribute("user_logged") %></p>
    <form action="../LogoutServlet" method="post">
        <div class="container text-right" >
            <input type="submit" value="Logout" class="Lbtn">
        </div>
    </form>
    <span><form class="ml-5" method="POST" action="stock_availability.jsp">
        
        Type: <select name="type" id="type">
        <option value="" selected="selected" disabled>Select type</option>
        </select>
        <br><br>
        Product: <select name="product" id="product">
        <option value="" selected="selected" disabled>Select product</option>
        </select><br><br>
        <div class="container text-center" >
        <input type="submit" value="Search" class="sbtn">
        </div>
        <br><br><hr class="solid">
        
          
    </form></span>
    
    <%
            //String id = request.getParameter("userId");
            String driverName = "com.mysql.jdbc.Driver";
            String path = "jdbc:mysql://localhost:3306/store";
            String userId = "root";
            String password = "";

            try {
            Class.forName(driverName);
            } catch (ClassNotFoundException e) {
            e.printStackTrace();
            }

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        %>
        
        <table align="center" cellpadding="5" cellspacing="1" border="0">
            <tr>

            </tr>
            <tr bgcolor="#5DADE2">
                <th>Product ID</th>
                <th>Name</th>
                <th>Type</th>
                <th>Available Qty</th>
                <th>Added Date</th>
                <th>Warehouse ID</th>
            </tr>
            <%
            try{ 
            connection = DriverManager.getConnection(path, userId, password);
            statement=connection.createStatement();
            String prod_type=request.getParameter("type");
            String prod_name=request.getParameter("product");
            
            String sql ="SELECT * FROM products WHERE p_type='" + prod_type + "' AND p_name='" + prod_name +"'";

            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
            %>
            <tr bgcolor="#D6EAF8" class="text-center">

                <td><%=resultSet.getString("p_id") %></td>
                <td><%=resultSet.getString("p_name") %></td>
                <td><%=resultSet.getString("p_type") %></td>
                <td><%=resultSet.getString("p_availability") %></td>
                <td><%=resultSet.getString("p_date") %></td>
                <td><%=resultSet.getString("w_id") %></td>
                
            </tr>

            <% 
            }

            } catch (Exception e) {
            e.printStackTrace();
            }
            %>
        </table>

    <!-- partial -->

</body>

</html>