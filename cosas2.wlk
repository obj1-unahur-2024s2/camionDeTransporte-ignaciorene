import cosas.*
object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bulto() = 1
    method reaccionar() {}
}

object bumblebee {
    method peso() = 800
    method peligrosidad() = modo.peso()
    var modo = auto
    method bulto() = 2

    method reaccionar() {
        modo = robot
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
    method bulto() = if(cantidad>100 and cantidad<=300){2}else if(cantidad>300){3}else{1}

    method reaccionar(){
        cantidad+=12
    }
}

object arenal{
    var property peso = 0
    method peligrosidad() = 1 
    method bulto() = 1

    method reaccionar() {
      peso = 0.max(peso - 10)
    }
}

object antiaereo {
    var property equipo = null
    method bulto() = if(equipo == misiles){misiles.bulto()}else{1}
    
    method peso() {
        return if(equipo == misiles){misiles.peso()}else{200}
    } 

    method peligrosidad() {
        return if(equipo == misiles){misiles.peligrosidad()}else{0}
    } 

    method reaccionar() {
      equipo=misiles
    }
}

object misiles {
    method peso() = 300
    method peligrosidad() = 100
    method bulto()=2
}

object contenedor {
    const property cosas = []
    method bulto() = 1 + cosas.sum({cosa => cosa.bulto()})
    method peso() = 100 + cosas.sum({cosa => cosa.peso()})
    method peligrosidad() = if(cosas.size()>0){cosas.max({cosa => cosa.peligrosidad()}).peligrosidad()}else{0}

    method agregarCosa(unaCosa) {
      cosas.add(unaCosa)
    }

    method reaccionar() {
      cosas.forEach({cosa => cosa.reaccionar()})
    }
}

object residuos {
    var property peso = 0
    method peligrosidad() = 200 
    method bulto() = 1

    method reaccionar() {
      peso += 15
    }
}

object embalaje {
    var property contenido = null
    method peso() = contenido.peso()
    method peligrosidad() = contenido.peligrosidad()/2
    method bulto() = 2
    method reaccionar() {}
}