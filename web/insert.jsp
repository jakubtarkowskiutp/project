<%-- 
    Document   : insert data
    Created on : 2017-06-27, 08:49:05
    Author     : Jakub
--%>


<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dodawanie do bazy</title>
    </head>
<body background="C:\Users\Jakub\Documents\NetBeansProjects\Project\1.jpg"><center>
        
        <%
            String name = request.getParameter("IMIE");
            String surname = request.getParameter("NAZWISKO");
            
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","P@ssw0rd");
        Statement st = con.createStatement();
        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        
        
        st.executeUpdate("INSERT INTO dane (IMIE, NAZWISKO, DATA)VALUES('"+name+"','"+surname+"','"+timeStamp+"')");
        
        out.println("Dodawanie przebiegło pomyślnie");
        
        }catch(Exception e){
        
        out.println(e);
        
        }
        %>
        <form  action="index.jsp" >
                <input type="submit" value="Wróć"/>              
                </form>
</center>
    </body>
</html>
