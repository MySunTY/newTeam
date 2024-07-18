package DAO;
import java.sql.*;

public class MemberDAO {
	private MemberDAO() {
		
	}//
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}//싱글톤 구현
	
	public Connection getConnection()throws Exception {
		Connection conn = null;
		String url = "jdbc:mysql://127.0.0.1:3306/team";
		String db_id = "root";
		String db_pw = "12345678";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,db_id,db_pw);
		return conn;
	}
	
	public int loginCheck(String m_num , String pw) {
		int result = -1; //  -1이면 회원정보없음 , 0이면 비밀번호틀림, 1이면 로그인
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select pw from member where m_num =?;";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_num);
			rs = pstmt.executeQuery();
			rs.next();
			if(rs.next() && pw.equals(rs.getString("pw"))){
				return 1 ; //로그인 성공
			}else if(rs.next() && pw != rs.getString("pw")) {
				return 0 ; //비밀번호 틀림
			}
			
			
			
			
		}catch(Exception e) {
			System.out.println("login.do 연결중 에러"+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex){
				System.out.println("login.do 접속해제중 에러"+ex);
			}
		}
		
		
		
		return result;
		
	}
	
	
}
