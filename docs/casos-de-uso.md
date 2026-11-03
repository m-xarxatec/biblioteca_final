# CasosUsoBiblioteca

## Resumen
- **Vincular:** https://padlet.com/janosoler/casosusobiblioteca-s024izj1o2p4xo94px9t
- **Autor:** janosoler
- **Publicaciones:** 23
- **Creación::** 15 de octubre de 2026 13:43
- **Actualización::** 21 de octubre de 2026 11:21

### 1. Prestar libro
**Autor:** janosoler

**Actor:** Bibliotecario

**Objetivo:** registrar que un socio se lleva un ejemplar

**Excepciones:** - Usuario no es socio
- Carnet de socio no válido 
- El socio tiene multas activas
- El socio ya ha alcanzado el límite de préstamos activos


#### Información adicional
- **Creación::** 15 de octubre de 2026 13:48
- **Actualización::** 15 de octubre de 2026 13:48

---

### 2. Devolucion libro
**Autor:** Daniel (danielsanchez157)

**Actor:** Bibliotecario

**Objetivo:** Gestionar la devolución de un. libro prestado.

**Excepciones:** - El libro no pertenece a nuestra biblioteca

#### Comentarios (1)
- **hectormoreno29** (19 de octubre de 2026 11:38): Con respecto a las excepciones “Usuario no es socio” (E1) y “Usuario no fue el solicitante del préstamo” (E2), entiendo que no son excepciones válidas.E1 - “Usuario no es socio”: si hay un préstamo activo, el socio existía cuando se prestó el libro, así que el sistema ya sabe quién es. Podría ocurrir que al momento de la devolución el socio haya sido dado de baja (revisar préstamos activos antes de dar de baja) o esté sancionado, pero aun así hay que recibir el libro.E2 - “Usuario no fue el solicitante del préstamo”: un familiar o amigo puede devolver el libro y se recibe igualmente. La devolución se identifica por el ejemplar, no por la persona que lo entrega. Si el libro está dañado, se recibe igual y la sanción correspondiente se aplica al socio titular del préstamo.Excepción que agregaría: "El código de barras o el identificador del ejemplar no es legible". En ese caso, se busca el ejemplar entre los préstamos activos (por socio, si está presente, o por título o autor o ISBN), se registra la devolución y se reetiqueta el ejemplar. Si además, si el libro presenta daños, se evalúa la sanción: monetaria, en días de suspensión o ambas.

#### Información adicional
- **Creación::** 18 de octubre de 2026 12:58
- **Actualización::** 21 de octubre de 2026 10:33

---

### 3. Modificar multa
**Autor:** Daniel (danielsanchez157)

**Actor:** Administrador/Bibliotecario

**Objetivo:** Modificar los datos correspondientes a una sanción.

**Excepciones:** - No hay justificación.
- No existe la sación.

#### Información adicional
- **Creación::** 18 de octubre de 2026 13:29
- **Actualización::** 21 de octubre de 2026 10:44

---

### 4. Suspension de Socio
**Autor:** Daniel (danielsanchez157)

**Actor:** Bibliotecario - Admin

**Objetivo:** Suspender el usuario.

**Excepciones:** - El socio ya se encuentra suspendido.
- El socio no existe.
- El usuario no tiene permisos.

#### Información adicional
- **Creación::** 18 de octubre de 2026 13:32
- **Actualización::** 21 de octubre de 2026 10:56

---

### 5. TO-DO: Registrar donaciones
**Autor:** Daniel (danielsanchez157)

**Actor:** Bibliotecario - Admin

**Objetivo:** Un socio o usuario no registrado de la biblioteca dona un ejemplar de un libro a la biblioteca

**Excepciones:** 
- Las condiciones del ejemplar no son aceptables

#### Información adicional
- **Creación::** 18 de octubre de 2026 13:34
- **Actualización::** 21 de octubre de 2026 11:10

---

### 6. Registrar Libro
**Autor:** Daniel (danielsanchez157)

**Actor:** Bibliotecario

**Objetivo:** Registrar un nuevo libro en la biblioteca

**Excepciones:** - El libro ya está registrado

#### Información adicional
- **Creación::** 18 de octubre de 2026 13:34
- **Actualización::** 18 de octubre de 2026 13:34

---

### 7. Alta usuario
**Autor:** Daniel (danielsanchez157)

**Actor:** Bibliotecario - Usuario no registrado

**Objetivo:** Registrar un usuario como socio de la biblioteca

