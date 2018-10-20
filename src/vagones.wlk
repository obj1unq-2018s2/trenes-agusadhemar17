class Vagon {

	var property ancho = 0
	var property largo = 0
	var property maximaCarga = 0

	method esLiviano() {
		return self.pesoMax() > 2500
	}

	method llevaCarga() {
		return false
	}

	method pesoMax() {
		return 0
	}

}

class VagonDeCarga inherits Vagon {

	override method llevaCarga() {
		return true
	}

	override method pesoMax() {
		return maximaCarga + 160
	}

}

class VagonDePasajeros inherits Vagon {
	var  cantBanios 
	
	method cantidadPasajeros() {
		return if (ancho <= 2.5) {
			largo * 8
		} else {
			largo * 10
		}
	}

	override method pesoMax() {
		return self.cantidadPasajeros() * 80
	}
	
	method cantBaniosSuficientes(){
		return cantBanios == (self.cantidadPasajeros()/50).roundUp()
		
	}

}

