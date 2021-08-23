<%@page import="model.pessoa"%>
<%@page import="dao.PessoaDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<header class="ccheader">
   <nav class="nav nav-pills flex-column flex-sm-row">
  <a class="flex-sm-fill text-sm-center nav-link " aria-current="page" href="home.jsp">Home</a>
  <a class="flex-sm-fill text-sm-center nav-link active" href="index.jsp">Cadastro</a>
  <a class="flex-sm-fill text-sm-center nav-link" href="login.jsp">Login</a>
 

</nav>
    <h1>Curso Senai</h1>    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <style>
form {
  padding: 30px;
  border: 1px solid #4CAF50;
  border: 1px solid black;
  margin-top: 30px;
  margin-bottom: 5px;
  margin-right: 150px;
  margin-left: 80px;
  background-color: lightblue;
}

</style>	
</header>

<%
pessoa p = new pessoa();
try{
	int id = Integer.parseInt(request.getParameter("id")) ;
	PessoaDao dao = new PessoaDao();
 	p = dao.getPessoa(id);
}catch(Exception e){
	
}


%>

<form  action="CadastroServlet" class="row g-3">
	<input type="hidden" name="id" value="<%= p.getId() %>" ></input>
	
  <div class="col-md-6">
 	 <label for="inputEmail4" class="form-label">Nome</label>
 	<input type="text" class="form-control"  name="Nome" value="<%= p.getNome() %>">
  </div>
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">CPF</label>
    <input type="text" class="form-control"  name="cpf" value="<%= p.getCpf()%>"  >
  </div>
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">Senha</label>
    <input type="text" class="form-control"  name="senha" value="<%= p.getSenha()%>" id="pass" > 	
  </div>
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">Email</label>
    <input type="email" class="form-control"  name="email" value="<%= p.getEmail()%>" id="inputEmail4" >
  </div>
  <div class="col-md-6">
    <label for="inputAddress" class="form-label">Telefone</label>
    <input type="text" class="form-control" id="inputAddress" name="tel" value="<%= p.getTel() %>">
  </div>
  <div class="col-md-6">
    <label for="inputAddress2" class="form-label">Data Nascimento</label>
    <input type="date" class="form-control" id="inputAddress2" name="dt_nasc"value="<%= p.getDt_nasc() %>">
  </div>
  <div class="col-md-4">	
    <label for="inputState" class="form-label" >Ensino</label>
    <select id="esco" class="form-select" name="esco">
      <option  value=""> Selecione </option>
      <option  value="Fundamental">Fundamental </option>
      <option  value="Medio">Medio</option>
      <option  value="Tecnico"> Tecnico</option>
      <option  value="Superior"> Superior</option>
    </select>
  </div>
  <div class="col-md-2" style="-webkit-box-shadow: 0px 0px 11px -1px #000000; box-shadow: 0px 0px 11px -1px #000000;">
  <label for="inputState" class="form-label">Sexo:</label>
	</br>
	<div class="form-check form-check-inline">	
	  <input class="form-check-input" type="radio"  name="sexo" value="Masculino">
	  <label class="form-check-label" > Masculino</label>
	</div>
	<div class="form-check form-check-inline">
	  <input class="form-check-input" type="radio"  name="sexo" value="Feminino">
	  <label class="form-check-label" >Feminino</label>
	</div>
  </div>
  <div class="col-md-2" style="-webkit-box-shadow: 0px 0px 11px -1px #000000; box-shadow: 0px 0px 11px -1px #000000;">
		  <label for="inputState" class="form-label">Programa em:</label>
			 </br> 
			<div class="form-check form-check-inline">	
			  <input class="form-check-input" type="checkbox" id="PHP"  name="tec" value="PHP">
			  <label class="form-check-label" > PHP</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="HTML" name="tec" value="HTML">
			  <label class="form-check-label" >HTML</label>
			</div>
				<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="SQL" name="tec" value="SQL">
			  <label class="form-check-label" >SQL</label>
			</div>
				<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="JAVA" name="tec" value="JAVA">
			  <label class="form-check-label" >JAVA</label>
			</div>
		</div>
	<div class="container">
    <div class="row align-items-center">
	    <div class="col">
	    </div>
	    <div class="col">
			
			    <button  class="btn btn-success" type="submit" value="Enviar">Salvar</button>
				  <%
				  	if(p.getId() > 0){
				  %>
			          <a class="btn btn-danger btn-xs"  onclick=" btcancelar()"  data-toggle="modal" data-target="#delete-modal">Excluir</a>
			         <script>
						function btcancelar() {
						  
						  var r = confirm("Deseja Realmente Apagar essa Pessoa ?");
						  if (r == true) {
							  window.location.href = "CadastroServlet?acao=apagar&id=<%= p.getId() %>";
						    
						  } else {
							  window.location.href = "index.jsp";
						  }

						}
					</script>
			          <a class="btn btn-primary"  href="index.jsp"  >Novo Usuario</a>
				  <%
				  }else{
					%>  
					  <button type="reset" class="btn btn-warning"  value="Resetar">Limpar</button>
				  <%
				  }
				  
				  %>
	    </div>
	    <div class="col">
	    </div>
  	</div>
    
   </div>
   

    
</form>
<script type="text/javascript">
	var lsSexo = document.getElementsByName("sexo");
	for(i in lsSexo){
		if(lsSexo[i].value == '<%= p.getSexo()%>'){
		   lsSexo[i].setAttribute('checked','checked');
		}
		
	}
	
	document.getElementById("esco").value = "<%= p.getEsco()%>" ;
	
	<%
	
	for (String t : p.getTec()) {	
		out.println("document.getElementById('"+t+"').setAttribute('checked', 'checked')");	
	}
	
	%>
</script>

