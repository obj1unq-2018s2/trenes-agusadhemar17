class Vagon{
	var ancho = 0
	var largo = 0 
	var carga = false
	var maximaCarga = 0
	
	method largo(){
		return largo
	}
	method ancho(){
		return ancho
	}
	method cantidadPasajeros(){
		return if (ancho <= 2.5){
					largo * 8
		}else{ largo*10}		
	}
	
	method llevaCarga(){
		return carga
	}
	method cargaMax(){
		return maximaCarga
	}
	
	method pesoMax (){
		return if (self.llevaCarga()){
					self.cantidadPasajeros() * 80
				}else{
					maximaCarga + 160
				}
	}
	
}
	