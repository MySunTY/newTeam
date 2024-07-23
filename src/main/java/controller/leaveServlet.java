package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DTO.VacationDTO;
import DAO.VacationDAO;


@WebServlet("/leave.do")
public class leaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("leave.jsp").forward(request,response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		VacationDTO vDTO = new VacationDTO();
		VacationDAO vDAO = new VacationDAO();
		String m_num = (String)session.getAttribute("m_num");
		int leavetype = Integer.parseInt(request.getParameter("leavetype"));
		String leave_start = request.getParameter("leave_start");
		String leave_end = request.getParameter("leave_end");
		String reason = request.getParameter("reason");
		
		
		vDTO.setM_num(m_num);
		vDTO.setLeavetype(leavetype);
		vDTO.setLeave_start(leave_start);
		vDTO.setLeave_end(leave_end);
		vDTO.setReason(reason);
		
		vDAO.insertVacation(vDTO);
		
		
	}

}
