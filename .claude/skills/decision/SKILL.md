---
name: decision
description: Abre un nuevo registro de decisión (ADR) numerado en docs/decisiones a partir de la plantilla, ayuda a Abel a pensar las opciones con preguntas, puede proponer un borrador y revisa el texto. La elección es de Abel.
argument-hint: "[título corto]"
disable-model-invocation: true
---

# Nueva decisión

Las decisiones son de Abel y se las pueden preguntar en la defensa: la elección y el porqué
tienen que ser suyos y entenderlos. Tu trabajo es preparar el fichero, hacer buenas preguntas,
proponer opciones y, si él lo pide, un borrador marcado «(borrador)» que luego él revisa y
reescribe con sus palabras hasta hacerlo suyo.

## 1. Preparar el fichero

- Mira los ficheros de `docs/decisiones/` y toma el siguiente número libre (cuatro cifras).
- Nombre: `docs/decisiones/NNNN-titulo-en-minusculas-con-guiones.md`, a partir de `$ARGUMENTS`
  (sin tildes ni eñes en el nombre del fichero; en el título sí).
- Copia `docs/decisiones/0000-plantilla.md`, rellena el número, el título, la fecha de hoy y
  `Estado: propuesta`. Deja el resto de secciones con el texto de ayuda de la plantilla.
- Añade la fila al índice `docs/decisiones/README.md` (número, título enlazado, fecha, estado).

## 2. Ayudar a pensar

Hazle a Abel estas preguntas en un solo mensaje:

1. ¿Qué problema hay que resolver y qué lo condiciona (plazos, equipo, lo que pide la propuesta)?
2. ¿Qué opciones has visto? ¿Qué te gusta y qué no de cada una?
3. ¿Cuál eliges y por qué, en una frase?
4. ¿Qué pierdes o qué riesgo asumes? ¿Qué te haría cambiar de idea?

Si echas en falta una opción razonable o un inconveniente importante, díselo aparte, marcado
como «Sugerencia de Claude», con una línea de pros y otra de contras. No la metas en el fichero:
decide él si la incluye.

## 3. Revisar su borrador

Cuando Abel diga que lo ha escrito, léelo y responde con una lista corta:

- ¿Pasa de media página? Entonces probablemente son dos decisiones.
- ¿Las consecuencias tienen algo malo? Una decisión sin inconvenientes no es creíble.
- ¿El porqué se sostiene si alguien pregunta «¿y por qué no la otra?».
- ¿Hay datos sin comprobar (versiones, cifras) que deberían tener su fuente?

Plantea las mejoras como preguntas o comentarios. Cambia su texto solo si te lo pide y
después de enseñarle qué cambias y por qué. Cuando la dé por buena, recuérdale cambiar el estado a `aceptada` en el
fichero y en el índice.
