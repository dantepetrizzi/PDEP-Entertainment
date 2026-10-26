import asistente.*
import productora.*

class Entradas {
    const property banda
    const property fecha

    method precioFinal() = 1000 + productora.impuestoFijado() - Asistente.abono().descuento()
}
