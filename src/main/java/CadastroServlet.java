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

import org.apache.tomcat.dbcp.dbcp2.DriverManagerConnectionFactory;

@WebServlet ("/CadastroServlet")

public class CadastroServlet extends HttpServlet {
	
	protected void service(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
		String nome = req.getParameter("Nome");
		String email = req.getParameter("email");
		String dt_nasc = req.getParameter("dt_nasc");
		String tel = req.getParameter("tel");
		String sexo = req.getParameter("sexo");
		String[] tec = req.getParameterValues("tec");
		String esco = req.getParameter("esco");
		
		PrintWriter saida = res.getWriter();
		saida.println("<html>");
		saida.println(nome);
		saida.println(email);
		saida.println(dt_nasc);
		saida.println(tel);
		saida.println(sexo);
		String tecnologia ="";
	
		for (String t : tec) {
				saida.println(t);
				tecnologia += t+",";
		}
		saida.println(esco);
		
	
	
	
	try {
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://ruby.db.elephantsql.com:5432/txnxyrim";
		String userDB = "txnxyrim";
		String passDB = "iqWWuiodXJm2s0DIifFqgNWy4Kth03ij";
		
		
		Connection cont = DriverManager.getConnection(url, userDB, passDB);
		
		String sql ="INSERT INTO public.pessoa\r\n"
				+ "(nome, email, dt_nasc, tel, sexo, tec, esco)\r\n"
				+ "VALUES('"+nome+"', '"+email+"', '"+dt_nasc+"', '"+tel+"', '"+sexo+"', '"+tecnologia+"', '"+esco+"')";
		
		
		
		PreparedStatement pst = cont.prepareStatement(sql);
		pst.execute();
		saida.println("Cadastro efetuado");
		pst.close();
		cont.close();
		
	} catch (Exception e) {
		saida.println("Erro de Conexão");
	}
	saida.println("</html>");
	}
	
}
