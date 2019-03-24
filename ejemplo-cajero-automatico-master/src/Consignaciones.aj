import java.util.List;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoConsignar;

public aspect Consignaciones {
	pointcut metodoCargaComandos(): call(* ejemplo.cajero.Cajero.cargaComandos(..));

	after() returning (List<Comando> o): metodoCargaComandos() {
		Comando comando = new ComandoConsignar();
		o.add(comando);
		System.out.println("Se añadió el comando de consignar");
	}
}