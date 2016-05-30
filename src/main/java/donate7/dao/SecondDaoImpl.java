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
	
	public List<Second> mlist(int no) {
		return st.selectList("second.msecondList", no);
	}


	public List<Second> olist(int no) {
		return st.selectList("second.osecondList", no);
	}

	public List<Second> adlist() {
		return st.selectList("second.adsecondList");
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
	public int count(Second second) {
		return st.selectOne("second.count", second);
	}

	public void delete(int sh_no) {
		st.selectOne("second.msdelete", sh_no);
	}	

}
