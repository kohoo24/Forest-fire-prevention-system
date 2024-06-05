package kr.co.kung.modelExam;

import java.sql.*;

public class MemberDAO {
  private String uid="test2";
  private String upw="1234";
  private String url="jdbc:mysql://121.163.148.1/plantsdb?useUnicode=true&characterEncoding=UTF-8";
  
  private MemberDAO(){
	  try {
		  Class.forName("com.mysql.cj.jdbc.Driver");
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	  
	  
  }
  private static MemberDAO dao=new MemberDAO();
  public static MemberDAO getIns() {
	  if(dao!=null) {
		  dao=new MemberDAO();
	  }
	  return dao;
	  
  }
  
  public int Insert(MemberDTO members) {
	  String sql="INSERT INTO user VALUES(?,?,?,?,?,?)";
	  Connection con=null;
	  PreparedStatement pst=null;
	  int res=0;
	  try {
		  con=DriverManager.getConnection(url,uid,upw);
		  pst=con.prepareStatement(sql);
		  pst.setString(1, members.getUserid());
		  pst.setString(2, members.getPw());
		  pst.setString(3, members.getName());
		  pst.setString(4, members.getPhone());
		  pst.setString(5, members.getAddress());
		  pst.setString(6, members.getEmail());
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
  
  public MemberDTO getMember(String userid) {
      String sql = "SELECT * FROM user WHERE userid = ?";
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rs = null;
      MemberDTO member = null;

      try {
          con = DriverManager.getConnection(url, uid, upw);
          pst = con.prepareStatement(sql);
          pst.setString(1, userid);
          rs = pst.executeQuery();

          if (rs.next()) {
              member = new MemberDTO();
              member.setUserid(rs.getString("userid"));
              member.setPw(rs.getString("pw"));
              member.setName(rs.getString("name"));
              member.setPhone(rs.getString("phone"));
              member.setAddress(rs.getString("address"));
              member.setEmail(rs.getString("email"));
          }
      } catch (SQLException e) {
          e.printStackTrace();
      } finally {
          try {
              if (rs != null) rs.close();
              if (pst != null) pst.close();
              if (con != null) con.close();
          } catch (SQLException e) {
              e.printStackTrace();
          }
      }

      return member;
  }
  public int updateUser(String userid, String field, String newValue) {
      String sql = "UPDATE user SET " + field + " = ? WHERE userid = ?";
      Connection con = null;
      PreparedStatement pst = null;
      int res = 0;
      try {
          con = DriverManager.getConnection(url, uid, upw);
          pst = con.prepareStatement(sql);
          pst.setString(1, newValue);
          pst.setString(2, userid);
          res = pst.executeUpdate();
      } catch (SQLException e) {
          e.printStackTrace();
      } finally {
          try {
              if (pst != null) pst.close();
              if (con != null) con.close();
          } catch (SQLException e) {
              e.printStackTrace();
          }
      }
      return res;
  }
}