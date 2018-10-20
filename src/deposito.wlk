import locomotora.*
import vagones.*
import trenes.*

class Deposito {

	var locomotoras = []
	var trenes = []

	method vagonesMasPesados() {
		return trenes.map({ tren => tren.vagonMasPesado() }).asSet()
	}

	method necesitoConductorExperimentado() {
		return trenes.any({ tren => tren.esCompleja() })
	}

	method hayLocomotora(tren) {
		return locomotoras.any({ locomotora => locomotora.arrastreUtil() >= tren.cuantosKilosDeEmpujeFaltan() })
	}

	method traerLocomotora(tren) {
		return locomotoras.find({ locomotora => locomotora.arrastreUtil() >= tren.cuantosKilosDeEmpujeFaltan() })
	}

	method agregarLocomotora(tren) {
		if (!tren.puedeMoverse() and self.hayLocomotora(tren)) {
			tren.traerLocomotora(tren)
			locomotoras.remove(self.traerLocomotora(tren))
		}
	}

}

/*

 *  
 * Agregar, dentro de un depósito, una locomotora a una formación determinada, 
 * de forma tal que la formación pueda moverse. Si la formación ya puede moverse, 
 * entonces no se hace nada. 
 * 
 * Si no, se le agrega una locomotora suelta del depósito cuyo arrastre útil sea mayor o 
 * igual a los kilos de empuje que le faltan a la formación. 
 * Si no hay ninguna locomotora suelta que cumpla esta condición, no se hace nada. */
