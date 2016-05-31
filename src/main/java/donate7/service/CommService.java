package donate7.service;

import java.util.List;

import donate7.model.Dclass;
import donate7.model.SidoGugun;
import donate7.model.Subject;

public interface CommService {
	List<SidoGugun> selectSido();
	List<SidoGugun> selectGugunBySido_No(int sido_no);
	List<Class> selectClass();
	List<Dclass> selectDclassByClass_no(int class_no);
	List<Subject> selectSubject();
}
