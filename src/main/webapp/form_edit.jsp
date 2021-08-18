<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head class="ccheader">

<link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="form_cadastro.css" media="screen" />
	
<meta charset="ISO-8859-1">
<title>View</title>
</head>
<body>
<div class="wrapper">
    <form   class="ccform">
    <div class="ccfield-prepend">
        <span class="ccform-addon"><i class="fa fa-user fa-2x"></i></span>
        <input class="ccformfield" type="text" placeholder="Nome" name="Nome" required>
    </div>
    <div class="ccfield-prepend">
        <span class="ccform-addon"><i class="fa fa-envelope fa-2x"></i></span>
        <input class="ccformfield" type="text" placeholder="E-mail" name="email" required>
    </div>
    
        <div class="ccfield-prepend">
        <span class="ccform-addon"><i class="fa fa-calendar fa-2x"></i></span>
        <h4>  Data de Nascimento</h4>
        <input class="ccformfield" name="dt_nasc" type="date" required>
    </div>

    <div class="ccfield-prepend">
        <span class="ccform-addon"><i class="fa fa-mobile-phone fa-2x"></i></span>
        <input class="ccformfield" name="tel" type="text" placeholder="Telefone">
    </div>
    
     <div class="ccfield-prepend">
	<span class="ccform-addon">Sexo</span>
	<div class="ccformfield">
  		<input type="radio" id="masc" name="sexo" value="masc">
  		<label for="masc">Masculino</label>
 		 <input type="radio" id="fem" name="sexo" value="fem">
  		<label for="fem">Feminino</label>
	</div>
	<br>
	 
	<div class="ccfield-prepend">
	<span class="ccform-addon">Programa em :</span>
		<div class="ccformfield">
	  		<input type="checkbox" id="html" name="tec" value="html">
	  		<label for="opcao1"> HTML</label><br>
	  		<input type="checkbox" id="java" name="tec" value="java">
	  		<label for="opcao2"> JAVA</label><br>
	 		 <input type="checkbox" id="php" name="tec" value="php">
	  		<label for="opcao3"> PHP</label>
		</div>
	</div>
	<br>
	<div class="ccfield-prepend">
		<span class="ccform-addon">Formacao :</span>
		<div class="ccformfield">
			<select name="esco">
			  <option value="medio">Medio</option>
			  <option value="tecnico" selected>Tecnico</option>
			  <option value="superio">Superior</option>
			</select>
			
    	</div>
    </div>
    <br>
    
 
    <div class="ccfield-prepend">
	    <a href="index.jsp">
	  		<input class="ccbtn" value="Voltar">
		</a>
    </div>
    
        <div class="ccfield-prepend">
        <input class="ccbtn" type="submit" value="Salvar">
    </div>
    
    </form>
</div>
</body>
</html>



