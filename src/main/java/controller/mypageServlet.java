package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DAO.MemberDAO;
import DTO.MemberDTO;


@WebServlet("/mypage.do")
public class mypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String m_num = (String)session.getAttribute("m_num");
		MemberDAO mDAO = MemberDAO.getInstance();
		MemberDTO mDTO = new MemberDTO();
		mDTO = mDAO.showMember(m_num);
		request.setAttribute("mDTO", mDTO);
		request.getRequestDispatcher("mypage.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
