package com.kh.episode.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.episode.model.vo.Comment;
import com.kh.episode.service.episodeService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class CommentInsertServlet
 */
@WebServlet("/cinsert.ep")
public class CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		int eNo = Integer.parseInt(request.getParameter("eNo"));
		int member = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		Comment c = new Comment();
		c.setContent(content);
		c.setEpisodeNo(eNo);
		c.setMemberNo(member); // "1"
		
		int result = new episodeService().insertComment(c);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
