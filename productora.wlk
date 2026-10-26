import asistente.*
object productora{//hay una sola
    const property asistentes = #{}
    const bandas = #{}
    var property impuestoFijado = 0

    method registrarBanda(banda) { bandas.add(banda) }
    method gananciaTotal() = asistentes.map({asistente => asistente.entradas().map({entrada => entrada.precioFinal()}).sum()}).sum() - bandas.sum({banda => banda.presupuesto()})

    method cantidadEntradasVendidas() = asistentes.map({asistente => asistente.entradas()}).flatten().size()

    method cantidadDeEntradasVendidas(banda) = asistentes.sum({asistente => asistente.entradas().count({ entrada => entrada.banda() == banda })})
    method bandaQueMasVendio() = bandas.max({ banda => self.cantidadDeEntradasVendidas(banda) })

    method bonificarVips(){
        asistentes.forEach({ asistente => asistente.abono().bonificar() })
    }
}