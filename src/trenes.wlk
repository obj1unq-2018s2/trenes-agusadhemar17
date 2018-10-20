/** First Wollok example */ import locomotora.*
import vagones.*

class Formacion {

	var vagones = []
	var locomotoras = []

	method cantVagonesLivianos() {
		return vagones.count({ vagon => vagon.esLiviano() })
	}

	method velocidadMax() {
		return (locomotoras.min({ locomotora => locomotora.velocidadMax() })).velocidadMax()
	}

	method esEficiente() {
		return locomotoras.all({ locomotora => locomotora.arrastreUtil() >= locomotora.peso() * 5 })
	}

	method puedeMoverse() {
		return self.arrastreUtilTotal() >= self.pesoTotalVagones()
	}

	method pesoTotalLocomotoras() {
		return locomotoras.sum({ locomotora => locomotora.peso() })
	}

	method pesoTotalVagones() {
		return vagones.sum({ vagon => vagon.pesoMax() })
	}

	method arrastreUtilTotal() {
		return locomotoras.sum({ locomotora => locomotora.arrastreUtil() })
	}

	method cuantosKilosDeEmpujeFaltan() {
		return if (self.puedeMoverse()) {
			0
		} else {
			self.pesoTotalVagones() - self.arrastreUtilTotal()
		}
	}

	method vagonMasPesado() {
		return vagones.max({ vagon => vagon.pesoMax() })
	}

	method esCompleja() {
		return (vagones.size() + locomotoras.size()) > 20 or (self.pesoTotalLocomotoras() + self.pesoTotalVagones()) > 10000
	}

	method estaBienArmada() {
		return self.puedeMoverse()
	}

	method agregarLocomotora(locomotora) {
		locomotoras.add(locomotora)
	}
}
class FormacionDeLargaDistancia inherits Formacion {

	var property uneDosCiudadesGrandes

	method tieneMuchosBanios() {
		return vagones.all({ vagon => vagon.cantBaniosSuficientes() })
	}

	override method estaBienArmada() {
		return super() and self.tieneMuchosBanios()
	}

	override method velocidadMax() {
		return if (uneDosCiudadesGrandes) {
			200
		} else {
			150
		}
	}

}


class FormacionDeCortaDistancia inherits Formacion {

	override method estaBienArmada() {
		return super() and !self.esCompleja()
	}
	override method velocidadMax() {
		return 60
	}
}

class FormacionDeAltaVelocidad inherits FormacionDeLargaDistancia {

	override method estaBienArmada() {
		return super() and self.velocidadMax() >= 250 and self.sonTodosVagonesLivianos()
	}
	method sonTodosVagonesLivianos(){
		return vagones.all({vagon=> vagon.esLiviano()})
	}
	override method velocidadMax() {
		return 400
	}
	
}




