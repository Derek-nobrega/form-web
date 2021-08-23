<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="model.pessoa"%>
<%@page import="java.util.List"%>
<%@page import="dao.PessoaDao"%>
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
	<style>
		.pointer {cursor: pointer;}
	</style>
	</head>
	<body>

		<%@include file="form_cadastro.jsp" %>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
		<div id="list" class="row">
 
    <div class="table-responsive col-md-12">
        
        <%
		PessoaDao objDao = new PessoaDao();  
        List<pessoa> ls = objDao.listaPessoa();
			 if(ls.size()> 0) {
			
        %>
        <table class="table table-striped" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>CPF</th>
                    <th class="actions">Ações</th>
                 </tr>
            </thead>
            <tbody> 
  	          <% for(pessoa i : ls){
            	%>
                <tr class="pointer" onclick="window.location.href = 'index.jsp?id=<%= i.getId() %>'">
                    <td><%= i.getId() %></td>
	                    <td><%= i.getNome() %></td>
                    <td><%= i.getEmail() %></td>
                    <td><%= i.getCpf() %></td>
                    <td class="actions">
                        <a class="btn btn-warning btn-xs" href="index.jsp?id=<%= i.getId() %>">Editar</a>
                        <a class="btn btn-danger btn-xs"  href="CadastroServlet?acao=apagar&id=<%= i.getId() %>" data-toggle="modal" data-target="#delete-modal">Excluir</a>
                    </td>
                </tr>
                <% }%>
            </tbody>
         </table>
         <% 
          }
         %>
 
     </div>
 </div> 
		
	</body>
</html>
