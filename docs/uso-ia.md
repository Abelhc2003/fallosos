# Uso de inteligencia artificial (IA)

Este fichero declara para qué he usado IA en el TFG, cómo compruebo que entiendo lo que
hace y qué parte es mía. Lo resumo después en la memoria. Las razones de estas reglas
irán en la decisión 0009 (pendiente de escribir).

## Herramientas

| Herramienta | Para qué la uso |
| --- | --- |
| Claude (chat en claude.ai) | Entender conceptos, preparar guías de trabajo, revisar ideas y planificar |
| Claude Code (en el portátil y el PC) | Asistente en el repositorio: explicar órdenes y conceptos, enseñarme las averías, redactar y editar ficheros con mi aprobación, preparar la bitácora a partir del registro. Sus instrucciones están en [`.claude/skills/`](../.claude/skills/) |

## Cómo uso la IA

Los tutores permiten usar IA para estudiar, redactar y programar, siempre que yo entienda
lo que entrego. Uso IA en todo el trabajo, y lo que hago para asegurarme de entenderlo es:

- **Aprendo cada avería con IA.** Me explica el concepto, me guía para provocarla,
  diagnosticarla y arreglarla, y me ayuda con la ficha. Antes de darme una respuesta me
  pregunta qué haría yo, y al final me hace preguntas para comprobar que lo he entendido.
- **Prueba de dominio.** Cuando creo que domino una avería, la repito yo solo desde la
  instantánea limpia, con la terminal grabando y sin ayuda. Esa repetición es la línea
  base (tiempo y número de órdenes). Cada ficha indica cómo la aprendí y cómo fue la prueba.
- **Documentos y decisiones.** La IA puede proponer opciones y borradores. La elección y el
  texto final son míos: los reviso, los reescribo con mis palabras y puedo defenderlos.
- **Control de versiones.** De momento los commits y los push los hago yo a mano.
- **Cada sesión se declara** en la tabla de abajo.
- **La IA no participa como asistente en la campaña.** Los agentes que se evalúan se
  ejecutan en un entorno limpio, sin mi configuración y sin acceso a las fichas.

## Registro

Una fila por sesión en la que haya usado IA. Lo más reciente, arriba.

| Fecha | Herramienta | Para qué | Qué hice yo | Ficheros afectados |
| --- | --- | --- | --- | --- |
| 2026-11-26 | Claude (chat) | Revisar las reglas de uso de IA tras aclarar que se permite usarla en todo si entiendo lo que entrego; adaptar esta declaración, la plantilla de ficha y el método de las averías; preparar las skills para publicarlas | Decidí el cambio (IA en todo, con preguntas de comprobación y prueba de dominio a solas) y publicar las skills; revisé los ficheros y los subí | `docs/uso-ia.md`, `docs/averias/`, `README.md`, `.gitignore`, `.claude/skills/` |
| 2026-11-25 | Claude (chat) | Propuesta de estructura del repositorio, plantillas, scripts de `herramientas/` y configuración de Claude Code | Revisé cada fichero, lo probé y decidí qué adoptar y qué cambiar | Commit inicial de estructura |
| 2026-11-24 | Claude (chat) | Guía personal de arranque: repositorio, máquina virtual y método de las averías, con la avería 01 como ejemplo guiado | Seguí la guía en mi portátil y resolví los problemas que surgieron | — |
