package com.spring.alltion.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alltion.productRegistration.ProductVO;
import com.spring.mapper.MainMapper;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
		@Override
		public List<ProductVO> getPopularList() {
			MainMapper mainMapper = sqlSession.getMapper(MainMapper.class);
			List<ProductVO> popularList = mainMapper.getPopularList();

			return popularList;
		}
		
		@Override
		public List<ProductVO> getRecentList() {
			MainMapper mainMapper = sqlSession.getMapper(MainMapper.class);
			List<ProductVO> recentList = mainMapper.getRecentList();
			
			return recentList;
		}
		
		@Override
		public List<ProductVO> getCloseDeadlineList() {
			MainMapper mainMapper = sqlSession.getMapper(MainMapper.class);
			List<ProductVO> closeDeadlineList = mainMapper.getCloseDeadlineList();
			
			return closeDeadlineList;
		}
}
