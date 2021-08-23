package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.PessoaDao;

@WebServlet ("/loginServlet")

public class loginServlet extends HttpServlet {
	
	public void service(HttpServletRequest req1, HttpServletResponse rep1) throws ServletException, IOException {

		pessoa objP1 = new pessoa();
		boolean  check = false; 
		
		objP1.setCpf(req1.getParameter("cpf"));
		objP1.setSenha(req1.getParameter("senha"));
		
		
		PessoaDao objDao = new PessoaDao();
					
		  if(!objP1.getCpf().isEmpty() && !objP1.getSenha().isEmpty()) {
				
				check = objDao.logar(objP1);
				
				if (check) {
					rep1.sendRedirect("Acessook.html");
				}else {
					rep1.sendRedirect("AcessoNeg.html");
				}
		
		  }
		
	}
	

}
