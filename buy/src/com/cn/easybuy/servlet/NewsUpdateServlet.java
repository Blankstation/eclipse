package com.cn.easybuy.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cn.easybuy.dao.NewsDao;
import com.cn.easybuy.dao.impl.NewsDaoImpl;
import com.cn.easybuy.entity.News;

/**
 * Servlet implementation class NewsUpdateServlet
 */
public class NewsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int enid =Integer.valueOf(request.getParameter("newid")) ;
	    String enTiTle=request.getParameter("title");
	    String enContent=request.getParameter("content");
	    News news=new News();
	    news.setEnId(enid);
	    news.setEnTiTle(enTiTle);
	    news.setEnContent(enContent);
	    NewsDao newsdao=new NewsDaoImpl();
	    int result=newsdao.updateNews(news);
	    if(result!=0){
	    	response.sendRedirect("manage/news.jsp");
	    }else{
	    	request.getRequestDispatcher("news-modify.jsp").forward(request,response);
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
