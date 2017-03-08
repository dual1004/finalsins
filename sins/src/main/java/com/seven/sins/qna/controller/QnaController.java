package com.seven.sins.qna.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.seven.sins.qna.service.QnaService;
import com.seven.sins.qna.vo.QnaComment;
import com.seven.sins.qna.vo.QnaContent;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;

	@RequestMapping("selectQna.n")
	public ModelAndView selectList(ModelAndView mv, @RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "option", required = false) String option) {

		int currentPage = 1;
		int listLimit = 10;

		if (page != null)
			currentPage = Integer.parseInt(page);

		int totalListCount = 0;

		if (keyword == null)
			totalListCount = qnaService.getListCount();
		else
			totalListCount = qnaService.getKeywordCount(option, keyword);

		int maxPage = (int) ((double) totalListCount / listLimit + 0.9);

		int startPage = (((int) ((double) currentPage / listLimit + 0.9)) - 1) * listLimit + 1;

		int endPage = startPage + listLimit - 1;

		if (maxPage < endPage)
			endPage = maxPage;

		List<QnaContent> qnaList;
		
		if (keyword == null)
			qnaList = qnaService.selectList(currentPage, listLimit);
			
		
		else{
			qnaList = qnaService.searchList(currentPage, listLimit, option, keyword);
			mv.addObject("keyword", keyword);
			mv.addObject("option", option);
		}
		
		mv.addObject("totalCount", totalListCount);
		mv.addObject("qnaList", qnaList);
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		

		mv.setViewName("qna/QnaMain");
		return mv;
	}

	@RequestMapping("detailQna.n")
	public ModelAndView detailView(ModelAndView mv, @RequestParam(value = "no", required = false) String no) {

		if (no != null) {
			int qNo = Integer.parseInt(no);

			qnaService.increaseCount(qNo);
			QnaContent qc = qnaService.getContent(qNo);
			ArrayList<QnaComment> commentList = qnaService.getCommentList(qNo);

			mv.addObject("qna", qc);
			mv.addObject("commentList", commentList);

			mv.setViewName("qna/QnaDetail");

		} else {
			// 에러
		}

		return mv;
	}

	@RequestMapping("insertCom.n")
	public @ResponseBody Map<String, ArrayList<QnaComment>> insertCom(@RequestParam(value = "content") String content,
			@RequestParam(value = "qnaNo") int qnaNo, @RequestParam(value = "userId", required = false) String userId,
			@RequestParam(value = "lev") int lev, QnaComment qc) {

		
		Map<String, ArrayList<QnaComment>> map = new HashMap<String, ArrayList<QnaComment>>();

		qc.setBackupId("user01");
		qc.setClassify("QNA_COMMENT");
		qc.setContent(content);
		qc.setFilepath(null);
		qc.setLev(lev);
		qc.setQnaNo(qnaNo);
		qc.setRef(0);
		qc.setUserId("user01");

		int result = qnaService.insertCom(qc);

		ArrayList<QnaComment> comList = qnaService.getCommentList(qnaNo);

		if (result > 0) {
			map.put("comList", comList);

		} else {
			// 실패
		}
		return map;
	}
	
	

	@RequestMapping("write.n")
	public String qnaWrite(QnaContent qna, @RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content,
			@SessionAttribute(value = "loginUser", required = false) String loginUser) {
		qna.setUserId("user01");
		qna.setTitle(title);
		qna.setContent(content);

		int result = qnaService.insertQna(qna);

		String viewName = "";
		if (result > 0) {
			viewName = "redirect:selectQna.n";
		} else {
			viewName = "qna/error?message=글쓰기 에러";
		}

		return viewName;
	}

	




/*@RequestMapping("/file_uploader_html5")
	 public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response){
		try {
			 //파일정보
			 String sFileInfo = "";
			 //파일명을 받는다 - 일반 원본파일명
			 String filename = request.getHeader("file-name");
			 //파일 확장자
			 String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
			 //확장자를소문자로 변경
			 filename_ext = filename_ext.toLowerCase();
			 	
			 //이미지 검증 배열변수
			 String[] allow_file = {"jpg","png","bmp","gif"};

			 //돌리면서 확장자가 이미지인지 
			 int cnt = 0;
			 for(int i=0; i<allow_file.length; i++) {
			 	if(filename_ext.equals(allow_file[i])){
			 		cnt++;
			 	}
			 }

			 //이미지가 아님
			 if(cnt == 0) {
				 PrintWriter print = response.getWriter();
				 print.print("NOTALLOW_"+filename);
				 print.flush();
				 print.close();
			 } else {
			 //이미지이므로 신규 파일로 디렉토리 설정 및 업로드	
			 //파일 기본경로
			 String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			 //파일 기본경로 _ 상세경로
			 String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator +"multiupload" + File.separator;
			 File file = new File(filePath);
			 if(!file.exists()) {
			 	file.mkdirs();
			 }
			 String realFileNm = "";
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			 String today= formatter.format(new java.util.Date());
			 realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			 String rlFileNm = filePath + realFileNm;
			 ///////////////// 서버에 파일쓰기 ///////////////// 
			 InputStream is = request.getInputStream();
			 OutputStream os=new FileOutputStream(rlFileNm);
			 int numRead;
			 byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			 while((numRead = is.read(b,0,b.length)) != -1){
			 	os.write(b,0,numRead);
			 }
			 if(is != null) {
			 	is.close();
			 }
			 os.flush();
			 os.close();
			 ///////////////// 서버에 파일쓰기 /////////////////

			 // 정보 출력
			 sFileInfo += "&bNewLine=true";
			 // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
			 sFileInfo += "&sFileName="+ filename;;
			 sFileInfo += "&sFileURL="+"/resources/editor/multiupload/"+realFileNm;
			 PrintWriter print = response.getWriter();
			 print.print(sFileInfo);
			 print.flush();
			 print.close();
			 }	
		} catch (Exception e) {
			e.printStackTrace();
		}
}*/


}
