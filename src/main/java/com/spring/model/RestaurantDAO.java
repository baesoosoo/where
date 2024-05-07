package com.spring.model;

import java.util.List;
import java.util.Map;

public interface RestaurantDAO {

	// 페이징 작업 시 필요한 전체 게시물의 수를 확인하는 메서드
	int getListCount();
	
	// 레스토랑 전체 리스트를 가져오는 메서드
	List<Restaurant> getRestaurantList(Page pdto);
	
	// 글 작성하는 메서드
	int insert(Restaurant dto);
	
	//검색 내용에 해당하는 게시글을 조회하는 메서드
	List<Restaurant> searchBoardList(Page page);
	
	// 검색 시 검색 내용에 해당하는 게시글의 수를 조회하는 추상 메서드
	int searchBoardCount(Map<String, String>map);
	
	// 게시글 상세내용 가져오는 메서드
	Restaurant content(int no);
	
	// 게시글 수정하는 메서드
	int updateBoard(Restaurant dto);
	
	// 게시글 삭제하는 메서드
	int deleteBoard(int no);
	
	// 게시물 삭제시 번호 재작업 하는 메서드
	void updateSequence(int no);
	
	// 조회수 증가시키는 메서드
	void viewCount(int no);
}