**Excepciones:** - El usuario ya está registrado
- No cumple los requisitos

#### Información adicional
- **Creación::** 18 de octubre de 2026 18:22
- **Actualización::** 21 de octubre de 2026 10:48

---

### 8. Baja Usuario
**Autor:** Daniel (danielsanchez157)

**Actor:** Bibliotecario - Socio

**Objetivo:** Dar de baja un socio de la biblioteca

**Excepciones:** - Usuario no es socio.
- El socio tiene prestamos pendientes de devolver.

#### Información adicional
- **Creación::** 18 de octubre de 2026 18:44
- **Actualización::** 21 de octubre de 2026 10:52

---

### 9. Crear multa
**Autor:** Laia Lleixa (laialleixa)

**Actor:** Bibliotecario - Admin

**Objetivo:** Registrar una multa asociada a un socio.

**Excepciones:** - El socio no existe en la base de datos
- El motivo de la multa no es válido 
- Ya existe una multa por el mismo concepto y hecho(es un duplicado)
- El usuario no tiene permiso para registrar multas

#### Información adicional
- **Creación::** 19 de octubre de 2026 10:02
- **Actualización::** 21 de octubre de 2026 10:58

---

### 10. Buscar un libro
**Autor:** Laia Lleixa (laialleixa)

**Actor:** Bibliotecario - Socio - Admin - Usuario no registrado

**Objetivo:** Consultar la base de datos para localizar los libros mediante criterios como título, autor, editorial, categoría o ISBN

#### Comentarios (1)
- **michaeldiez** (19 de octubre de 2026 17:20): pensando mucho en buscar libro, crees que seria buena idea si el libro existe pero todos los ejemplares están prestados (mostrar cuándo vuelve y ofrecer reservarlo), eso seria una excepcion? o solo una funcion?

#### Información adicional
- **Creación::** 19 de octubre de 2026 10:07
- **Actualización::** 21 de octubre de 2026 11:13

---

### 11. Renovar prestamo
**Autor:** michaeldiez

**Actor:** Socio - Bibliotecario

**Objetivo:** Ampliar el plazo de un prestamo

**Excepciones:** - Otro socio ha reservado ese ejemplar y no hay mas ejemplares.
- Se alcanzó el número máximo de renovaciones del mismo ejemplar.
- El socio tiene multas activas o retraso en el prestamo.

#### Información adicional
- **Creación::** 19 de octubre de 2026 17:10
- **Actualización::** 21 de octubre de 2026 10:50

---

### 12. Consultar el listado de socios 
**Autor:** Laia Lleixa (laialleixa)

**Actor:** Bibliotecario - Admin

**Objetivo:** Obtener información de socios registrados.

**Excepciones:** - El usuario no tiene permisos para consultar el listado 

#### Información adicional
- **Creación::** 19 de octubre de 2026 10:23
- **Actualización::** 21 de octubre de 2026 10:54

---

### 13. TO-DO: Reservar sala de estudio
**Autor:** Adrián Díaz (adriandiaz24)

**Actor:** Usuario

**Objetivo:** reservar el uso de una sala de estudio para un día y franja horaria concretos

**Excepciones:** - No quedan salas disponibles para la fecha o franja horaria seleccionada. 
- El usuario tiene una multa activa 
- El socio está suspendido en el momento de hacer la reserva. 

#### Información adicional
- **Creación::** 19 de octubre de 2026 19:57
- **Actualización::** 21 de octubre de 2026 10:29

---

### 14. Registrar libro
**Autor:** Adrián Díaz (adriandiaz24)

**Actor:** Bibliotecario - Admin

**Objetivo:** Registrar un nuevo volumen en el catálogo

**Excepciones:** - El usuario no tiene permisos.

#### Información adicional
- **Creación::** 19 de octubre de 2026 20:02
- **Actualización::** 21 de octubre de 2026 11:01

---

### 15. Declarar pérdida de un libro
**Autor:** Rommel Romero (rommelromero)

**Actor:** Bibliotecario - Admin

**Objetivo:** Registrar la pérdida de un libro prestado

**Excepciones:** - No existe préstamo activo de ese libro
- El libro ya fue devuelto o declarado perdido
- El préstamo no lo tiene acutalmente el cosio que solita el registro de la pérdida

#### Información adicional
- **Creación::** 20 de octubre de 2026 11:27
- **Actualización::** 21 de octubre de 2026 11:19

---

### 16. Anular multa
**Autor:** Rommel Romero (rommelromero)

