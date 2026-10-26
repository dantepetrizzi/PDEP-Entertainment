object productora{//hay una sola
    const property asistentes = #{}
    const bandas = #{}


    method impuestoFijado() = 0
    method gananciaTotal() = asistentes.map({asistente => asistente.entradas().map({entrada => entrada.precioFinal()}).sum()}).sum() - bandas.map({banda => banda.presupuesto()})

    method cantidadEntradasVendidas() = asistentes.map({asistente => asistente.entradas()}).flatten().size()

    method bandaQueMasVendio() = bandas.max({banda => banda.cantidadDeEntradasVendidas()})

}