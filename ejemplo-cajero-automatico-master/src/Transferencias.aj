import java.util.List;

import ejemplo.cajero.control.Comando;
import ejemplo.cajero.control.ComandoTransferir;

public aspect Transferencias {
	pointcut metodoCargaComandos(): call(* ejemplo.cajero.Cajero.cargaComandos(..));

	after() returning (List<Comando> o): metodoCargaComandos() {
		Comando comando = new ComandoTransferir();
		o.add(comando);
		System.out.println("Se añadió el comando de transferir");
	}
}