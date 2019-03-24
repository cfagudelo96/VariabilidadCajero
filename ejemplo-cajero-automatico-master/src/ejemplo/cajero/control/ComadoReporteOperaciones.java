package ejemplo.cajero.control;

import java.io.FileWriter;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import ejemplo.cajero.CajeroLogger;
import ejemplo.cajero.modelo.Banco;

public class ComadoReporteOperaciones implements Comando {
	@Override
	public String getNombre() {
		return "Guardar reporte de operaciones";
	}

	@Override
	public void ejecutar(Banco contexto) throws Exception {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		Date date = new Date();
	    FileWriter fileWriter = new FileWriter("./data/reporte-" + dateFormat.format(date) + ".txt");
	    PrintWriter printWriter = new PrintWriter(fileWriter);
    		for(String operacion: CajeroLogger.getInstance().darOperaciones()) {
    			printWriter.println(operacion);
    		}
		printWriter.close();
	}
}
