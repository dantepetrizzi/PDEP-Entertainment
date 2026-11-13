import asistente.*

object productora {
    const property asistentes = #{}
    const bandas = #{}
    var property impuestoFijado = 0

    method registrarBanda(banda) {
        bandas.add(banda)
    }

    method recaudacionTotal() = asistentes.sum({ asistente => asistente.gastoEnEntradas() })

    method presupuestoTotalBandas() = bandas.sum({ banda => banda.presupuesto() })

    method gananciaTotal() = self.recaudacionTotal() - self.presupuestoTotalBandas()

    method cantidadEntradasVendidas() = asistentes.sum({ asistente => asistente.cantidadEntradas() })

    method cantidadDeEntradasVendidas(banda) = asistentes.sum({ asistente => asistente.cantidadEntradasDe(banda) })

    method bandaQueMasVendio() = bandas.max({ banda => self.cantidadDeEntradasVendidas(banda) })

    method bonificarVips() {
        asistentes.forEach({ asistente => asistente.abono().bonificar() })
    }
}