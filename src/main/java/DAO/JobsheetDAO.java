package DAO;
import DAO.MemberDAO;
import DTO.JobsheetDTO;
import java.sql.*;

public class JobsheetDAO {
	
	//jobsheet table에 데이터삽입
	public void insertSheet(JobsheetDTO jDTO) {
		MemberDAO mDAO = MemberDAO.getInstance();
		
		
		Connection conn =null;
		PreparedStatement pstmt = null;
		String sql = "insert into jobsheet values(?,?,?,?);";
		
		try {
			conn = mDAO.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, jDTO.getM_num());
			pstmt.setString(2, jDTO.getSheet_date());
			pstmt.setString(3, jDTO.getText_area1());
			pstmt.setString(4, jDTO.getText_area2());
			
			pstmt.execute();
			
		}catch(Exception e) {
			System.out.println("insertSheet(jDTO) ing error"+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("insertSheet(jDTO) end error"+ex);
			}
		}
		
		
		
		
		
	}//insertsheet

}//JobsheetDAO
