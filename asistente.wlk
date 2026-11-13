import excepciones.*

class Asistente {
    const property entradas = []
    var property dinero = 0
    var property abono

    method montoAPagar(entrada) = entrada.precioFinal() * (100 - abono.descuento()) / 100

    method comprarEntrada(entrada) {
        if (dinero > 0) {
            dinero = dinero - self.montoAPagar(entrada)
            entradas.add(entrada)
        } else {
            throw new AsistenteComparaSinSaldo()
        }
    }

    method entradasQueSacoElAnioAnterior() = entradas.filter({ entrada => entrada.esDelAnioPasado() })

    method bandasVistas() = entradas.map({ entrada => entrada.banda().nombre() }).asSet()

    // precio de lista (sin descuento del abono): es lo que recauda la productora
    method gastoEnEntradas() = entradas.sum({ entrada => entrada.precioFinal() })

    method cantidadEntradas() = entradas.size()

    method cantidadEntradasDe(banda) = entradas.count({ entrada => entrada.banda() == banda })
}

// Vip y fan cumplen el mismo contrato (interfaz Abono): descuento() y bonificar()
class Vip {
    var descuento

    method descuento() = descuento

    method bonificar() {
        descuento = descuento * 1.01
    }
}

object fan {
    method descuento() = 0

    method bonificar() {}
}




