package donate7.dao;

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
	public int buyGift(Cpoint_info ci) {
		int cp_no = st.selectOne("cpoint_info.selectNum");
		ci.setCp_no(cp_no);
		return st.insert("cpoint_info.insert",ci);
	}

}
