package donate7.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donate7.model.Second;
@Repository
public class SecondDaoImpl implements SecondDao{
	@Autowired 
	private SqlSessionTemplate st;
	public List<Second> list() {
		return st.selectList("second.secondList");
	}
	
	public Second selectOne(int sh_no) {
		return st.selectOne("second.selectOne", sh_no);
	}
	public int insert(Second second) {
		int sh_no = st.selectOne("second.selectNum");
		second.setSh_no(sh_no);
		return st.insert("second.msecondListinsert", second);
	}
	
	public List<Second> mlist(Second second) {
		return st.selectList("second.msecondList", second);
	}


	public List<Second> olist(Second second) {
		return st.selectList("second.osecondList", second);
	}

	public List<Second> adlist(Second second) {
		return st.selectList("second.adsecondList", second);
	}
	public int secondUpdate(Second second) {
		int result=0;
		try{
			result= st.update("second.msecondUpdate",second);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return result;
	}
	public int count(int no) {
		return st.selectOne("second.adsecondTotal", no);
	}

	public void delete(int sh_no) {
		st.selectOne("second.msdelete", sh_no);
	}

	public int spUpdate(int sh_no) {
		return st.update("second.spUpdate", sh_no);
	}

	public void spCancel(int sh_no) {
		st.update("second.spCancel", sh_no);
	}

	public void srCancel(int sh_no) {
		st.update("second.srCancel", sh_no);
		
	}

	public int srUpdate(int sh_no) {
		return st.update("second.srUpdate", sh_no);
	}

	public int count(Second second) {
		return st.selectOne("second.count", second);
	}

	public int getTotal(Second second) {
		return st.selectOne("second.getTotal", second);
	}

	public int memTotal(Second second) {
		
		return st.selectOne("second.memTotal", second);
	}

	public List<Second> admlist(Second second) {
	
		return st.selectList("second.admlist",second);
	}

	public int arrTotal(Second second) {
	
		return st.selectOne("second.arrTotal", second);
	}

	public int orTotal(Second second) {
		return st.selectOne("second.orTotal", second);
	}

	public List<Second> adolist(Second second) {
		return st.selectList("second.adolist", second);
	}

	public int oarrTotal(Second second) {
		return st.selectOne("second.oarrTotal", second);
	}
	
}
