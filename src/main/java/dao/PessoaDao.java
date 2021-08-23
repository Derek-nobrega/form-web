package dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.If;

import crud.db.conexao;
import model.pessoa;



public class PessoaDao {
	public boolean adicionar(pessoa objP) {
		
		String tecnologia ="";
		
		for (String t : objP.getTec()) {
				tecnologia += t+",";
		}
		
	
	
	
	try {
		Connection cont = crud.db.conexao.conectar();
			
			String sql ="INSERT INTO public.pessoa\r\n"
					+ "(nome, email, dt_nasc, tel, sexo, tec, esco, cpf, senha)\r\n"
					+ "VALUES('"+objP.getNome() +"', '"+objP.getEmail()+"', '"+objP.getDt_nasc()+"', '"+objP.getTel()+"', '"+objP.getSexo()+"', '"+tecnologia+"', '"+objP.getEsco()+"', '"+objP.getCpf()+"', '"+objP.getSenha()+"' )";
			
			
			
			PreparedStatement pst = cont.prepareStatement(sql);
			pst.execute();
			pst.close();
			cont.close();
			return true;		

	} catch (Exception e) {
		e.printStackTrace();
		
	}
	return false;
	}


	public List<pessoa> listaPessoa() {

		
		List<pessoa> ls = new ArrayList<>();
		
		try {	
			
			Connection cont = crud.db.conexao.conectar();
			 PreparedStatement pst = cont.prepareStatement("select id , nome , email ,cpf from pessoa order by id ");
			 ResultSet rs = pst.executeQuery();
			 
			  while(rs.next()){ 
				  pessoa p = new pessoa();
				  p.setId(rs.getInt("id"));
				  p.setNome(rs.getString("nome"));
				  p.setEmail(rs.getString("email"));
				  p.setCpf(rs.getString("cpf"));
				
				  ls.add(p);
			  }
			  cont.close();
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		return ls;
	}

	public pessoa getPessoa(int id) {
		pessoa p = new pessoa();
		 
		try {	
			
			Connection cont = crud.db.conexao.conectar();
			 PreparedStatement pst = cont.prepareStatement("select * from pessoa where id= ? ");
			 pst.setInt(1, id);
			 ResultSet rs = pst.executeQuery();
			 
			  while(rs.next()){ 
				  p.setId(rs.getInt("id"));
				  p.setNome(rs.getString("nome"));
				  p.setEmail(rs.getString("email"));
				  p.setDt_nasc(rs.getString("dt_nasc"));
				  p.setTel(rs.getString("tel"));
				  p.setEsco(rs.getString("esco"));
				  p.setSexo(rs.getString("sexo"));
				  p.setTec(rs.getString("tec").split(","));
				  p.setCpf(rs.getString("cpf"));
				  p.setSenha(rs.getString("senha"));
				  
			  }
			  cont.close();
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
				
		return p;
	}

	public boolean alterar(pessoa objP) {
		String tecnologia ="";
		
		for (String t : objP.getTec()) {
				tecnologia += t+",";
		}
		
	
	
	
	try {
		Connection cont = crud.db.conexao.conectar();
			
			String sql ="update  pessoa set "
					+ "nome     = ?,"
					+ " email   = ?,"
					+ " dt_nasc = ?,"
					+ " tel     = ?,"
					+ " sexo    = ?,"
					+ " tec     = ?,"
					+ " esco    = ?,"
					+ " cpf    = ?,"
					+ " senha    = ?"
					
					+ " where"
					+ " id      = ?";
			
			
			PreparedStatement pst = cont.prepareStatement(sql);
			pst.setString(1, objP.getNome());
			pst.setString(2, objP.getEmail());
			pst.setString(3, objP.getDt_nasc());
			pst.setString(4, objP.getTel());
			pst.setString(5, objP.getSexo());
			pst.setString(6, tecnologia);
			pst.setString(7, objP.getEsco());
			pst.setString(8, objP.getCpf());
			pst.setString(9, objP.getSenha());
			pst.setInt(10, objP.getId());
			
			pst.execute();
			pst.close();
			cont.close();
			return true;		

	} catch (Exception e) {
		e.printStackTrace();
	}
	return false;
	}

	public boolean apagar(int id) {

		String tecnologia ="";
		
	try {
		Connection cont = crud.db.conexao.conectar();
			
			String sql ="delete from  pessoa where id = ?";
			
			
			PreparedStatement pst = cont.prepareStatement(sql);
			pst.setInt(1, id);
			pst.execute();
			pst.close();
			cont.close();
			return true;		

	} catch (Exception e) {
		e.printStackTrace();
	}
	return false;
	}
	
	
	
	public boolean logar(pessoa objP1) {

	    	
			try{
				Connection cont2 = crud.db.conexao.conectar();
				PreparedStatement pst2 = cont2.prepareStatement("SELECT * FROM pessoa WHERE cpf = ? and senha = ?");
						pst2.setString(1, objP1.getCpf());
						pst2.setString(2, objP1.getSenha());
						ResultSet rs2 = pst2.executeQuery();
						pst2.getResultSet();
						if( rs2.next() ) {
							return true;
							}
						pst2.close();
						cont2.close();
						
			} catch (Exception e) {
				e.printStackTrace();
			}
		return false;
		
	}
}
