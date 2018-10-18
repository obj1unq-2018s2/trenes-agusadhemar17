class Locomotora {
	var property peso
	var property pesoMax
	var property velocidadMax
	
	
	method arrastreUtil() {
		return self.pesoMax() - self.peso()
	}
}