import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import ejemplo.cajero.CajeroLogger;
import ejemplo.cajero.control.Comando;

public aspect RegistroOperaciones {
	pointcut metodoEjecutarComando(): call(* ejecutar(..));
	pointcut metodoCargaComandos(): call(* ejemplo.cajero.Cajero.cargaComandos(..));
	
	before(): metodoEjecutarComando() {
		Comando comando = (Comando) thisJoinPoint.getTarget();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		CajeroLogger.getInstance().logComando(comando.getNombre(), dateFormat.format(date));
		System.out.println(comando.getNombre());
	}
}