class NaveEspacial {
	var velocidad = 0
	var direccion = 0
	var combustible = 0	
	
	method velocidad(cuanto) { velocidad = cuanto }
	method acelerar(cuanto) { velocidad = (velocidad + cuanto).min(100000) }
	method desacelerar(cuanto) { velocidad = 0.min(velocidad -= cuanto) }
	
	method irHaciaElSol() { direccion = 10 }
	method escaparDelSol() { direccion = -10 }
	method ponerseParaleloAlSol() { direccion = 0 }
	
	method acercarseUnPocoAlSol() { direccion = 10.min(direccion += 1) }
	method alejarseUnPocoDelSol() { direccion = -10.max(direccion -= 1) }
	
	method cargarCombustible(cuanto){ combustible += cuanto }
	method descargarCombustible(cuanto){ combustible -= cuanto }
	
	method preparar
}

class NaveBaliza inherits NaveEspacial{
	var color
	
	method cambiarColorDeBaliza(colorNuevo){ color = colorNuevo }
	
	method prepararViaje() { 
		color = "verde"
		self.ponerseParaleloAlSol()
	}

}

class NavePasajeros inherits NaveEspacial{
 	var property pasajeros = 0
 	var racionesBebida = 0
 	var racionesComida = 0
 		
 	method cargarComida(cantidad) { racionesComida += cantidad }
 	method descargarComida(cantidad) { racionesComida -= cantidad }
 	
 	method cargarBebida(cantidad) { racionesBebida += cantidad }
 	method descargarBebida(cantidad) { racionesBebida -= cantidad }
 	
 	method prepararViaje() { 
 		self.cargarComida(4 * pasajeros)
 		self.cargarBebida(6 * pasajeros)
 		self.acercarseUnPocoAlSol()
 		
 	}
 	
 }
 
class NaveCombate inherits NaveEspacial{
 	var estaInvisible = false
 	var misilesDesplegados = false
 	var mensajesEmitidos = [ ]
 	
 	
 	method ponerVisible() { estaInvisible = false }
 	method ponerInvisible() { estaInvisible = true }
 	method estaInvisible() { return estaInvisible }
 	
 	method desplegarMisiles() { misilesDesplegados = true }
 	method replegarMisiles() { misilesDesplegados = false }
 	method misilesDesplegados() { return misilesDesplegados }
 	
 	method emitirMensaje(mensaje) { mensajesEmitidos.add(mensaje) }
 	method mensajesEmitidos() { return mensajesEmitidos }
 	method primerMensajeEmitido() { return mensajesEmitidos.head() }
 	method ultimoMensajeEmitido() { return mensajesEmitidos.last() }
 	method emitioMensaje() { return mensajesEmitidos.size() > 0 }
 	method esEscueta() { return not mensajesEmitidos.any({mensaje => mensaje.size() > 30 }) }
 	
 	method prepararViaje() {
 		self.ponerVisible()
 		self.replegarMisiles()
 		self.acelerar(15000)
 		self.emitirMensaje("Saliendo en misión")
 	}
 	
}
 
 
 
 
 
 
 
 
 