/** First Wollok example */
import locomotora.*
import vagones.*

class Formacion{
	var vagones = []
	var locomotoras = []
	//var property esDeCorta = true
	
	
	method cantVagonesLivianos(){
		return vagones.count({vagon => vagon.esLiviano()})
	}
	
	method velocidadMax(){
		return (locomotoras.min({locomotora=>locomotora.velocidadMax()})).velocidadMax()
	} 
	
	method esEficiente(){
		return locomotoras.all({locomotora=>locomotora.arrastreUtil()>= locomotora.peso()*5})
	}
	method puedeMoverse(){
		return self.arrastreUtilTotal() >= self.pesoTotalVagones()
	}	
	method pesoTotalLocomotoras(){
		return locomotoras.sum ({locomotora=> locomotora.peso()})
	}
	method pesoTotalVagones(){
		return vagones.sum ({vagon=> vagon.pesoMax()})
	}
	method arrastreUtilTotal(){
		return locomotoras.sum ({locomotora=> locomotora.arrastreUtil()})
	}
	
	method cuantosKilosDeEmpujeFaltan(){
		return if(self.puedeMoverse()){
					0
				}else {
					self.pesoTotalVagones()-self.arrastreUtilTotal()
				}
	}
	
	method vagonMasPesado(){
		return vagones.max({vagon=> vagon.pesoMax()})
	}
	method esCompleja(){
		return (vagones.size()+locomotoras.size()) >20 or  (self.pesoTotalLocomotoras()+self.pesoTotalVagones()) > 10000
	}//buscarLocomotora(tren)
	
	method tieneMuchosBanios(){//IMPLEMENTAR
		return vagones.size()>0 
	}
 	method estaBienArmada() {
			return self.puedeMoverse() 
	}
	/*method cantVagonesLivianos(){
		return vagones.count({vagon=> vagon.peso()>2500})
	} */
}
	
class FormacionDeLargaDistancia inherits Formacion {
	override method estaBienArmada() {
		return super() and self.tieneMuchosBanios()
	}	
}
	
class FormacionDeCortaDistancia inherits Formacion {
		override method estaBienArmada() {
			return super() and !self.esCompleja()
	}
}	
