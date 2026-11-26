# FallosOS

Laboratorio de averías de sistema operativo: levanta una máquina virtual,
le inyecta una avería, registra lo que hace quien intenta arreglarla y
comprueba de forma automática si el sistema ha quedado sano.

Trabajo Fin de Grado de Abel Hernández Carrasco · Grado en Ingeniería
Informática (UCAM) · curso 2026/27.
Tutores: Carlos Martínez Cortés y Horacio Pérez-Sánchez.

## Estado

Fase 1 de 5: catálogo de diez averías, provocadas y reparadas a mano. Cada avería
se aprende primero con ayuda y después se repite a solas, que es la línea base
([método](docs/averias/README.md)).

## Documentación

- [Decisiones](docs/decisiones/): cada elección del proyecto, con sus alternativas y su porqué.
- [Bitácora](docs/bitacora/): una entrada por sesión de trabajo.
- [Averías](docs/averias/): el método de trabajo y las fichas del catálogo.
- [Entorno](docs/entorno.md): qué es cada pieza del laboratorio y cómo funciona.
- [Imagen base](docs/imagen-base.md): cómo se construye la máquina virtual.
- [Uso de IA](docs/uso-ia.md): para qué he usado inteligencia artificial y cómo compruebo que entiendo lo que hace.

## Herramientas

- `herramientas/tfg.sh`: abre una terminal que graba la sesión y apunta cada orden
  con su hora, su código de salida y su carpeta.
- `herramientas/instalar-registro-vm.sh`, `traer-registro-vm.sh` y `revertir-vm.sh`:
  el mismo registro de órdenes dentro de la máquina virtual, y cómo sacarlo antes
  de volver a la instantánea limpia.

## Licencia

[MIT](LICENSE).
