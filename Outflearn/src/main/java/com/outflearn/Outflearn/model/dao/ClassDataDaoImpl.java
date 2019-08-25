package com.outflearn.Outflearn.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.outflearn.Outflearn.dto.ClassCategoryDto;
import com.outflearn.Outflearn.dto.ClassDataDto;
import com.outflearn.Outflearn.dto.ClassInfoDto;
import com.outflearn.Outflearn.dto.ClassIntroduceDto;
import com.outflearn.Outflearn.dto.ClassReviewDto;
import com.outflearn.Outflearn.dto.QADto;
import com.outflearn.Outflearn.dto.SubStreamDto;

@Repository
public class ClassDataDaoImpl implements ClassDataDao {

	@Autowired
	public SqlSessionTemplate sqlSession;

//	--------------------------------------------------- 강좌 정보(CLASS_INFO)
	@Override
	public List<ClassInfoDto> ClassInfoSelectList() {

		List<ClassInfoDto> list = new ArrayList<ClassInfoDto>();

		try {
			list = sqlSession.selectList(namespace + "ClassInfoSelectlist");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ClassInfoDto ClassInfoSelectOne(int class_num) {

		ClassInfoDto dto = new ClassInfoDto();

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_num", class_num);

		dto = sqlSession.selectOne(namespace + "ClassInfoSelectone", map);

		return dto;
	}
	
	@Override
	public List<ClassInfoDto> classInfoSelectListUser(int user_num) {
		
		List<ClassInfoDto> list = new ArrayList<ClassInfoDto>();
		
		
		try {
			list = sqlSession.selectList(namespace + "classInfoSelectListUser", user_num);
		} catch (Exception e) {
			System.out.println("오냐");
			e.printStackTrace();
		} 
		
		return list;
	}

	@Override
	public int ClassInfoInsert(ClassInfoDto dto) {
		int res = 0;

		res = sqlSession.insert(namespace + "ClassInfoDtoInsert", dto);

		return res;
	}
	
	@Override
	public List<ClassInfoDto> ClassSubName(int sub_num) {
		System.out.println("왜 안와??" + sub_num);
		
		
		List<ClassInfoDto> list = sqlSession.selectList(namespace + "ClassSubName", sub_num); 

		
		System.out.println("여기오니??");
		return list;
	}


// --------------------------------------------------- 강좌 내용(CLASS_INTRODUCE)
	@Override
	public ClassIntroduceDto ClassIntroduceSelectList(int class_num) {

		ClassIntroduceDto dto = sqlSession.selectOne(namespace + "classIntroduceSelectlist", class_num);

		return dto;
	}

	@Override
	public int ClassIntroduceInsert(ClassIntroduceDto dto) {

		int res = 0;

		res = sqlSession.insert(namespace + "ClassIntroduceInsert", dto);

		return res;
	}

//	--------------------------------------------------- 강좌 데이터(CLASS_DATA)
	@Override
	public List<ClassDataDto> ClassDataSelectList() {

		List<ClassDataDto> list = new ArrayList<ClassDataDto>();

		try {
			list = sqlSession.selectList(namespace + "ClassDateSelectlist");
		} catch (Exception e) {

			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ClassInfoDto> CategorySelectList(String class_category) {

		List<ClassInfoDto> list = new ArrayList<ClassInfoDto>();

		Map<String, String> map = new HashMap<String, String>();
		map.put("class_category", class_category);

		try {
			list = sqlSession.selectList(namespace + "CategorySelectList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ClassDataDto ClassDataSelectOne(int class_num) {

		ClassDataDto dto = new ClassDataDto();

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_num", class_num);
		System.out.println("daoImpl : " + class_num);
		dto = sqlSession.selectOne(namespace + "classdataselectone", map);

		return dto;
	}

//  유튜브 영상
	@Override
	public int ClassDataInsert(ClassDataDto dto) {
		int res = 0;

		res = sqlSession.insert(namespace + "ClassDataInsert", dto);

		return res;
	}

//	챕터 추가
	@Override
	public int ClassChapterDataInsert(ClassDataDto dto) {
		int res = 0;

		res = sqlSession.insert(namespace + "ClassChapterDataInsert", dto);

		return res;
	}
	
//	--------------------------------------------------- 장바구니(BASKET)
	@Override
	public int classBasketInsert(ClassInfoDto dto) {
		
		int res = 0;
		
		res = sqlSession.insert(namespace + "classBasketInsert", dto); 
		
		return res;
	}

	@Override
	public int classBasketDelete(int class_num) {
		
		int res = 0;
		
		res = sqlSession.delete(namespace + "classBasketDelete", class_num); 
		
		return res;
	}

	@Override
	public ClassIntroduceDto ClassIntroduceSelectOne(int class_num) {
		ClassIntroduceDto dto = new ClassIntroduceDto();

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("class_num", class_num);
		System.out.println("daoImpl : " + class_num);
		dto = sqlSession.selectOne(namespace + "classIntroduceselectone", map);

		return dto;
	}


	// --------------------------------------------------- 댓글
	@Override
	public List<ClassReviewDto> ClassReviewSelectList(int class_num) {

		List<ClassReviewDto> list = new ArrayList<ClassReviewDto>();

		try {
			list = sqlSession.selectList(namespace + "classReviewSelectlist", class_num);
		} catch (Exception e) {

			e.printStackTrace();
		}

		return list;
	}

	@Override
	public ClassReviewDto ClassReviewSelectOne(int review_num) {

		ClassReviewDto dto = sqlSession.selectOne(namespace + "classReviewSelectOne", review_num);

		return dto;
	}

	@Override
	public int ClassReviewInsert(ClassReviewDto dto) {

		int res = 0;

		res = sqlSession.insert(namespace + "classReviewInsert", dto);

		return res;
	}

	@Override
	public int ClassReviewUpdate(ClassReviewDto dto) {

		int res = 0;

		res = sqlSession.update(namespace + "classReviewUpdate", dto);

		return res;
	}

	@Override
	public int ClassReviewDelete(int review_num) {

		int res = 0;

		res = sqlSession.delete(namespace + "classReviewDelete", review_num);

		return res;
	}

	//페이징
			
	@Override
	public int selectTotalCount(String txt_search) {
		
		int res = 0;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("txt_search", txt_search);
		res = sqlSession.selectOne(namespace + "selectTotalCount", map);
		
		return res;
	}
	
	@Override
	public List<ClassInfoDto> selectListPage(int firstIndex, int recordCountPerPage, String txt_search) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("firstIndex", String.valueOf(firstIndex));
		map.put("recordCountPerPage", String.valueOf(recordCountPerPage));
		map.put("txt_search", txt_search);
//		map.put("searchOption", searchOption);
		
		List<ClassInfoDto> list = sqlSession.selectList(namespace + "selectListPage", map);
		return list;
	}
	
	@Override
	public List<ClassInfoDto> selectListPageTwo(int firstIndex, int recordCountPerPage, String txt_search,
			String searchOption) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("firstIndex", String.valueOf(firstIndex));
		map.put("recordCountPerPage", String.valueOf(recordCountPerPage));
		map.put("txt_search", txt_search );
		map.put("searchOption", searchOption);
		
		List<ClassInfoDto> list = sqlSession.selectList(namespace +"selectListPageTwo", map);
		System.out.println(list);
		return list;
	}
	
	
	@Override
	public int selectTotalCountTwo(String txt_search, String searchOption) {
		
		int res = 0;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("txt_search", txt_search);
		res = sqlSession.selectOne(namespace + "selectTotalCountTwo", map);
		System.out.println(txt_search+"다오임플");
		System.out.println(searchOption);
		System.out.println(res);
		return res;
	}
	@Override
	public int ClassReviewUpdateAnswer(int review_num) {

		int res = 0;

		res = sqlSession.update(namespace + "classReviewUpdateAnswer", review_num);

		return res;
	}

	@Override
	public int ClassReviewInsertAnswer(ClassReviewDto dto) {
		
		int res = 0;
		
		res = sqlSession.insert(namespace + "classReviewInsertAnswer", dto);
		
		return res;
	}
	
	
	@Override
	public List<SubStreamDto> MainStreamSelectOne(int main_num) {
		
		List<SubStreamDto> list = new ArrayList<SubStreamDto>();

		try {
			list = sqlSession.selectList(namespace + "MainStreamSelectOne", main_num);
		} catch (Exception e) {

			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public int ClassCategoryInsert(int main_num, int sub_num) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("main_num", main_num);
		map.put("sub_num", sub_num);
		
		int list = sqlSession.insert(namespace + "ClassCategoryInsert", map); 
		
		return list;
	}	
	
/*		
=======
>>>>>>> origin/syh
	@Override
	public int mainStreamInsert(MainStreamDto dto) {
		
		int res = sqlSession.insert(namespace + "mainStreamInsert", dto);
		
		return res;
	}

	@Override
	public int subStreamInsert(SubStreamDto dto) {
		
		int res = sqlSession.insert(namespace + "subStreamInsert", dto);
		
		return res;
	}

*/
	
	@Override
	public List<QADto> QASelectList(int class_num) {
		
		List<QADto> list = new ArrayList<QADto>();
		
		try {
			list = sqlSession.selectList(namespace + "QASelectList", class_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public QADto QASelectOne(int qa_num) {
		
		QADto dto = sqlSession.selectOne(namespace + "QASelectOne", qa_num);
		
		return dto;
	}
	
	

	@Override
	public List<QADto> QAReply(int qa_group_no) {
		
		List<QADto> list = new ArrayList<QADto>();
		
		try {
			list = sqlSession.selectList(namespace + "QAReply", qa_group_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int QAInsert(QADto dto) {
		
		int res = 0;
		
		res = sqlSession.insert(namespace + "QAInsert", dto);
		
		return res;
	}

	
	@Override
	public int QAReplyInsert(QADto dto) {
		
		int res = 0;
		
		res = sqlSession.insert(namespace + "QAReplyInsert", dto);
		
		return res;
	}
	
	@Override
	public int QAReplyUpdate(QADto dto) {
		
		int res = 0;
		
		res = sqlSession.update(namespace + "QAReplyUpdate", dto);
		
		return res;
	}

}
