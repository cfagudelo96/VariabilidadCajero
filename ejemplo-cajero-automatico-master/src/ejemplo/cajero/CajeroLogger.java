package ejemplo.cajero;

import java.util.ArrayList;
import java.util.List;

public class CajeroLogger {
	private List<String> operaciones;
	
	private static final CajeroLogger logger = new CajeroLogger();
	
	private CajeroLogger() {
		this.operaciones = new ArrayList<String>();
	}
	
	public static CajeroLogger getInstance() {
		return logger;
	}
	
	public void logComando(String comando, String descripcion) {
		this.operaciones.add("Se ejecutó el comando " + comando + " con la siguiente información: " + descripcion);
	}
	
	public List<String> darOperaciones() {
		return operaciones;
	}
}
