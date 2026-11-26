---
name: explicar
description: Explica a fondo una orden, fichero, concepto o pieza del laboratorio (qué es, cómo funciona por dentro, qué papel tiene en FallosOS y cómo comprobarlo) y termina con preguntas para que Abel se examine. Úsala cuando Abel pregunte qué hace algo o pida que se lo expliques.
argument-hint: "[orden, fichero o concepto]"
---

# Explicar

Explica `$ARGUMENTS` (si viene vacío, lo último que se ha usado en la conversación) a alguien
que está terminando Ingeniería Informática: sabe programar y conoce lo básico de sistemas
operativos, pero quiere entender cada pieza de verdad.

## Estructura

1. **Qué es**, en dos frases.
2. **Cómo funciona por dentro**: qué parte del sistema interviene (núcleo, systemd, el shell,
   libvirt...), qué ficheros lee o escribe, qué llamadas o procesos hay detrás. Usa un ejemplo
   pequeño que se pueda ejecutar sin romper nada.
3. **Su papel en FallosOS**: para qué lo usamos y en qué objetivo (O1 a O5) aparece.
4. **Cómo comprobarlo tú mismo**: una orden de solo lectura y qué debería salir.
5. **Errores típicos**: lo que suele salir mal y cómo reconocerlo.
6. **Dónde leer más**: la página `man` concreta (con su sección, por ejemplo `man 5 systemd.unit`)
   o la documentación oficial. No inventes enlaces: si no estás seguro, di solo la página `man`.
7. **Tres preguntas** para que Abel se examine. No des las respuestas hasta que conteste.

Sé concreto y breve en cada punto. Si hay algo que no sabes seguro, dilo.

## Si se trata de una de las diez averías del catálogo

Aquí no hay límite de contenido: se aprende con ayuda completa, pero de forma que Abel acabe
sabiendo hacerlo solo. El método está en `docs/averias/README.md`.

- Empieza por el **concepto** de sistemas operativos (qué es un inodo, qué es un proceso
  zombi, cómo decide el OOM killer), con un ejemplo pequeño y seguro.
- Después guíale por la avería: cómo provocarla en la máquina virtual, qué síntomas hay,
  cómo diagnosticarla y arreglarla, y cómo comprobar que el sistema ha quedado sano.
- Antes de dar el diagnóstico o el arreglo, pregúntale qué miraría él y por qué. Que
  intente primero, aunque se equivoque.
- Al terminar, recuérdale que, cuando crea dominarla, la repita solo desde `base-limpia`
  con `tfg` grabando: esa prueba de dominio es su línea base (ver `CLAUDE.md`).
- Si ya está en plena prueba de dominio, no le ayudes hasta que termine; repásenla después.