**Actor:** Bibliotecario

**Objetivo:** Cancelar una multa registrada por error o por causa justificada

**Excepciones:** - La multa no existe.
- La sanción ya ha vencido.
- El bibliotecario no tiene permiso para anular multas
- No se especifica el motivo de la anulación.

#### Información adicional
- **Creación::** 20 de octubre de 2026 11:32
- **Actualización::** 21 de octubre de 2026 10:46

---

### 17. Reactivar socio
**Autor:** Adrián Díaz (adriandiaz24)

**Actor:** Bibliotecario - Admin

**Objetivo:** Actualizar la validez del carnet.

**Excepciones:** - No se ha cumplido el castigo/multa asociado a la suspensión
- El usuario no tiene permisos

#### Información adicional
- **Creación::** 20 de octubre de 2026 11:58
- **Actualización::** 21 de octubre de 2026 10:55

---

### 18. Anular préstamo
**Autor:** Iralys_Espinal

**Actor:** Bibliotecario - Admin

**Objetivo:** Eliminar un préstamo.

**Excepciones:** - El préstamo no existe
- El usuario no tiene permisos

#### Información adicional
- **Creación::** 20 de octubre de 2026 23:47
- **Actualización::** 21 de octubre de 2026 11:05

---

### 19. Consultar préstamo
**Autor:** Iralys_Espinal

**Actor:** Socio - Bibliotecario - Admin

**Objetivo:** Consultar la información de un préstamo (o préstamos)

**Excepciones:** - El usuario no tiene permisos.

#### Información adicional
- **Creación::** 21 de octubre de 2026 00:05
- **Actualización::** 21 de octubre de 2026 11:03

---

### 20. Reservar un libro
**Autor:** Noe Glez (zalezigo21)

**Actor:** Socio

**Objetivo:** Solicitar la reserva de un libro que no está disponible

**Excepciones:** - El usuario no es socio.
- El socio esta suspendido.
- El libro no existe en el catalogo.

#### Información adicional
- **Creación::** 21 de octubre de 2026 10:25
- **Actualización::** 21 de octubre de 2026 11:06

---

### 21. Modificar los datos de un socio
**Autor:** Noe Glez (zalezigo21)

**Actor:** Socio - Bibliotecario - Admin

**Objetivo:** Actualizar los datos personales y de contacto de un socio.

**Excepciones:** - El socio no está registrado.
- los datos actualizados no son válidos
- el usuario no tiene permiso para modificar esa ficha o ciertos datos

#### Información adicional
- **Creación::** 21 de octubre de 2026 10:30
- **Actualización::** 21 de octubre de 2026 11:16

---

### 22. Gestionar una solicitud de adquisición
**Autor:** Cristina Lidón Martín Fabregat (cristinamartin31)

**Actor:** Bilbiotecario - Admin

**Objetivo:** Revisar la petición de un usuario y decidir si la biblioteca comprará o incorporará el libro solicitado.

**Excepciones:**     - La solicitud ya no existe o ya fue resuelta.
    -  Faltan datos para identificar el libro.
    -  La biblioteca ya tiene suficientes ejemplares.

#### Información adicional
- **Creación::** 21 de octubre de 2026 10:45
- **Actualización::** 21 de octubre de 2026 11:15

---

### 23. Borrar libro 
**Autor:** Anggee Serrada (anggeeserrada)

**Actor:** Bibliotecario - Admin

**Objetivo:** Eliminar libro del catálogo

**Excepciones:** - El libro no existe
- El libro esta prestado 


#### Información adicional
- **Creación::** 21 de octubre de 2026 11:19
- **Actualización::** 21 de octubre de 2026 11:21

---

### 24. Reportar libro dañado en devolución
**Autor:** Sistema

**Actor:** Bibliotecario

**Objetivo:** Registrar que un libro devuelto está dañado y generar automáticamente una sanción (días de suspensión) asociada al socio

**Excepciones:** - El préstamo no existe
- El libro ya fue reportado como dañado
- El nivel de daño no es válido

#### Información adicional
- **Creación::** 21 de octubre de 2026
- **Actualización::** 21 de octubre de 2026

---

### 25. Consultar historial de préstamos
**Autor:** Sistema

**Actor:** Socio - Bibliotecario - Admin

**Objetivo:** Consultar el historial completo de préstamos de un socio, incluyendo préstamos activos e histórico de devoluciones

**Excepciones:** - El socio no existe
- El usuario no tiene permisos para consultar ese historial

