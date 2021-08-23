import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory;
import crud.db.conexao;
import dao.PessoaDao;
import model.pessoa;
@WebServlet ("/CadastroServlet")

public class CadastroServlet extends HttpServlet {
	
	protected void service(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
		
		pessoa objP = new pessoa();
		
		String acao = req.getParameter("acao");
		
		if (acao != null && acao.equals("apagar")) {
			
			objP.setId(Integer.parseInt(req.getParameter("id")));
		}else {
			
			objP.setNome(req.getParameter("Nome"));
			objP.setEmail(req.getParameter("email"));
			objP.setDt_nasc(req.getParameter("dt_nasc"));
			objP.setTel(req.getParameter("tel"));
			objP.setSexo(req.getParameter("sexo"));
			objP.setTec(req.getParameterValues("tec"));
			objP.setEsco(req.getParameter("esco"));
			objP.setCpf(req.getParameter("cpf"));
			objP.setSenha(req.getParameter("senha"));
			objP.setId(Integer.parseInt(req.getParameter("id")));
		}

		
	PessoaDao objDao = new PessoaDao();
	
	boolean validar = false;
	
	if (objP.getId() > 0) {
		
		if(acao != null && acao.equals("apagar")){
			validar = objDao.apagar(objP.getId());
		}else {
		validar = objDao.alterar(objP);
		}
	}else {
		validar = objDao.adicionar(objP);
		}
	
	if (validar) {
		res.sendRedirect("index.jsp");
	}
	
	}
	

		
	}