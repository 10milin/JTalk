package com.jtalk.action;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jtalk.core.Action;
import com.jtalk.dao.AnonyDAO;
import com.jtalk.dao.AwesomeDAO;
import com.jtalk.dao.CommentDAO;
import com.jtalk.dao.ExchangeDAO;
import com.jtalk.dao.FoodDAO;
import com.jtalk.dao.ItDAO;
import com.jtalk.dao.JapaneseDAO;
import com.jtalk.dao.LifeDAO;
import com.jtalk.dao.NanumDAO;
import com.jtalk.dao.NoticeDAO;
import com.jtalk.dao.StudyDAO;
import com.jtalk.dao.TradeDAO;
import com.jtalk.dao.WeDAO;
import com.jtalk.dto.AnonyDTO;
import com.jtalk.dto.CommentDTO;
import com.jtalk.dto.ExchangeDTO;
import com.jtalk.dto.FoodDTO;
import com.jtalk.dto.ItDTO;
import com.jtalk.dto.JapaneseDTO;
import com.jtalk.dto.LifeDTO;
import com.jtalk.dto.MemberDTO;
import com.jtalk.dto.NanumDTO;
import com.jtalk.dto.NoticeDTO;
import com.jtalk.dto.StudyDTO;
import com.jtalk.dto.TradeDTO;
import com.jtalk.dto.WeDTO;

