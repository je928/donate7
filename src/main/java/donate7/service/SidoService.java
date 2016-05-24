package donate7.service;

import java.util.List;

import donate7.model.SidoGugun;

public interface SidoService {
	List<SidoGugun> selectSido();
	List<SidoGugun> selectGugunBySido_No(int sido_no);
}
