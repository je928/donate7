package donate7.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donate7.dao.VolDao;
import donate7.model.VolReq;
@Service
public class VolServiceImpl implements VolService {
	@Autowired
	VolDao vd;
	
	@Override
	public int volReqInsert(VolReq req) {
		return vd.volReqInsert(req);
	}

}
