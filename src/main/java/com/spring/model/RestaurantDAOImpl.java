package com.spring.model;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class RestaurantDAOImpl implements RestaurantDAO{
	@Inject
	private SqlSessionTemplate sqlSession;
	
	
	// 레스토랑 전체 리스트를 가져오는 메서드
	@Override
	public List<Restaurant> getRestaurantList(Page pdto) {
		
		return sqlSession.selectList("RList",pdto);
		
	}

	// 글 작성하는 메서드
	@Override
	public int insert(Restaurant dto) {
		
		
		return sqlSession.update("insert", dto);
	}

	//검색 내용에 해당하는 게시글을 조회하는 메서드
	@Override
	public List<Restaurant> searchBoardList(Page pdto) {
		
		return this.sqlSession.selectList("search", pdto);
	}

	// 검색 시 검색 내용에 해당하는 게시글의 수를 조회하는 추상 메서드
	@Override
	public int searchBoardCount(Map<String, String> map) {
		
		return this.sqlSession.selectOne("count", map);
		
	}

	// 페이징 작업 시 필요한 전체 게시물의 수를 확인하는 메서드
	@Override
	public int getListCount() {
		
		return this.sqlSession.selectOne("cnt");
	}


	// 게시글 상세보기 메서드
	@Override
	public Restaurant content(int no) {
		
		return this.sqlSession.selectOne("no", no);
	}

	@Override
	public int updateBoard(Restaurant dto) {
		
		return this.sqlSession.update("update", dto);
	}

	// 게시글 삭제하는 메서드
	@Override
	public int deleteBoard(int no) {
		
		return this.sqlSession.delete("delete", no);
	}

	// 게시물 삭제시 번호 재작업 하는 메서드
	@Override
	public void updateSequence(int no) {
		
		this.sqlSession.update("Sequence", no);
		
	}

	// 조회수 증가시키는 메서드
	@Override
	public void viewCount(int no) {
		
		this.sqlSession.update("viewCount", no);
		
	}
	
	

}
