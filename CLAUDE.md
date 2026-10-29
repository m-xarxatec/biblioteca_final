# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Estado del proyecto

Aplicación de gestión de una biblioteca (socios, catálogo, préstamos, reservas, multas, auditoría). Por ahora el repositorio solo contiene documentación en `docs/`; aún no hay código, `package.json` ni `tsconfig.json`. Por eso todavía no hay comandos de build, lint ni tests. Hay que añadirlos aquí cuando existan.

La documentación está en español.

## Documentación de referencia

- `docs/tecnologias.md`: stack (HTML, CSS, TypeScript, JavaScript, PostgreSQL), arquitectura MVC y decisiones aún pendientes (runtime del servidor, acceso a BD, gestor de paquetes, herramientas de calidad, despliegue). Es la fuente de verdad sobre el stack.
- `docs/casos-de-uso.md`: 33 casos de uso con actor, objetivo y excepciones. Las excepciones son las reglas de negocio que tiene que validar el modelo. Algunos están marcados como `TO-DO` (5. Registrar donaciones, 13. Reservar sala de estudio). Varios incluyen comentarios del equipo que matizan las excepciones (p. ej. la devolución se identifica por el ejemplar, no por la persona que lo entrega).
- `docs/seed.sql`: esquema PostgreSQL (schema `public`). Tablas: `User`, `Item`, `Writer`, `Genre`, `Item_writer_rel`, `Item_genre_rel`, `Loan`, `Reservation`, `Sanction`, `Request`, `Audit_log`, `Location` (referenciada por `Item.ubication`). Los nombres de tabla llevan mayúsculas, así que hay que entrecomillarlos en SQL (`"public"."User"`).
- `docs/uix/`: mockups de las vistas (Landing, Resultados de búsqueda, Identificarse, Alta de volumen con título nuevo o ya catalogado).

## Reglas de negocio

- **Plazo de devolución**: 15 días naturales.
- **Multa por retraso**: 3 días sin poder hacer préstamos por cada día de retraso.
- **Préstamos simultáneos**: máximo 3 por socio.
- **Reservas activas**: máximo 2 por socio.
- **Sanción grave**: devolver un ejemplar en mal estado o perderlo.
  - 1.ª sanción grave: 30 días naturales sin poder hacer préstamos.
  - 2.ª sanción grave: baneo de 1 año.
  - 3.ª sanción grave: baneo de por vida.

## Arquitectura (MVC)

- **Modelo**: TypeScript. Es la única capa que accede a PostgreSQL y contiene las reglas de negocio que salen de las excepciones de los casos de uso.
- **Vista**: HTML + CSS basados en `docs/uix`. Sin lógica de negocio ni acceso a BD.
- **Controlador**: recibe la acción, comprueba permisos por rol (Usuario no registrado, Socio, Bibliotecario, Admin, según `User.role`), llama al modelo y elige la vista.
- La vista nunca llama al modelo directamente.
- **`public/`**: recursos estáticos que no pasan por el controlador. Contiene la carpeta `style/` (CSS), las páginas HTML que no son vistas de datos, imágenes, PDFs y otros archivos estáticos.
- Toda operación de escritura registra una entrada en `Audit_log`, con `old_data`/`new_data` en `jsonb`.
- El código se escribe en TypeScript estricto. El JavaScript es lo que genera el compilador y no se edita a mano.
