package kr.co.kung.modelExam;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BuyDAO {
   private String uid = "test2"; // 데이터베이스 사용자 아이디
   private String upw = "1234"; // 데이터베이스 사용자 비밀번호
   private String url = "jdbc:mysql://121.163.148.1/plantsdb"; // 데이터베이스 URL

   // MySQL JDBC 드라이버를 로드하는 생성자
   public BuyDAO() {
      try {
         Class.forName("com.mysql.cj.jdbc.Driver");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   // Singleton 인스턴스를 위한 static 변수
   private static BuyDAO dao = new BuyDAO();

   // Singleton 인스턴스를 반환하는 메서드
   public static BuyDAO getIns() {
      return dao;
   }

   // 사용자의 구매 내역을 가져오는 메서드
   public List<BuyDTO> getBuyList(String userId) {
      List<BuyDTO> buyList = new ArrayList<>();
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rs = null;

      try {
         con = DriverManager.getConnection(url, uid, upw);
         String sql = "SELECT * FROM buy WHERE userid = ?";
         pst = con.prepareStatement(sql);
         pst.setString(1, userId);
         rs = pst.executeQuery();
         
         while (rs.next()) {
            BuyDTO buy = new BuyDTO();
            buy.setUserid(rs.getString("userid"));
            buy.setPlantsname(rs.getString("plants"));
            buy.setQuantity(rs.getInt("stock"));
            buyList.add(buy);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (con != null) con.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      return buyList;
   }
}
