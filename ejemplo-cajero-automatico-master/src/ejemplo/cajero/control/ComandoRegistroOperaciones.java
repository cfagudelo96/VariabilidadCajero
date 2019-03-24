package ejemplo.cajero.control;

import ejemplo.cajero.CajeroLogger;
import ejemplo.cajero.modelo.Banco;

public class ComandoRegistroOperaciones implements Comando {

	@Override
	public String getNombre() {
		return "Ver registro de operaciones";
	}

	@Override
	public void ejecutar(Banco contexto) throws Exception {
		System.out.println("Registro de operaciones");
		System.out.println();
		
		for(String operacion : CajeroLogger.getInstance().darOperaciones()) {
			System.out.println(operacion);
		}
	}

}
