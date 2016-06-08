package donate7.service;

import java.util.HashMap;
import java.util.List;

import donate7.model.Register;

public interface RegisterService {
	int insert(Register register);

	List<Register> list();

	Register selectOne(int re_no);

	int updateChk(HashMap<Object, Object> hashMap);
}