#### Información adicional
- **Creación::** 21 de octubre de 2026
- **Actualización::** 21 de octubre de 2026

---

### 26. Consultar multas y suspensiones activas
**Autor:** Sistema

**Actor:** Socio - Bibliotecario - Admin

**Objetivo:** Consultar las multas (días de suspensión) y suspensiones activas de un socio, incluyendo causa y fecha de vencimiento

**Excepciones:** - El socio no existe
- El usuario no tiene permisos

#### Información adicional
- **Creación::** 21 de octubre de 2026
- **Actualización::** 21 de octubre de 2026

---

### 27. Consultar reservas activas
**Autor:** Sistema

**Actor:** Socio - Bibliotecario - Admin

**Objetivo:** Consultar las reservas activas de un socio, incluyendo posición en la lista de espera y fecha estimada de disponibilidad

**Excepciones:** - El socio no existe
- El usuario no tiene permisos

#### Información adicional
- **Creación::** 21 de octubre de 2026
- **Actualización::** 21 de octubre de 2026

---

### 28. Cancelar reserva de libro
**Autor:** Sistema

**Actor:** Socio - Bibliotecario - Admin

**Objetivo:** Cancelar una reserva activa que el socio había realizado

**Excepciones:** - La reserva no existe
- La reserva ya fue asignada (el libro está disponible para recoger)
- El usuario no tiene permisos para cancelar esa reserva

#### Información adicional
- **Creación::** 21 de octubre de 2026
- **Actualización::** 21 de octubre de 2026

---

### 29. Asignar libro a siguiente socio en lista de espera
**Autor:** Sistema

**Actor:** Sistema (automático) - Bibliotecario

**Objetivo:** Cuando se devuelve un libro con reservas activas, asignar automáticamente al siguiente socio en la lista de espera y notificarle que puede recogerlo

**Excepciones:** - No hay reservas activas para el libro
- El siguiente socio en la lista está suspendido
- El ejemplar está dañado o no es disponible

#### Información adicional
- **Creación::** 21 de octubre de 2026
- **Actualización::** 21 de octubre de 2026
- **Nota:** Puede ser un proceso del sistema que se ejecuta automáticamente al devolver un libro.

---

### 30. Gestionar categorías de libros
**Autor:** Sistema

**Actor:** Bibliotecario - Admin

**Objetivo:** Crear, editar o eliminar categorías de libros en el catálogo (ej: Ficción, No Ficción, Infantil, Técnico, etc.)

**Excepciones:** - La categoría ya existe
- La categoría está asociada a libros (no se puede eliminar)
- El nombre de la categoría no es válido
- El usuario no tiene permisos

#### Información adicional
- **Creación::** 21 de octubre de 2026
- **Actualización::** 21 de octubre de 2026

---

### 31. Gestionar ubicaciones físicas
**Autor:** Sistema

**Actor:** Bibliotecario - Admin

**Objetivo:** Crear, editar o eliminar ubicaciones físicas de libros en la biblioteca (ej: Sala Principal, Referencia, Infantil, etc.)

**Excepciones:** - La ubicación ya existe
- La ubicación está asociada a ejemplares (no se puede eliminar)
- El nombre no es válido
- El usuario no tiene permisos

#### Información adicional
- **Creación::** 21 de octubre de 2026
- **Actualización::** 21 de octubre de 2026

---

### 32. Gestionar ubicación de ejemplar
**Autor:** Sistema

**Actor:** Bibliotecario - Admin

**Objetivo:** Asignar o cambiar la ubicación física de un ejemplar dentro de la biblioteca

**Excepciones:** - El ejemplar no existe
- La ubicación no existe
- El ejemplar está prestado (no se puede reubicar hasta que se devuelva)
- El usuario no tiene permisos

#### Información adicional
- **Creación::** 21 de octubre de 2026
- **Actualización::** 21 de octubre de 2026

---

### 33. Consultar registro de auditoría
**Autor:** Sistema

**Actor:** Admin

**Objetivo:** Consultar un registro de auditoría que muestre todas las operaciones realizadas en el sistema (quién, qué, cuándo, detalles de los cambios)

**Excepciones:** - El usuario no tiene permisos para consultar la auditoría

#### Información adicional
- **Creación::** 21 de octubre de 2026
- **Actualización::** 21 de octubre de 2026
- **Nota:** Esto es requisito para trazabilidad y seguridad. Filtros sugeridos: por usuario, tipo de operación, fecha, socio afectado, libro afectado

---
