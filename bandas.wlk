import excepciones.*
class Entradas {
    const property banda
    const property fecha

    method precioFinal() = 1000 + productora.impuestoFijado() 
}

class Asistente {
    const property entradas = []
    var dinero = 0 
    var abono 
    

    method comprarEntrada(entrada){
        if(dinero > 0){
            dinero = dinero - entrada.precioFinal() + abono.descuento()
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


class Banda{
    const nombre
    
    method canon() = 1000000
    method presupuesto() = self.canon() + self.gastoExtra()
    method gastoExtra() = 0
    method popularidad()
    method cantidadDeEntradasVendidas() = productora.asistentes().entradas().filter({entrada => entrada.banda() == nombre}).flatten().size()
}

class Rock inherits Banda{
    var cantidadSolosDeGuitarra = 0

    override method gastoExtra() = 10000
    override method popularidad() = 100 * cantidadSolosDeGuitarra
}

class Trap inherits Banda{
    var tieneHielo 

     override method gastoExtra() = 0
     override method popularidad(){
        if(tieneHielo){
            return 1000
        } else {
            return 0
        }
     }
    
    override method canon() = super() * self.popularidad() 

}


class Indie inherits Banda{
    var cantidadInstrumentos 
    override method gastoExtra() = cantidadInstrumentos * 500
    override method popularidad() = 3.14 * nombre.size()

}


object productora{//hay una sola
    const property asistentes = #{}
    const bandas = #{}


    method impuestoFijado() = 0
    method gananciaTotal() = asistentes.map({asistente => asistente.entradas().map({entrada => entrada.precioFinal()}).sum()}).sum() - bandas.map({banda => banda.presupuesto()})

    method cantidadEntradasVendidas() = asistentes.map({asistente => asistente.entradas()}).flatten().size()

    method bandaQueMasVendio() = bandas.max({banda => banda.cantidadDeEntradasVendidas()})

}