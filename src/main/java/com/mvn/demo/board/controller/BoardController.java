package com.mvn.demo.board.controller;

import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mvn.demo.SFV;
import com.mvn.demo.board.model.BoardVO;
import com.mvn.demo.board.service.BoardService;
import com.mvn.demo.common.model.ResultVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;

	/**
	 * 게시판 목록
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String boardListPage(Model model) {

		List<BoardVO> boardList = boardService.getBoardAllList();

		model.addAttribute("boardList", boardList);

//		for (BoardVO vo : boardList) {
//			log.info("{}", vo);
//		}

		return "/board/list";

	}

	/**
	 * 게시판 목록(kendo UI)
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/klist", method = RequestMethod.GET)
	public String boardKendoListPage(Model model) {

		List<BoardVO> boardList = boardService.getBoardAllList();

		model.addAttribute("boardList", boardList);

		for (BoardVO vo : boardList) {
			log.info("{}", vo);
		}

		return "/board/kList";

	}

	/**
	 * 게시판 목록 excel 파일로 다운로드
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/downloadExcelFile", method = RequestMethod.POST)
	public String downloadExcelFileBoardList(Model model) {

		List<BoardVO> boardList = boardService.getBoardAllList();

		SXSSFWorkbook workbook = boardService.excelFileDownloadProcess(boardList);

		model.addAttribute("locale", Locale.KOREA);
		model.addAttribute("workbook", workbook);
		model.addAttribute("workbookName", "게시판");

		return "excelDownloadView"; //servlet-context 설정 된 bean name을 실행
	}

	// kendo editor sample
	@RequestMapping(value = "/boardEditor", method = RequestMethod.GET)
	public String boardEditor(Model model) {
		return "/board/boardEditor";
	}

	@RequestMapping(value = "/ajaxTest", method = RequestMethod.POST)
	@ResponseBody
	public String ajaxTest(@RequestParam Map<String, Object> param) throws Exception {

		try {

			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyyMMDD");
			Date time = new Date();

			String toDay = simpleDate.format(time);
			Date selectDate = simpleDate.parse(toDay);
			Calendar cal = new GregorianCalendar(Locale.KOREA);
			cal.setTime(selectDate);
			toDay = simpleDate.format(cal.getTime());

			System.out.println(toDay);

			String txt = (String) param.get("editor_val");

			String filePath = "C:\\upload\\";
			String filePull = filePath + toDay + ".html";

			BufferedWriter fw = new BufferedWriter(new FileWriter(filePull, false));

			fw.write(txt);
			fw.flush();
			fw.close();

		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}

		return "success";
	}

	/**
	 * 게시글 상세 보기
	 *
	 * @param boardId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String boardDetailPage(@RequestParam(value = "id") int boardId, Model model) {

		log.info("boardId", boardId);

		BoardVO boardVORes = null;
		try {
			boardVORes = boardService.getBoardDetail(boardId);
		} catch (IOException e) {
			e.printStackTrace();
		}

		log.info("boardDetail controller: {}",boardVORes);

		model.addAttribute("boardDetail", boardVORes);

		// 해당 댓글 목록
		//		List<ReplyVO> replyVORes = replyService.getReplyList(boardId);
		//		model.addAttribute("replyList", replyVORes);

		return "/board/detail";
	}

	/**
	 * 게시글 등록 page
	 *
	 * @return
	 */
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String boardWritePage() {
		return "board/write";
	}

	/**
	 * 게시글 등록 처리 Process
	 *
	 * @param boardVO
	 * @return
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO register(@ModelAttribute BoardVO boardVO) {
		ResultVO result = new ResultVO();
		String title = boardVO.getTitle();
		String content = boardVO.getContent();
		Integer userId = boardVO.getUserId();

		log.info("====================");
		log.info("register:" + boardVO);
		log.info("====================");

		try {
			if (title != null && content != null && userId != null) {
				boardService.register(boardVO);

				result.setResCode(SFV.INT_RES_CODE_B_INSERT_SUCCESS);
				result.setResMsg(SFV.STRING_RES_B_INSERT_SUCCESS);
			}

		} catch (Exception e) {
			e.printStackTrace();
			result.setResCode(SFV.INT_RES_CODE_B_INSERT_FAIL);
			result.setResMsg(SFV.STRING_RES_B_INSERT_FAIL);
		}
		return result;
	}

	/**
	 * 게시글 수정 page
	 *
	 * @param boardId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String boardUpdatePage(@RequestParam(value = "id") Integer boardId, Model model) throws IOException {
		BoardVO boardVO = boardService.getBoardDetail(boardId);
		model.addAttribute("boardListDetail", boardVO);

		return "board/modify";
	}

	/**
	 * 게시글 수정
	 *
	 * @param boardVO
	 * @return
	 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	@ResponseBody
	public ResultVO modify(@ModelAttribute BoardVO boardVO) {
		ResultVO result = new ResultVO();
		String title = boardVO.getTitle();
		String content = boardVO.getContent();
		Integer userId = boardVO.getUserId();

		log.info("modify:" + boardVO);

		try {
			if (title != null && content != null && userId != null) {
				if (boardService.modify(boardVO)) {
					result.setResCode(SFV.INT_RES_CODE_B_UPDATE_SUCCESS);
					result.setResMsg(SFV.STRING_RES_B_UPDATE_SUCCESS);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.setResCode(SFV.INT_RES_CODE_B_UPDATE_FAIL);
			result.setResMsg(SFV.STRING_RES_B_UPDATE_FAIL);
		}

		return result;
	}
	
	
	@RequestMapping(value="/community/imageUpload", method = RequestMethod.POST )
	 public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
		 
		System.out.println("여기까지?");
       OutputStream out = null;
       PrintWriter printWriter = null;
       response.setCharacterEncoding("utf-8");
       response.setContentType("text/html;charset=utf-8");

       try{

           String fileName = upload.getOriginalFilename();
           byte[] bytes = upload.getBytes();
           System.out.println(request.getServletPath());
           String uploadPath = request.getServletContext().getRealPath("/img");
           File uploadFile = new File(uploadPath);
           if(!uploadFile.exists()) {
        	   uploadFile.mkdir();
           }
           
           System.out.println(uploadPath);
           
          // fileName = UUID.randomUUID().toString();
           uploadPath = uploadPath+ "/"+ fileName;
           out = new FileOutputStream(new File(uploadPath));
           out.write(bytes);
           
           String callback = request.getParameter("CKEditorFuncNum");

           printWriter = response.getWriter();
           
           String fileUrl = request.getContextPath() + "/img/" + fileName;
           printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                   + callback
                   + ",'"
                   + fileUrl
                   + "','이미지를 업로드 하였습니다.'"
                   + ")</script>");
        
           printWriter.flush();

       }catch(IOException e){
           e.printStackTrace();
       } finally {
           try {
               if (out != null) {
                   out.close();
               }
               if (printWriter != null) {
                   printWriter.close();
               }
           } catch (IOException e) {
               e.printStackTrace();
           }
       }

       return;
       }	
	

	/**
	 * 게시글 삭제
	 *
	 * @param boardVO
	 * @return
	 */
	//	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	//	@ResponseBody
	//	public ResultVO boardDelete(@RequestBody BoardVO boardVO) {
	//		ResultVO result = new ResultVO();
	//		Integer boardId = boardVO.getId();
	//		if (boardId != null) {
	//			try {
	//				List<BoardAttachVO> attachList = boardService.getAttachList(boardId);
	//
	//				log.info("attachList ={}", attachList);
	//
	//				if (boardService.remove(boardId)) {
	//					//delete attach files
	//					deleteFiles(attachList);
	//				}
	//				result.setResCode(SFV.INT_RES_CODE_B_DELETE_SUCCESS);
	//				result.setResMsg(SFV.STRING_RES_B_DELETE_SUCCESS);
	//			} catch (Exception e) {
	//				e.printStackTrace();
	//				result.setResCode(SFV.INT_RES_CODE_B_DELETE_FAIL);
	//				result.setResMsg(SFV.STRING_RES_B_DELETE_FAIL);
	//			}
	//		}
	//		return result;
	//	}

	//excel 파일 페이지
	//	@RequestMapping("/file")
	//	public String fileTestPage() {
	//		return "/board/fileTest";
	//	}

	// excel 파일 test
	//	@RequestMapping(value = "/downloadExcelFile", method = RequestMethod.POST)
	//    public String downloadExcelFile(Model model) {
	//        String[] names = {"자몽", "애플망고", "멜론", "오렌지"};
	//        long[] prices = {5000, 10000, 7000, 6000};
	//        int[] quantities = {50, 50, 40, 40};
	//        List<Fruit> list = boardService.makeFruitList(names, prices, quantities);
	//
	//        SXSSFWorkbook workbook = boardService.excelFileDownloadProcess(list);
	//
	//        model.addAttribute("locale", Locale.KOREA);
	//        model.addAttribute("workbook", workbook);
	//        model.addAttribute("workbookName", "과일표");
	//
	//        return "excelDownloadView"; //servlet-context 설정 된 bean name을 실행
	//    }

}
