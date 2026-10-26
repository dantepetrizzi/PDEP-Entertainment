
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


object fan{ 
    method descuento() = 0
}

class Vip{ //vip es una clase porque tiene estado
    var descuento 
    method descuento() = descuento
}





