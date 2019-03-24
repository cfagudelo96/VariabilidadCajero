import java.util.List;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComadoReporteOperaciones;;

public aspect ReporteOperaciones {
	pointcut metodoCargaComandos(): call(* ejemplo.cajero.Cajero.cargaComandos(..));

	after() returning (List<Comando> o): metodoCargaComandos() {
		Comando comando = new ComadoReporteOperaciones();
		o.add(comando);
		System.out.println("Se añadió el comando de reportar operaciones");
	}
}