import ejemplo.cajero.modelo.Cuenta;

public aspect SaldoReducido {
	pointcut metodoRetirar(): call(* ejemplo.cajero.modelo.Cuenta.retirar(..));
	
	before() throws Exception: metodoRetirar() {
		Object[] args = thisJoinPoint.getArgs();
		long valor = (Long) args[0];
		Cuenta cuenta = (Cuenta) thisJoinPoint.getTarget();
		if (cuenta.getSaldo() - valor < 200) {
			throw new Exception("No se puede hacer el retiro porque la cuenta quedaría con menos de $200");
		}
	}
}