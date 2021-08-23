<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.pessoa"%>
<%@page import="dao.PessoaDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login </title>
	    <style>
			form {
			  padding: 30px;
			  border: 1px solid #4CAF50;
			  border: 1px solid black;
			  margin-top: 30px;
			  margin-bottom: 5px;
			  margin-right: 300px;
			  margin-left: 300px;
			  background-color: lightblue;
			}

</style>	

</head>
<body>

<nav class="nav nav-pills flex-column flex-sm-row">
  <a class="flex-sm-fill text-sm-center nav-link " aria-current="page" href="home.jsp">Home</a>
  <a class="flex-sm-fill text-sm-center nav-link" href="index.jsp">Cadastro</a>
  <a class="flex-sm-fill text-sm-center nav-link active" href="login.jsp">Login</a>
</nav>

	<form class="form" action="loginServlet">
	  <div class="mb-3">
	    <label for="exampleInputEmail1" class="form-label">CPF</label>
	    <input type="text" class="form-control" name="cpf" id="cpf" >
	  </div>
	  <div class="mb-3">
	    <label for="exampleInputPassword1" class="form-label">Senha</label>
	    <input type="password" class="form-control" name="senha" id="senha">
	  </div>
	  <button  class="btn btn-primary " >Enviar</button>
	</form>
</body>
</html>