class Entradas {
    var banda
    const property fecha

    method precioFinal() = 1000 + productora.impuestoFijado() 
}

class Asistente {
    var tipoAbono
    const entradas = []
    var dinero
    const hoy = new Date()
    

    method comprarEntrada(entrada){
        if(dinero > 0){
            dinero = dinero - entrada.precioFinal() +//abono
            entradas.add(entrada)
        } else{
            //notificar
        }
    }

    method entradasQueSacoElAnioAnterior() = entradas.filter({entrada => entrada.fecha().year() == ((hoy.year()-1))}) 

    method nombresE
}


object fan {
  const property descuento = 0
}

object vip {
  
}