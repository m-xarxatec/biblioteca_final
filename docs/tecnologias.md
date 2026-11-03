# Especificación técnica: tecnologías y arquitectura

Documento de referencia sobre las tecnologías del proyecto **App Activa Biblioteca** y la arquitectura que se va a seguir.

Documentos relacionados:
- [Casos de uso](./casos-de-uso.md)
- [Esquema de base de datos](./seed.sql)
- [Mockups de interfaz](./uix/)

---

## 1. Tecnologías

| Capa | Tecnología | Uso |
|---|---|---|
| Estructura de la interfaz | **HTML5** | Marcado de las vistas (landing, búsqueda, identificación, alta de volumen...) |
| Estilos | **CSS3** | Maquetación y diseño visual según los mockups de `docs/uix` |
| Lógica | **TypeScript** | Lenguaje principal de la aplicación (modelos, controladores, servicios) |
| Lógica | **JavaScript** | Código que se ejecuta en el navegador (salida compilada de TypeScript o scripts puntuales) |
| Base de datos | **PostgreSQL** | Persistencia de datos. El esquema inicial está en `seed.sql` |

### 1.1 TypeScript y JavaScript

- Todo el código nuevo se escribe en **TypeScript**, con tipado estricto (`strict: true` en `tsconfig.json`).
- El **JavaScript** es lo que genera el compilador (`tsc`) y lo que se ejecuta. No se edita a mano el JS compilado.
- Los tipos de las entidades (`User`, `Item`, `Loan`...) se definen una sola vez y se comparten entre capas.

### 1.2 PostgreSQL

- Esquema: `public`.
- El script `seed.sql` crea las tablas y las claves foráneas.
- Tipos destacados del esquema:
  - `timestamptz` para fechas de préstamos, solicitudes y auditoría.
  - `jsonb` en `Audit_log` (`old_data` / `new_data`) para guardar el estado anterior y posterior de cada cambio.

### 1.3 Pendiente de decidir

- [ ] Entorno de ejecución del servidor (p. ej. Node.js) y su versión.
- [ ] Librería de acceso a PostgreSQL (driver directo o ORM).
- [ ] Gestor de paquetes (npm / pnpm).
- [ ] Herramientas de calidad: linter, formateador y tests.
- [ ] Entorno de despliegue.

---

## 2. Arquitectura: patrón MVC

La aplicación sigue el patrón **Modelo, Vista, Controlador (MVC)**, que separa los datos, la presentación y la lógica que los conecta.

```
 Usuario
   │  (petición: buscar libro, prestar, devolver...)
   ▼
┌──────────────┐     consulta / modifica    ┌──────────────┐      SQL      ┌────────────┐
│ Controlador  │ ─────────────────────────▶ │    Modelo    │ ────────────▶ │ PostgreSQL │
│ (TypeScript) │ ◀───────────────────────── │ (TypeScript) │ ◀──────────── │            │
└──────────────┘          datos             └──────────────┘               └────────────┘
   │
   │  datos para mostrar
   ▼
┌──────────────┐
│    Vista     │  HTML + CSS (+ JS en el navegador)
└──────────────┘
   │
   ▼
 Usuario
```

### 2.1 Modelo

Representa los datos y las reglas de negocio. Es la única capa que habla con PostgreSQL.

- Un modelo por entidad principal del esquema: `User`, `Item`, `Writer`, `Genre`, `Loan`, `Reservation`, `Sanction`, `Request`, `AuditLog`.
- Contiene las validaciones de negocio que aparecen como excepciones en los casos de uso. Por ejemplo:
  - *Prestar libro*: el socio no tiene multas activas y no ha alcanzado el límite de préstamos.
  - *Baja de usuario*: el socio no tiene préstamos pendientes.
  - *Borrar libro*: el libro no está prestado.

### 2.2 Vista

Lo que ve el usuario. Se construye con **HTML y CSS** a partir de los mockups de `docs/uix`:

1. Landing
2. Resultados de búsqueda
3. Identificarse
4. Alta de volumen (título nuevo / título ya catalogado)

Las vistas **no contienen lógica de negocio** ni acceden a la base de datos. Solo muestran los datos que reciben del controlador y envían las acciones del usuario.

### 2.3 Controlador

Recibe las acciones del usuario, llama al modelo correspondiente y decide qué vista mostrar.

- Un controlador por área funcional, agrupando los casos de uso:

| Controlador | Casos de uso |
|---|---|
| `CatalogController` | Buscar libro, Registrar libro, Borrar libro, Gestionar categorías, Gestionar ubicaciones |
| `LoanController` | Prestar, Devolver, Renovar, Anular, Consultar préstamo, Historial, Declarar pérdida, Reportar libro dañado |
| `ReservationController` | Reservar libro, Cancelar reserva, Consultar reservas, Asignar a siguiente en lista de espera |
| `UserController` | Alta, Baja, Modificar datos, Suspender, Reactivar, Listado de socios |
| `SanctionController` | Crear, Modificar, Anular multa, Consultar multas y suspensiones |
| `RequestController` | Gestionar solicitudes de adquisición |
| `AuditController` | Consultar registro de auditoría |
| `AuthController` | Identificarse |

- Comprueba los **permisos por rol** (Usuario no registrado, Socio, Bibliotecario, Admin) antes de ejecutar cada acción.

### 2.4 Estructura de carpetas propuesta

```
app-activa-biblioteca/
├── docs/                  # Documentación (casos de uso, esquema, mockups)
├── src/
│   ├── models/            # Modelos: entidades y acceso a PostgreSQL
│   ├── views/             # Plantillas HTML
│   ├── controllers/       # Controladores por área funcional
│   ├── types/             # Tipos e interfaces compartidos
│   └── config/            # Conexión a BD y configuración
├── public/
│   ├── css/               # Hojas de estilo
│   ├── js/                # JavaScript compilado para el navegador
│   └── img/               # Imágenes y recursos estáticos
├── tsconfig.json
└── package.json
```

### 2.5 Reglas transversales

- **Auditoría**: toda operación que crea, modifica o elimina datos guarda un registro en `Audit_log` (quién, qué tabla, qué registro, datos antes y después, cuándo).
- **Roles**: el campo `User.role` determina qué acciones puede realizar cada usuario.
- **Separación de capas**: la Vista nunca llama al Modelo directamente; siempre pasa por el Controlador.

---
