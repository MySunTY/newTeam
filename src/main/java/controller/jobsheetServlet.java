package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import DTO.JobsheetDTO;
import DAO.JobsheetDAO;

@WebServlet("/sheet.do")
public class jobsheetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		request.getRequestDispatcher("jobsheet.jsp").forward(request, response);
		
	}
		
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 request.setCharacterEncoding("utf-8");
	 response.setCharacterEncoding("utf-8");
	 response.setContentType("sheet/xml");
	 String getdate=request.getParameter("getdate");  //검색 날짜
	 System.out.println(getdate);
	 JobsheetDAO jDAO = new JobsheetDAO();
	 String msg = jDAO.showText(getdate);
	 System.out.println(msg);
	 
	 
	 String responseText="작성일자: "+getdate+", 내용: "+msg;   //DB에서 받아온 데이터 여기에 넣어주세요!!!
	 PrintWriter out=response.getWriter();
	 out.println(responseText);
	 out.close();
	 ;
	}

}
