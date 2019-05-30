class NaveEspacial {
	var property velocidad = 0
	var property direccion = 0
	var property combustible = 0	
	
	method velocidad(cuanto) { velocidad = cuanto }
	method acelerar(cuanto) { velocidad = (velocidad + cuanto).min(100000) }
	method desacelerar(cuanto) { velocidad = 0.min(velocidad -= cuanto) }
	
	method irHaciaElSol() { direccion = 10 }
	method escaparDelSol() { direccion = -10 }
	method ponerseParaleloAlSol() { direccion = 0 }
	
	method acercarseUnPocoAlSol() { direccion = 10.max(direccion + 1) }
	method alejarseUnPocoDelSol() { direccion = -10.min(direccion - 1) }
	
	method cargarCombustible(cuanto){ combustible += cuanto }
	method descargarCombustible(cuanto){ combustible -= cuanto }
	
	method prepararViaje() { 
		self.cargarCombustible(30000)
		self.acelerar(5000)
	}
	
	method estaTranquila() { return combustible >= 4000 and velocidad <= 12000 }
}

class NaveBaliza inherits NaveEspacial{
	var color
	
	method cambiarColorDeBaliza(colorNuevo){ color = colorNuevo }
	method colorDeBaliza() { return color }
	
	override method prepararViaje() { 
		super()
		self.cambiarColorDeBaliza("verde")
		self.ponerseParaleloAlSol()
	}
	
	method escapar() { self.irHaciaElSol() }
	method avisar() { self.cambiarColorDeBaliza("rojo") }
	method recibirAmenaza() { self.escapar(); self.avisar() }
	
	override method estaTranquila() { return super() and self.colorDeBaliza() != "rojo" }
}

class NavePasajeros inherits NaveEspacial{
 	var property pasajeros = 0
 	var property racionesBebida = 0
 	var property racionesComida = 0
 		
 	method cargarComida(cantidad) { racionesComida += cantidad }
 	method descargarComida(cantidad) { racionesComida -= cantidad }
 	
 	method cargarBebida(cantidad) { racionesBebida += cantidad }
 	method descargarBebida(cantidad) { racionesBebida -= cantidad }
 	
 	override method prepararViaje() { 
 		super()
 		self.cargarComida(4 * pasajeros)
 		self.cargarBebida(6 * pasajeros)
 		self.acercarseUnPocoAlSol()
 	}
 	
 	method escapar() { self.velocidad(velocidad * 2) }
	method avisar() { self.descargarComida(pasajeros); self.descargarBebida(2 * pasajeros) }
 	method recibirAmenaza() { self.escapar(); self.avisar() }
 	
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
 	
 	override method prepararViaje() {
 		super()
 		self.ponerVisible()
 		self.replegarMisiles()
 		self.acelerar(15000)
 		self.emitirMensaje("Saliendo en misión")
 	}
 	
 	method escapar() { self.acercarseUnPocoAlSol(); self.acercarseUnPocoAlSol() }
	method avisar() { self.emitirMensaje("Amenaza recibida") }
 	method recibirAmenaza() { self.escapar(); self.avisar() }
 	
 	override method estaTranquila() { return super() and not misilesDesplegados }
}

class NaveHospital inherits NavePasajeros{
	var quirofanosPreparados = false
	
	method prepararQuirofanos() { quirofanosPreparados = true }
	method cerrarQuirofanos() { quirofanosPreparados = false }
	method quirofanosListos() { return quirofanosPreparados }
	
	override method recibirAmenaza() { super(); self.prepararQuirofanos() }
	
	override method estaTranquila() { return super() and not self.quirofanosListos() }
}
 
class NaveCombateSigilosa inherits NaveCombate {
	
	override method recibirAmenaza() { super(); self.desplegarMisiles(); self.ponerInvisible() }
	
	override method estaTranquila() { return super() and not self.estaInvisible() }
}
 
 
 
 
 
 
 