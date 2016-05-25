package donate7.dao;

import java.util.List;

import donate7.model.SidoGugun;

public interface SidoDao {
	List<SidoGugun> selectSido();
	List<SidoGugun> selectGugunBySido_No(int sido_no);
}
