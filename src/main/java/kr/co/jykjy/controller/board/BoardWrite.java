package kr.co.jykjy.controller.board;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import kr.co.jykjy.domain.Attach;
import kr.co.jykjy.domain.Board;
import kr.co.jykjy.domain.Criteria;
import kr.co.jykjy.service.BoardService;
import util.UploadUtils;
import util.Webutils;

@WebServlet("/board/write")
public class BoardWrite extends HttpServlet {
	private BoardService boardService = BoardService.getBoardService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate = req.getParameter("category");
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		
		Criteria.CriteriaBuilder cb = Criteria.builder();
		if(cate != null) {
			cb.category(Integer.parseInt(cate));
		}
		if(pageNum != null) {
			cb.pageNum(Integer.parseInt(pageNum));
		}
		if(amount != null) {
			cb.amount(Integer.parseInt(amount));
		}
		Criteria criteria = cb.build();
		
		// 비로그인 상태 >> 로그인 페이지로 보내기
		if (Webutils.getMember(req) == null) {
			Webutils.alert(resp, "로그인 후 이용할 수 있습니다.", req.getContextPath() + "/member/login?href=" + URLEncoder.encode("/board/write?" + criteria.getQs(), "utf-8"));
			return;
		}
		
		req.setAttribute("cri", criteria);
		
		// 파라미터값으로 받아온 category번호에 따라 조건문으로 다른 jsp파일로 보내는 방법
		if(Integer.parseInt(cate) == 2) {
			// cno가 2일때
			req.getRequestDispatcher("/WEB-INF/views/board/event_write.jsp").forward(req, resp);
		} else if(Integer.parseInt(cate) == 3) {
			// cno가 3일때
			req.getRequestDispatcher("/WEB-INF/views/board/FAQ_write.jsp").forward(req, resp);
		} else {
			// cno가 1또는 4일때
			req.getRequestDispatcher("/WEB-INF/views/board/board_write.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		ServletFileUpload fileUpload = UploadUtils.init();
		
		List<FileItem> items = fileUpload.parseRequest(new ServletRequestContext(req));
		Board.BoardBuilder boardBuilder = Board.builder();
		Criteria.CriteriaBuilder cb = Criteria.builder();
		List<Attach> attachs = new ArrayList<Attach>();
		for(FileItem fi : items) {
			if(fi.isFormField()) {
				if(fi.getFieldName().equals("id")) {
					boardBuilder.id(fi.getString("utf-8"));
				}
				else if(fi.getFieldName().equals("title")) {
					boardBuilder.title(fi.getString("utf-8"));
				}
				else if(fi.getFieldName().equals("content")) {
					boardBuilder.content(fi.getString("utf-8"));
				}
				else if(fi.getFieldName().equals("category")) {
					cb.category(Integer.parseInt(fi.getString("utf-8")));
				}
				else if(fi.getFieldName().equals("pageNum")) {
					cb.pageNum(Integer.parseInt(fi.getString("utf-8")));
				}
				else if(fi.getFieldName().equals("amount")) {
					cb.amount(Integer.parseInt(fi.getString("utf-8")));
				}
				else if(fi.getFieldName().equals("type")) {
					cb.type(fi.getString("utf-8"));
				}
				else if(fi.getFieldName().equals("keyword")) {
					cb.keyword(fi.getString("utf-8"));
				}
			}
			else {
				if (fi.getSize() == 0) continue;
				System.out.printf("파라미터 명: %s, 파일명: %s, 파일 크기: %d \n", fi.getFieldName(), fi.getName(), fi.getSize());
				try {
					String origin = fi.getName();
					String ext = "";
					if(origin.lastIndexOf(".") != -1) {
						ext = origin.substring(origin.lastIndexOf("."));
					}
					String uuid = UUID.randomUUID() + ext;
					String todayPath = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
					File path = new File(UploadUtils.REPOSITORY, todayPath);
					if(!path.exists()) {
						path.mkdirs();
					}
					File f = new File(path, uuid);
					String ct = Files.probeContentType(f.toPath());
					System.out.println(f);
					System.out.println(ct);
					boolean image = false;
					if (ct != null) {
						image = ct.startsWith("image");
					}
					fi.write(f);
					// 파일을 쓰고 난 뒤, 어딘가에 추가해야함
					attachs.add(Attach.builder().uuid(uuid).origin(origin).filePath(todayPath).image(image).build());
					
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}
		}
		Criteria criteria = cb.build();
		Board board = boardBuilder.category(criteria.getCategory()).attachs(attachs).build();
		boardService.register(board);
		resp.sendRedirect("list?" + criteria.getQs());
	}
}
