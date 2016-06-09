package donate7.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.RegisterDao;
import donate7.model.Register;
@Service
public class RegisterServiceImpl implements RegisterService{
	@Autowired
	private RegisterDao rd;
	public int insert(Register register) {
		return rd.insert(register);
	}
	public List<Register> list(int startRow, int endRow, int m_no, String sort) {
		return rd.list(startRow,endRow,m_no,sort);
	}
	public Register selectOne(int re_no) {
		return rd.selectOne(re_no);
	}
	public int updateChk(HashMap<Object, Object> hashMap) {
		return rd.updateChk(hashMap);
	}
	public int getTotal(Register reg) {
		return rd.getTotal(reg);
	}

}
