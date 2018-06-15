package service;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import controle.CarroCtrl;
import entidade.Carro;

@Path("/carro")
public class CarroService {

	@Get
	@Path("/sected")
	
	public Response select() {
		return Response.ok(new CarroCtrl().selectTo(Carro.CONS_CARRO_ALL), MediaType.APPLICATION_JSON).build();
	}
	
	@POST
	@Path("/save")
	public void save(Carro carro) {
		new CarroCtrl().insert(carro);
	}
	
	@POST
	@Path("/update")
	public void update(Carro carro) {
		new CarroCtrl().update(carro);
	}
	
	@POST
	@Path("/delete")
	public void delete(Carro carro) {
		new CarroCtrl().delete(carro);
	}
}
