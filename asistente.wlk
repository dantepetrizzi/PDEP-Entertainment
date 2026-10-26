
import excepciones.*
class Asistente {
    const property entradas = []
    var dinero = 0 
    var property abono 
    

    method comprarEntrada(entrada){
        if(dinero > 0){
            dinero = dinero - entrada.precioFinal() 
            entradas.add(entrada)
        } else{
            throw new AsistenteComparaSinSaldo()
        }
    }

    method entradasQueSacoElAnioAnterior() = entradas.filter({entrada => entrada.fecha().year() == (new Date().year()-1)}) 

    method bandasVistas() = entradas.map({entrada => entrada.banda()}).asSet()
}


class Vip {
    var descuento

    method bonificar() {
        descuento = descuento * 1.01
    }
}

object fan {
    method descuento() = 0
    method bonificar() { }  
}




