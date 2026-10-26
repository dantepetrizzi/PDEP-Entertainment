import productora.*

class Entrada {
    const property banda
    const property fecha

    method precioFinal(asistente) = 1000 + productora.impuestoFijado() 
}
