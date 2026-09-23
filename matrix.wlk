object neo {
    var energia = 100

    method esElElegido() = true
    method saltar(){
        energia = energia /2    
    } 
    method vitalidad()= energia /10
}

object morfeo {
    var vitalidad = 8
    var estaCansado = false

    method esElElegido() = false
    method saltar() {
        estaCansado = not estaCansado
        vitalidad = (vitalidad - 1).max(0)
    } 

    method vitalidad() = vitalidad
}

object trinity {
    method vitalidad() = 0
    method esElElegido() = false
    method saltar(){}   
    /*
    method bajarNave(){
        nave.pasajeros().remove(self)
        //Puedo cambiar efectos individuales a los objetos al realizar la accion ej:
        vitalidad = (vitalidad +2)
    }
    */
}

object nave {
    const pasajeros = []
    
    method subirPasajeros(unPasajero){
        pasajeros.add(unPasajero)
    }
    method bajarPasajeros(unPasajero){
        pasajeros.remove(unPasajero)
    }

    method cantidadPasajeros() {
        return pasajeros.size()
    }

    method elPasajeroConMayorVitalidad() {
                             /*unpasajero podria ser solo p*/
        return pasajeros.max({unPasajero  => unPasajero.vitalidad() }) //el dato que quiero que busque al maximo
    }

    method laMayorVitalidad() {
        return pasajeros.max({unPasajero => unPasajero.vitalidad()}).vitalidad()
    }

    method estaEquilibrada(){
        return self.elPasajeroConMayorVitalidad() <= min*2 //crear el metodo pasajero con min vitalidad
    }

    method estaElElegido(){
        return pasajeros.any({p => p.esElElegido()})
    }

    method chocar(){      /*pueden haber parametros entre los parentesis*/
        pasajeros.forEach({p => p.saltar()})     /* aca iria dicho parametro () */
        pasajeros.clear()
    }

    method acelerar(){   //saltan todos menos el elegido, primero realiza un filtro a quienes no son el elegido, y luego a cada uno le realiza la accion
        pasajeros.filter({p=> not p.esElElegido()}).forEach({p => p.saltar()})
    }
}