#!/usr/bin/env bash
# tfg.sh: abre la terminal del TFG.
#
# Graba dos cosas en registro/ (que no se publica):
#   terminal-AAAA-MM-DD.log   todo lo que se ve en pantalla, también dentro de ssh
#   comandos-AAAA-MM-DD.log   una línea por orden: hora, código de salida, carpeta, orden
#
# Para salir y dejar de grabar: exit (o Ctrl+D).

set -euo pipefail

# Carpeta del repositorio: la de arriba de donde está este script, aunque lo llames
# a través de un enlace (readlink -f sigue el enlace hasta el fichero real).
REPO="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/.." && pwd)"

if [[ -n "${FALLOSOS_GRABANDO:-}" ]]; then
    echo "Ya estás en una terminal del TFG; no abro otra dentro."
    exit 0
fi

HOY="$(date +%F)"
mkdir -p "$REPO/registro"

export FALLOSOS_REPO="$REPO"
export FALLOSOS_CMDLOG="$REPO/registro/comandos-$HOY.log"
export FALLOSOS_GRABANDO=1

echo "== Terminal del TFG: grabando en registro/ · sal con exit =="
cd "$REPO"

# script (paquete util-linux) abre una terminal nueva y copia en el fichero todo lo que
# aparece en ella.
#   --quiet   sin mensajes de inicio y fin
#   --append  si ya grabaste hoy, añade al final en vez de sobrescribir
#   --flush   escribe en disco al momento, así no se pierde nada si se cierra mal
#   --command la orden que se ejecuta dentro: un bash interactivo con tfg-bashrc
exec script --quiet --append --flush \
    --command "bash --rcfile '$REPO/herramientas/tfg-bashrc' -i" \
    "$REPO/registro/terminal-$HOY.log"
