/** First Wollok example */
import locomotora.*
import vagones.*

class Formacion{
	var vagones = []
	var locomotoras = []
	
	method cantVagonesLivianos(){
		return vagones.count({vagon => vagon.pesoMax()<2500})
	}
	
	method velocidadMax(){
		return locomotoras.min({locomotora=>locomotora.velocidadMaxima()})
	} 
	
	method esEficiente(){
		return locomotoras.all({locomotora=>locomotora.arrastreUtil()<= locomotora.peso()*5})
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
	}
	
	buscarLocomotora(tren)
}
	
	
