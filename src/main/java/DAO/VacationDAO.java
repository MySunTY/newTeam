package DAO;
import DTO.VacationDTO;
import java.sql.*;
import DAO.MemberDAO;


public class VacationDAO {
	//vacation테이블에 데이터 삽입
	public void insertVacation(VacationDTO vDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		MemberDAO mDAO = MemberDAO.getInstance();
		
		String sql = "insert into vacation(m_num,leavetype,leave_start,leave_end,reason,bancha_time)";
		sql+= "values(?,?,?,?,?,?)";
		
		try {
			conn = mDAO.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vDTO.getM_num());
			pstmt.setInt(2, vDTO.getLeavetype());
			pstmt.setString(3,vDTO.getLeave_start());
			pstmt.setString(4, vDTO.getLeave_end());
			pstmt.setString(5, vDTO.getReason());
			pstmt.setString(6, vDTO.getBancha_time());
			
			pstmt.execute();
			
			
		}catch(Exception e) {
			System.out.println("insertVacation(vDTO) ing error"+e);
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				
			}catch(Exception ex) {
				System.out.println("insertVacation(vDTO) end error "+ex);
			}
		}
		
	}//insertVacation
	
	//깃 확인

}
