# hack19

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

La idea es hacer un servicio que permite organizar eventos relacionados con la comunidad Flutter. El servicio se va a presentar como una aplicacion hecha en Flutter.

## Screenshots

See the [screenshots](https://github.com/jporsay/hack19/tree/master/screenshots) directory.

## Specifications

La app consiste principalmente de dos partes:

1. Eventos

   - Pendintes
   - Confirmados

2. Usuarios
   - Anonimo
   - Autenticado

Un usuario autenticado puede crear eventos definiendo:

- Titulo
- Descripcion
- Tags
- Fecha y hora del evento
- Fecha y hora limite para complir los requerimientos
- Lista de requerimientos adicionales (ej: Lugar, comida, premios, presupuesto, etc).
- Cupo maximo de personas que pueden anotarse (conteplando posibles ausencias).

El evento se crea en estado pendiente y va a estr disponible SOLAMENTE a los usuarios autenticados. Los demas usuarios autenticados van a ver los eventos pendientes HASTA el momento de la fecha limite del evento. Llegada llegada la fecha limite, el usuario que creo el evento debe decidir si lo confirma o lo cancela.

> Si el evento se cancela: Se notifica a cada uno de los usuarios que se ofrecio para cumplir con alguno de los requerimientos
> Si el evento se confirma: Se notifica a cada uno de los usuarios que se ofrecio para cumplir con alguno de los requerimientos y adicionalmente, se hace publico el evento.
>
> > Opcional: Notificar a otros usuarios (autenticados) en caso de que su localizacion y gustos matcheen con los tags del evento.

Cuando un evento se hace publico, tanto los usuarios anonimos como los autenticados pueden ver el evento en su feed de eventos al abrir la aplicacion. Cualquier usuario puede anotarse siempre y cuando la cantidad de usuarios anotados NO supere el cupo maximo. Adicinalmente, para que un usuario se suscriba a un evento debe estar autenticado. En caso que el cupo para un evento fue alcanzado, un usuario puede aun asi anotarse pero queda en la lista de espera.

Un evento puede cancelarse solamente por el usuario que organiza el evento.

> > Opcional: Un usuario que se encuentra ofreciendo cierto servicio para el evento, debe poder cancelar el evento solamente si el organizador le habilito la capacidad de cancelacion.
