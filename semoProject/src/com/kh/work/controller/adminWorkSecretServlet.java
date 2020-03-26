package com.kh.work.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.work.model.service.WorkService;

/**
 * Servlet implementation class adminWorkSecretServlet
 */
@WebServlet("/workScrt.wo")
public class adminWorkSecretServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminWorkSecretServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 숨김처리 진행
		String no = request.getParameter("no");
		int writerNo = Integer.parseInt(request.getParameter("writerNo"));
		
		// 숨김처리를 진행해야 하는데
		// 만약 이미 숨김처리 된 건이 있다면?
		int secretFlag = new WorkService().secretWorkConfirm(no, 1);
		
		HttpSession session = request.getSession();
		// 이미 숨김처리 된 건이 존재한다는 뜻
		if(secretFlag > 0) {			
			session.setAttribute("scrMsg", "선택된 건 중 이미 숨김처리 된 건이 있습니다.");
			response.sendRedirect("writerList.wo?pageId=4&&no=" + writerNo);
			return;
		}
		
		// 숨김처리 된 건이 존재하지 않는다면
		// 숨김처리 진행
		int result = new WorkService().secretWork(no, 1);
		
		if(result > 0) {
			session.setAttribute("scrMsg", "숨김처리 되었습니다.");
			response.sendRedirect("writerList.wo?pageId=4&&no=" + writerNo);
		} else {
			request.setAttribute("msg", "작품 숨김처리 실패");
			request.getRequestDispatcher("views/common/adminErrorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
