package donate7.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Cpoint_info;

@Repository
public class Cpoint_InfoDaoImpl implements Cpoint_InfoDao{
	@Autowired
	private SqlSessionTemplate st;
	public int sumPoint(int m_no) {
		return st.selectOne("cpoint_info.sumPoint",m_no);
	}
	public int insert(Cpoint_info ci) {
		int cp_no = st.selectOne("cpoint_info.selectNum");
		ci.setCp_no(cp_no);
		return st.insert("cpoint_info.insert",ci);
	}
	public int getTotal(int m_no) {
		return st.selectOne("cpoint_info.getTotal",m_no);
	}
	public List<Cpoint_info> list(int startRow, int endRow, int m_no) {
		HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
		hashMap.put("startRow", startRow);
		hashMap.put("endRow", endRow);
		hashMap.put("m_no", m_no);
		return st.selectList("cpoint_info.list",hashMap);
	}
	public int sumCash(int m_no) {
		return st.selectOne("cpoint_info.sumCash",m_no);
	}

}
