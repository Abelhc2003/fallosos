---
name: documentar
description: Prepara el borrador de la bitácora del día a partir del registro de la terminal del TFG y de la máquina virtual, y actualiza docs/uso-ia.md y docs/entorno.md. Úsala cuando Abel diga «hecho», «documenta» o que termina la sesión.
argument-hint: "[AAAA-MM-DD]"
---

# Documentar la sesión

Objetivo: que lo comprobable de la sesión (órdenes, errores, versiones, horas) quede escrito
sin que Abel lo copie a mano, y que lo que solo sabe él (qué entendió, qué decidió, qué hizo
fuera de la terminal) lo escriba él. Tú preparas el borrador; él lo revisa y lo hace suyo.

## 1. Fecha y fuentes

- Fecha: `$ARGUMENTS` si viene; si no, la de hoy (`date +%F`).
- Lee, si existen:
  - `registro/comandos-FECHA.log`: una orden por línea (hora, código de salida, carpeta, orden).
  - `registro/vm-comandos-FECHA_copia-*.log`: lo mismo dentro de la máquina virtual.
    Ojo: si la avería trabajada cambia la hora de la máquina, esa hora puede ser falsa; manda la del portátil.
  - `registro/terminal-FECHA.log`: la pantalla grabada. Es grande y lleva códigos de color:
    no lo leas entero. Búscalo solo para ver la salida o el mensaje de error de una orden
    concreta, limpiando antes los códigos, por ejemplo:
    `sed 's/\x1b\[[0-9;?]*[a-zA-Z]//g' registro/terminal-FECHA.log | grep -n -A5 'texto'`
  - `docs/bitacora/FECHA.md`, por si ya hay una entrada de hoy: complétala, no la sustituyas.
- Si no hay registro de ese día, díselo a Abel y pregúntale si trabajó fuera de la terminal del TFG.

## 2. Pregunta antes de escribir

Haz a Abel estas preguntas, todas en un solo mensaje, y espera la respuesta. No supongas nada.

1. ¿Qué hiciste fuera de la terminal (virt-manager, navegador, conversación con los tutores)?
2. ¿Qué has aprendido hoy? Escríbelo con tus palabras, aunque sea en dos líneas.
3. ¿Has tomado alguna decisión? ¿Ya tiene su fichero en `docs/decisiones/`?
4. ¿Qué es lo primero que harás en la próxima sesión?
5. Si fue una avería: ¿la has estudiado con ayuda o has hecho la prueba de dominio a solas?
   ¿Qué te costó o no te quedó claro?
6. Si en el registro hay órdenes que no salen de esta conversación y no está claro para qué
   eran, pregúntalo aquí, una por una.

## 3. Escribe el borrador de la bitácora

En `docs/bitacora/FECHA.md`, con las secciones de `docs/bitacora/plantilla.md`.
La primera línea bajo el título es `> (borrador: revisar y quitar esta línea)`.

- **Horas**: desde la primera hasta la última orden del registro, descontando pausas de más de
  30 minutos. Escribe cómo lo calculaste para que Abel lo corrija.
- **Hecho**: hechos comprobables, en frases cortas, en primera persona.
- **Órdenes importantes**: tabla «Orden | Para qué». Deja fuera las triviales (`ls`, `cd`,
  `clear`, repeticiones). Explica cada una en una frase.
- **Aprendido**: copia lo que Abel respondió a la pregunta 2, sin reescribirlo más que para
  corregir erratas. Si no respondió, deja `- (pendiente: escribirlo Abel)`.
- **Problemas**: cada error con su mensaje exacto (de la pantalla grabada), la causa y la
  solución, o «sigue abierto».
- **Decisiones**: enlaces a los ficheros de decisión. No redactes decisiones aquí.
- **Uso de IA**: una línea con lo que hizo la IA hoy.
- **Siguiente paso**: lo que respondió Abel.

Si la sesión fue sobre una avería, en la bitácora pon que se trabajó la avería NN, cuánto
tiempo, qué entendió Abel y los tropiezos, con un enlace a su ficha. El procedimiento
completo (provocar, diagnosticar, arreglar) va en la ficha, no se duplica en la bitácora.
Propón a Abel actualizar la sección «Cómo la aprendí» de la ficha con lo de hoy, y si hizo
la prueba de dominio, la sección «Línea base» (tiempo y número de órdenes sacados del
registro, indicando cómo los calculaste). Los cambios en la ficha los apruebas con él antes.

## 4. Uso de IA

Añade una fila arriba de la tabla «Registro» de `docs/uso-ia.md`:
fecha · herramienta · para qué · qué hizo Abel · ficheros afectados. Sé concreto y honesto:
si redactaste un borrador, dilo.

## 5. Entorno

Si hoy se instaló o cambió algo del entorno (versiones, paquetes, recursos de la máquina,
instantáneas), actualiza `docs/entorno.md` o `docs/imagen-base.md` **solo con lo que tenga
una salida que lo demuestre** en el registro, y pon la orden con la que se comprueba.
Lo que no esté comprobado, déjalo fuera o como «Previsto (no decidido)».

## 6. Limpieza y cierre

- Antes de terminar, revisa lo que has escrito: ninguna contraseña, clave, token, dirección
  de correo, dirección IP pública ni ruta personal (`/home/...` pasa a `~`).
- Enseña a Abel la lista de ficheros cambiados con `git status` y `git diff --stat`.
- Propón un mensaje de commit en formato Conventional Commits, por ejemplo
  `docs: bitácora del FECHA`. No ejecutes `git add` ni `git commit`: los hace él.
- Recuérdale quitar la línea de borrador después de leerlo.
