package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import DTO.MemberDTO;
import DAO.MemberDAO;
import java.sql.*;



@WebServlet("/login.do")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		MemberDAO mDAO = MemberDAO.getInstance();
		String m_num = request.getParameter("m_num");
		String pw = request.getParameter("pw");
		HttpSession session = request.getSession();
		
		System.out.println("doPost 확인");
		System.out.println(m_num);
		System.out.println(pw);
		
		int result = mDAO.loginCheck(m_num, pw);
		System.out.println(result);
		if(result == 1 ) {
			session.setAttribute("m_num",m_num);
			RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
			dis.forward(request,response);
		}else if(result==0) {
			request.setAttribute("result",result);
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			dis.forward(request,response);
		}else if(result == -1){
			request.setAttribute("result",result);
			
		
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			dis.forward(request,response);
			
		}
		
		
		
		
		
		
		
	}

}
