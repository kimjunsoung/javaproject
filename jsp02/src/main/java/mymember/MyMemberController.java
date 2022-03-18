package mymember;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import mymember.dao.MyMemberDAO;
import mymember.dto.MemberDTO;



@WebServlet("/my_member_servlet/*")
public class MyMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException,
	IOException {
		//사용자가 요청한 주소
		String uri=request.getRequestURI();
		//프로젝트 이름
		String context=request.getContextPath();
		MyMemberDAO dao = new MyMemberDAO();
		if(uri.indexOf("join.do") != -1) {
			String userid = request.getParameter("userid");
			String passwd= request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String zipcode=request.getParameter("zipcode");
			String address1=request.getParameter("address1");
			String address2=request.getParameter("address2");
			MemberDTO dto= new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setPhone(phone);
			dto.setZipcode(zipcode);
			dto.setAddress1(address1);
			dto.setAddress2(address2);
			dao.insert(dto);
			String page = "/board_servlet/list.do"; 
		    response.sendRedirect(context+page);
		}
		
		
		
		else if(uri.indexOf("view.do") != -1) {
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			if(userid != null) {
				MemberDTO dto = dao.view(userid);
				request.setAttribute("dto", dto);
				String page ="/project/member/view.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		}
		else if(uri.indexOf("updateData.do") != -1) {
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			if(userid != null) {
				MemberDTO dto = dao.view(userid);
				request.setAttribute("dto", dto);
				String page ="/project/main.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		}
		else if(uri.indexOf("update.do") != -1) {
			int result =0;
			HttpSession session = request.getSession(); 
			String userid =(String)session.getAttribute("userid");
			String passwd = request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String zipcode=request.getParameter("zipcode");
			String address1=request.getParameter("address1");
			String address2=request.getParameter("address2");
			
			MemberDTO dto = new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setPhone(phone);
			dto.setZipcode(zipcode);
			dto.setAddress1(address1);
			dto.setAddress2(address2);
			result = dao.update(dto);
			System.out.println(result);
			if(result > 0) {
				request.setAttribute("dto", dto);
				String page ="/project/main.jsp";
				response.sendRedirect(context+page);
			}else {
				String page="/project/main.jsp";
				response.sendRedirect(context+page);
				
			}
		}
		else if(uri.indexOf("deleteMember.do") != -1) {
			HttpSession session =request.getSession();
			String userid =(String) session.getAttribute("userid");
			dao.delete(userid);
			session.invalidate();
			String page="/project/main.jsp";
			response.sendRedirect(context+page);
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
