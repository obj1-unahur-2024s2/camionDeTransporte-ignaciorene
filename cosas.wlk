object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
    method peso() = 800
    method peligrosidad() = modo.peso()
    var modo = auto

    method cambiarModo() {
      if(modo == auto){
        modo == robot
      }else{
        modo == auto
      }
    }
}

object auto {
    method peso() = 15
}

object robot {
  method peso() = 30
}

object ladrillos {
    var property cantidad = 0
    method peso() = cantidad * 2
    method peligrosidad() = 2
}

object arenal{
    var property peso = 0
    method peligrosidad() = 1 
}

object antiaereo {
    var property equipo = misiles
    
    method peso() {
        return if(equipo == misiles){misiles.peso()}else{200}
    } 

    method peligrosidad() {
        return if(equipo == misiles){misiles.peligrosidad()}else{0}
    } 
}

object misiles {
    method peso() = 300
    method peligrosidad() = 100
}

object contenedor {
    const property cosas = []
    method peso() = 100 + cosas.sum({cosa => cosa.peso()})
    method peligrosidad() = if(cosas.size()>0){cosas.max({cosa => cosa.peligrosidad()}).peligrosidad()}else{0}

    method agregarCosa(unaCosa) {
      cosas.add(unaCosa)
    }
}

object residuos {
    var property peso = 0
    method peligrosidad() = 200 
}

object embalaje {
    var property contenido = null
    method peso() = contenido.peso()
    method peligrosidad() = contenido.peligrosidad()/2
}