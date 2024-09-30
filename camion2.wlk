object camion {
    const property tara = 1000
    const property carga = [] 
    var property bultos = 0

    method pesoCarga() = carga.sum({cosa => cosa.peso()})

    method pesoTotal() = tara + self.pesoCarga()

    method cargar(unaCosa) {
        unaCosa.reaccionar()
        carga.add(unaCosa)
    }

    method descargar(unaCosa) {
      carga.remove(unaCosa)
    }

    method pesosImpares(){
        return carga.all({cosa => cosa.odd()})
    }

    method hayPesoIgual(unPeso){
        return carga.any({cosa => cosa.peso() == unPeso})
    }

    method primerPeligro(nivelPeligro){
        const cargasPeligrosas = carga.filter({cosa => cosa.peligrosidad() >= nivelPeligro})
        return cargasPeligrosas.first()
    }

    method cargasPeligrosas(nivelPeligro) {
        return carga.filter({cosa => cosa.peligrosidad() > nivelPeligro})
    }

    method listaCosasPeligrosas(unaCosa) {
        const cargasPeligrosas = carga.filter({cosa => cosa.peligrosidad() > unaCosa.peligrosidad()})
    }

    method pesoExcedido() =  self.pesoTotal() > 2500

    method circularEnRuta(nivelPeligro) {
        return not self.pesoExcedido() and self.cargasPeligrosas(nivelPeligro).size() == 0
    }

    method objetoEntre(min,max) {
        return carga.any({cosa => cosa.peso() > min and cosa.peso()<max})
    }

    method cosaMasPesada() = carga.max({cosa => cosa.peso()})
}