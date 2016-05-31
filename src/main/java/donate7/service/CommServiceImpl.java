package donate7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.CommDao;
import donate7.model.Dclass;
import donate7.model.SidoGugun;
import donate7.model.Subject;
@Service
public class CommServiceImpl implements CommService {
	@Autowired
	private CommDao cd;
	
	@Override
	public List<SidoGugun> selectSido() {
		return cd.selectSido();
	}

	@Override
	public List<SidoGugun> selectGugunBySido_No(int sido_no) {
		return cd.selectGugunBySido_No(sido_no);
	}

	@Override
	public List<Class> selectClass() {
		return cd.selectClass();
	}

	@Override
	public List<Dclass> selectDclassByClass_no(int class_no) {
		return cd.selectDclassByClass_no(class_no);
	}

	@Override
	public List<Subject> selectSubject() {
		return cd.selectSubject();
	}

}
