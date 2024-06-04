package kr.co.kung.modelExam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ProductsDAO {
	private String uid="test2";
	  private String upw="1234";
	  private String url ="jdbc:mysql://121.163.148.1/plantsdb";

	  
	  private ProductsDAO(){
		  try {
			  Class.forName("com.mysql.cj.jdbc.Driver");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		  
		  
	  }
	  private static ProductsDAO dao=new ProductsDAO();
	  public static ProductsDAO getIns() {
		  if(dao!=null) {
			  dao=new ProductsDAO();
		  }
		  return dao;
		  
	  }
	  
	  public int Insert(ProductsDTO products) {
		  String sql="INSERT INTO products VALUES(?,?,?,?)";
		  Connection con=null;
		  PreparedStatement pst=null;
		  int res=0;
		  try {
			  con=DriverManager.getConnection(url,uid,upw);
			  pst=con.prepareStatement(sql);
			  pst.setString(1, products.getPlantsname());
			  pst.setString(2, products.getDescription());
			  pst.setInt(3, products.getPrice());
			  pst.setInt(4, products.getStock());
			  res=pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(con!=null) con.close();
				if(pst!=null) pst.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		  return res;
		  
	  }
	  
	  
	  
	}