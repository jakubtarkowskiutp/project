<%-- 
    Document   : index
    Created on : 2017-06-26, 09:35:08
    Author     : Jakub
--%>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projekt N-P</title>
    </head>
    <%
        Date date = new Date();
    %>
    <body background="C:\Users\Jakub\Documents\NetBeansProjects\Project\1.jpg" no-repeat><center>
        <h1></h1>
        <p><center><%= date %></center></p>
    <h1>Projekt<br>Narzędzia programistyczne</h1>
    
        <%!
        public class Osoba {
            String URL = "jdbc:mysql://localhost:3306/project";
            String USERNAME = "root";
            String PASSWORD = "P@ssw0rd";

            Connection connection = null;
            PreparedStatement selectOsoba = null;
            ResultSet resultSet = null;

            public Osoba(){
            
                try{
                connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                selectOsoba = connection.prepareStatement(
                "SELECT ID, IMIE, NAZWISKO, DATA FROM dane");
                
                }catch (SQLException e){
                e.printStackTrace();
                }
            }
            public ResultSet getOsoba(){
            
            try{
                resultSet = selectOsoba.executeQuery();
            }catch (SQLException e){
                e.printStackTrace() ;
            }
            return resultSet;
            }
        }
        %>
        <%
            Osoba newOsoba = new Osoba();
            ResultSet Osoba = newOsoba.getOsoba();
        %>
        <table border="3">
            <tbody>
                
                <form  action="insert.jsp" >
                
                <center>
                <input type="text" name="IMIE" placeholder="Imię">
                <input type="text" name="NAZWISKO" placeholder="Nazwisko">
                <input type="submit" value="Dodaj"/>
                </center>
                
                </form>
                <br>
                <form  action="delete.jsp" >
                <center>
                <input type="text" name="ID" placeholder="ID">
                <input type="submit" value="Usuń"/>
                </center>
                </form>
            
                <br><br>
                <tr>
                    <td>ID</td>
                    <td><center>Data</center></td>
                    <td>Imię</td>
                    <td>Nazwisko</td>
                    
                    
                </tr>
                <% while (Osoba.next()){ %>
                <tr>
                    <td><%= Osoba.getString("ID")%></td>
                    <td><%= Osoba.getString("DATA")%></td>
                    <td><%= Osoba.getString("IMIE")%></td>
                    <td><%= Osoba.getString("NAZWISKO")%></td>
                    
                </tr>
                <% } %>
                
                             
                </tbody>
        </table>
     <img src="C:\Users\Jakub\Documents\NetBeansProjects\Project\utp.png"
                     style="width:475px;height:475px;"> 
     </center>   
    </body>
</html>
