package kr.co.kung.modelExam;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductsDAO {
   private String uid = "test2"; // 데이터베이스 사용자 아이디
   private String upw = "1234"; // 데이터베이스 사용자 비밀번호
   private String url = "jdbc:mysql://121.163.148.1/plantsdb"; // 데이터베이스 URL
   
   // MySQL JDBC 드라이버를 로드하는 생성자
   private ProductsDAO() {
      try {
         Class.forName("com.mysql.cj.jdbc.Driver");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   // Singleton 인스턴스를 위한 static 변수
   private static ProductsDAO dao = new ProductsDAO();
   
   // Singleton 인스턴스를 반환하는 메서드
   public static ProductsDAO getIns() {
      if (dao == null) {
         dao = new ProductsDAO();
      }
      return dao;
   }
   
   // 데이터베이스에 ProductsDTO 객체를 삽입하는 메서드
   public int Insert(ProductsDTO products) {
      String sql = "INSERT INTO products (plantsname, description, price, stock) VALUES(?,?,?,?)"; // SQL 삽입 명령문
      Connection con = null;
      PreparedStatement pst = null;
      int res = 0;
      
      try {
         con = DriverManager.getConnection(url, uid, upw); // 데이터베이스 연결
         pst = con.prepareStatement(sql); // SQL 명령문 준비
         pst.setString(1, products.getPlantsname()); // 첫 번째 매개변수로 plantsname 설정
         pst.setString(2, products.getDescription()); // 두 번째 매개변수로 description 설정
         pst.setInt(3, products.getPrice()); // 세 번째 매개변수로 price 설정
         pst.setInt(4, products.getStock()); // 네 번째 매개변수로 stock 설정
         res = pst.executeUpdate(); // SQL 명령문 실행
      } catch (Exception e) {
         e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
      } finally {
         try {
            if (con != null) con.close(); // 연결 종료
            if (pst != null) pst.close(); // PreparedStatement 종료
         } catch (Exception e2) {
            e2.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
         }
      }
      return res; // 삽입 결과 반환
   }

   // 데이터베이스에서 모든 제품을 가져오는 메서드
   public List<ProductsDTO> getAllProducts() {
      List<ProductsDTO> list = new ArrayList<>(); // 제품 목록을 저장할 리스트
      String sql = "SELECT * FROM products"; // SQL 선택 명령문
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rs = null;

      try {
         con = DriverManager.getConnection(url, uid, upw); // 데이터베이스 연결
         pst = con.prepareStatement(sql); // SQL 명령문 준비
         rs = pst.executeQuery(); // SQL 명령문 실행 및 결과 집합 얻기
         
         while (rs.next()) { // 결과 집합에서 다음 행으로 이동
            ProductsDTO product = new ProductsDTO();// 새 ProductsDTO 객체 생성
            product.setPlantsname(rs.getString("plantsname")); // plantsname 설정
            product.setDescription(rs.getString("description")); // description 설정
            product.setPrice(rs.getInt("price")); // price 설정
            product.setStock(rs.getInt("stock")); // stock 설정
            list.add(product); // 리스트에 제품 추가
         }
      } catch (Exception e) {
         e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
      } finally {
         try {
            if (rs != null) rs.close(); // ResultSet 종료
            if (pst != null) pst.close(); // PreparedStatement 종료
            if (con != null) con.close(); // 연결 종료
         } catch (Exception e) {
            e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
         }
      }
      return list; // 제품 목록 반환
   }

   // plantsname으로 특정 제품을 가져오는 메서드 추가
   public ProductsDTO getProductByPlantsname(String plantsname) {
      ProductsDTO product = null; // 반환할 ProductsDTO 객체
      String sql = "SELECT * FROM products WHERE plantsname = ?"; // SQL 선택 명령문
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rs = null;
      
      try {
         con = DriverManager.getConnection(url, uid, upw); // 데이터베이스 연결
         pst = con.prepareStatement(sql); // SQL 명령문 준비
         pst.setString(1, plantsname); // 첫 번째 매개변수로 plantsname 설정
         rs = pst.executeQuery(); // SQL 명령문 실행 및 결과 집합 얻기
         
         if (rs.next()) { // 결과 집합에서 다음 행으로 이동
            product = new ProductsDTO(); // 새 ProductsDTO 객체 생성
            product.setPlantsname(rs.getString("plantsname")); // plantsname 설정
            product.setDescription(rs.getString("description")); // description 설정
            product.setPrice(rs.getInt("price")); // price 설정
            product.setStock(rs.getInt("stock")); // stock 설정
         }
      } catch (Exception e) {
         e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
      } finally {
         try {
            if (rs != null) rs.close(); // ResultSet 종료
            if (pst != null) pst.close(); // PreparedStatement 종료
            if (con != null) con.close(); // 연결 종료
         } catch (Exception e) {
            e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
         }
      }
      return product; // 특정 제품 반환
   }
}