public class IndexAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		/* Default URL */
		String resURL = "/pages/main.jsp";
		ServletContext ctx =  request.getServletContext();
		ctx.setAttribute("version", "Alpha");
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		AnonyDAO anonyDAO = AnonyDAO.getInstance();
		CommentDAO commentDAO = CommentDAO.getInstance();
		AwesomeDAO awesomeDAO = AwesomeDAO.getInstance();
		TradeDAO tradeDAO = TradeDAO.getInstance();
		NanumDAO nanumDAO = NanumDAO.getInstance();
		WeDAO weDAO = WeDAO.getInstance();
		StudyDAO studyDAO = StudyDAO.getInstance();
		ExchangeDAO exchangeDAO = ExchangeDAO.getInstance();
		ItDAO itDAO = ItDAO.getInstance();
		JapaneseDAO japaneseDAO = JapaneseDAO.getInstance();
		FoodDAO foodDAO = FoodDAO.getInstance();
		LifeDAO lifeDAO = LifeDAO.getInstance();
		
		
		ArrayList<NoticeDTO> notice = noticeDAO.getAllNotice();
		ArrayList<NoticeDTO> newNotice = new ArrayList<NoticeDTO>();
		
		ArrayList<AnonyDTO> anony = anonyDAO.getAllAnony();
		ArrayList<AnonyDTO> newAnony = new ArrayList<AnonyDTO>();
		
		ArrayList awesomeArray = new ArrayList();
		ArrayList<ArrayList<CommentDTO>> cmtList = new ArrayList<ArrayList<CommentDTO>>();
		ArrayList<Integer> countList = new ArrayList<Integer>();
		
		ArrayList<TradeDTO> trade = tradeDAO.getAllTrade();
		ArrayList<TradeDTO> newTrade = new ArrayList<TradeDTO>();
		
		ArrayList<NanumDTO> nanum = nanumDAO.getAllNanum();
		ArrayList<NanumDTO> newNanum = new ArrayList<NanumDTO>();
		
		ArrayList<WeDTO> we = weDAO.getAllWe();
		ArrayList<WeDTO> newWe = new ArrayList<WeDTO>();
		
		ArrayList<StudyDTO> study = studyDAO.getAllStudy();
		ArrayList<StudyDTO> newStudy = new ArrayList<StudyDTO>();
		
		ArrayList<ExchangeDTO> exchange = exchangeDAO.getAllExchange();
		ArrayList<ExchangeDTO> newExchange = new ArrayList<ExchangeDTO>();
		
		ArrayList<ItDTO> it = itDAO.getAllIt();
		ArrayList<ItDTO> newIt = new ArrayList<ItDTO>();
		
		ArrayList<JapaneseDTO> japanese = japaneseDAO.getAllJapanese();
		ArrayList<JapaneseDTO> newJapanese = new ArrayList<JapaneseDTO>();
		
		ArrayList<FoodDTO> food = foodDAO.getAllFood();
		ArrayList<FoodDTO> newFood = new ArrayList<FoodDTO>();
		
		ArrayList<LifeDTO> life = lifeDAO.getAllLife();
		ArrayList<LifeDTO> newLife = new ArrayList<LifeDTO>();
		
		//공지사항
		if(notice.size() != 0) {
			for(int i = 0; i < notice.size(); i++) {
				if(i > 4) {
					break;
				}
				newNotice.add(notice.get(i));
			}
		}
		
		//우리끼리
		if(we.size() != 0) {
			for(int i = 0; i < we.size(); i++) {
				if(i > 4) {
					break;
				}
				newWe.add(we.get(i));
			}
		}
		
		//스터디모집
		if(study.size() != 0) {
			for(int i = 0; i < study.size(); i++) {
				if(i > 4) {
					break;
				}
				newStudy.add(study.get(i));
			}
		}
		
		//선후배교류
		if(exchange.size() != 0) {
			for(int i = 0; i < exchange.size(); i++) {
				if(i > 4) {
					break;
				}
				newExchange.add(exchange.get(i));
			}
		}
		
		//IT
		if(it.size() != 0) {
			for(int i = 0; i < it.size(); i++) {
				if(i > 4) {
					break;
				}
				newIt.add(it.get(i));
			}
		}
		
		//일본어
		if(japanese.size() != 0) {
			for(int i = 0; i < japanese.size(); i++) {
				if(i > 4) {
					break;
				}
				newJapanese.add(japanese.get(i));
			}
		}
		
		//주변맛집
		if(food.size() != 0) {
			for(int i = 0; i < food.size(); i++) {
				if(i > 4) {
					break;
				}
				newFood.add(food.get(i));
			}
		}
		
		//생활정보
		if(life.size() != 0) {
			for(int i = 0; i < life.size(); i++) {
				if(i > 4) {
					break;
				}
				newLife.add(life.get(i));
			}
		}
		
		//대나무숲
		if(anony.size() != 0) {
			for(int i = 0; i < anony.size(); i++) {
				if(i > 2) {
					break;
				}
				newAnony.add(anony.get(i));
				countList.add(commentDAO.countComment("anony", anony.get(i).getNum()));
				cmtList.add(commentDAO.getCommentList("anony", anony.get(i).getNum()));
				if(member != null) awesomeArray.add(awesomeDAO.checkLike(anony.get(i).getNum(), member.getEmail()));
			}
		}
		
		//중고나라
		if(trade.size() != 0) {
			for(int i = 0; i < trade.size(); i++) {
				if(i > 2) {
					break;
				}
				newTrade.add(trade.get(i));
			}
		}
		
		//행복나눔
		if(nanum.size() != 0) {
			for(int i = 0; i < nanum.size(); i++) {
				if(i > 2) {
					break;
				}
				newNanum.add(nanum.get(i));
			}
		}
		
		request.setAttribute("newNotice", newNotice);
		request.setAttribute("newWe", newWe);
		request.setAttribute("newStudy", newStudy);
		request.setAttribute("newExchange", newExchange);
		
		request.setAttribute("newIt", newIt);
		request.setAttribute("newJapanese", newJapanese);
		request.setAttribute("newFood", newFood);
		request.setAttribute("newLife", newLife);
		
		request.setAttribute("newTrade", newTrade);
		request.setAttribute("newNanum", newNanum);
		request.setAttribute("newAnony", newAnony);
		request.setAttribute("awesomeArray", awesomeArray);
		request.setAttribute("countList", countList);
		request.setAttribute("commentList", cmtList);
		
		request.setAttribute("ItSize", it.size());
		request.setAttribute("ItNew", itDAO.getNewCount());
		
		request.setAttribute("JapaneseSize", japanese.size());
		request.setAttribute("JapaneseNew", japaneseDAO.getNewCount());
		
		request.setAttribute("FoodSize", food.size());
		request.setAttribute("FoodNew", foodDAO.getNewCount());
		
		request.setAttribute("LifeSize", life.size());
		request.setAttribute("LifeNew", lifeDAO.getNewCount());
		
		return resURL;
	}
	
}
