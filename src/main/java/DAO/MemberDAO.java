package DAO;
import java.sql.*;
import DTO.MemberDTO;

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
			if(pw.equals(rs.getString("pw"))){
				return 1 ; //로그인 성공
			}else if(pw != rs.getString("pw")) {
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
	//onoff테이블에 데이터 넣기
	public void insertOnoff(String m_num, int i) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into onoff(m_num, clicktime, clicktype) values(?,now(),?);";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_num );
			pstmt.setInt(2, i);
			pstmt.execute();
			
		}catch(Exception e) {
			System.out.println("insertOnoff 접속중 오류"+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {
				System.out.println("insertOnoff 연결해제중 오류발생"+ex);
			}
		}
		
	}// insertOnoff
	
	
	//회원정보가져오기
	public MemberDTO showMember(String m_num) {
		MemberDTO mDTO = new MemberDTO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member where m_num=?;";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_num);
			rs = pstmt.executeQuery();
			rs.next();
			
			mDTO.setM_num(m_num);
			mDTO.setName(rs.getString("name"));
			mDTO.setPw(rs.getString("pw"));
			mDTO.setAddress(rs.getString("address"));
			mDTO.setPhone(rs.getString("phone"));
			mDTO.setEmail(rs.getString("email"));
			
			
		}catch(Exception e) {
			System.out.println("showmember(m_num) ing error "+e);
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("showmember(m_num) end error "+ex);
			}
		}
		
		
		
		return mDTO;
	}
	
	
}
