package donate7.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.SidoDao;
import donate7.model.SidoGugun;
@Service
public class SidoServiceImpl implements SidoService {
	@Autowired
	private SidoDao sd;

	@Override
	public List<SidoGugun> selectSido() {
		return sd.selectSido();
	}

	@Override
	public List<SidoGugun> selectGugunBySido_No(int sido_no) {
		return sd.selectGugunBySido_No(sido_no);
	}
	
}
