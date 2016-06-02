package donate7.service;

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

}
