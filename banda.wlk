import productora.*
class Banda{
    const nombre
    
    method canon() = 1000000
    method presupuesto() = self.canon() + self.gastoExtra()
    method gastoExtra() = 0
    method popularidad()
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