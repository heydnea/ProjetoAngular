package teste;

import controle.CarroCtrl;
import entidade.Carro;

public class Teste {
	
	public static void main(String[] args) {
		
		Carro c = new  Carro;
		
		c.setModelo("Ford");
		c.setNome("Ka");
		
		CarroCtrl console = new CarroCtrl();
		controle.insert(c);
		
		for (Carro carro: new CarroCrtl().select(Carro.CONS_CARRO_ALL)) {
			
			System.out.println("Id: "+ carro.getId());
			System.out.println("Nome: " + carro.getNome());
			System.out.println("Modelo: " + carro.getModelo());
		}
	}
}
