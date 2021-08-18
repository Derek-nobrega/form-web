<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.net.httpserver.Authenticator.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="crud.db.conexao" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	  	<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	    
		<title>CRUD</title>
	</head>
	<body>
	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
		<div id="list" class="row">
 
    <div class="table-responsive col-md-12">
        
        <%
			 Connection cont = crud.db.conexao.conectar();

			 if(cont != null) {
				 PreparedStatement pst = cont.prepareStatement("select id , nome , email ,dt_nasc from pessoa ");
				 ResultSet rs = pst.executeQuery();
        %>
        <table class="table table-striped" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Data Nascimento</th>
                    <th class="actions">Ações</th>
                 </tr>
            </thead>
            <tbody> 
            <% while(rs.next()){ %>
                <tr>
                    <td><% out.print(rs.getString("id")); %></td>
                    <td><%= rs.getString("nome") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("dt_nasc") %></td>
                    <td class="actions">
                        <a class="btn btn-success btn-xs" href="form_view.jsp">Visualizar</a>
                        <a class="btn btn-warning btn-xs" href="form_edit.jsp">Editar</a>
                        <a class="btn btn-danger btn-xs"  href="#" data-toggle="modal" data-target="#delete-modal">Excluir</a>
                    </td>
                </tr>
                <% }%>
            </tbody>
         </table>
         <% cont.close();
          }
         %>
          <a class="btn btn-primary btn-xs" href="form_cadastro.jsp">+ Adicionar</a>
 
     </div>
 </div> 
		
	</body>
</html>

