# registro-ordenes.sh: apunta cada orden que escribes en una terminal bash interactiva.
#
# No se ejecuta: se carga con `source` desde un bash interactivo (lo hacen tfg-bashrc en
# el portátil y ~/.bashrc en la máquina virtual). Escribe en el fichero que diga la
# variable FALLOSOS_CMDLOG una línea por orden, con cuatro campos separados por
# tabulador:
#
#   fecha y hora    código de salida    carpeta    orden
#
# La hora es la del final de la orden, y la carpeta, aquella en la que la escribiste.
#
# Cómo funciona: bash ejecuta PROMPT_COMMAND justo antes de enseñar cada prompt, es
# decir, justo después de que termine la orden anterior. En ese momento $? todavía
# guarda el código de salida de esa orden, y `history 1` devuelve su texto.
#
# Las órdenes que empiezan por un espacio no se apuntan (útil si alguna lleva un dato
# que no quieres guardar). La grabación de pantalla de tfg.sh sí las verá.

if [[ -z "${FALLOSOS_CMDLOG:-}" ]]; then
    echo "registro-ordenes: falta la variable FALLOSOS_CMDLOG; no se registra nada" >&2
    return 0
fi
mkdir -p "$(dirname "$FALLOSOS_CMDLOG")"

# Sustituye el valor por defecto de Ubuntu y Debian (ignoreboth), que además se salta
# las órdenes repetidas seguidas: aquí queremos verlas todas.
HISTCONTROL=ignorespace

__fallosos_ultima=""      # número de historial de la última orden apuntada
__fallosos_iniciado=0     # el primer prompt solo toma nota del punto de partida
__fallosos_carpeta=$PWD   # carpeta en la que se escribió la orden (antes de un posible cd)

__fallosos_registrar() {
    local codigo=$?                     # tiene que ser lo primero, o se pierde
    local linea num orden
    linea=$(HISTTIMEFORMAT='' builtin history 1)
    if [[ $linea =~ ^\ *([0-9]+)\*?\ +(.*)$ ]]; then
        num=${BASH_REMATCH[1]}
        orden=${BASH_REMATCH[2]}
        # Solo si es una orden nueva: pulsar Enter en vacío no cambia el número.
        if (( __fallosos_iniciado )) && [[ $num != "$__fallosos_ultima" ]]; then
            orden=${orden//$'\n'/ ; }   # una orden de varias líneas, en una sola
            printf '%(%F %T)T\t%s\t%s\t%s\n' -1 "$codigo" \
                "${__fallosos_carpeta/#$HOME/\~}" "$orden" >> "$FALLOSOS_CMDLOG"
        fi
        __fallosos_ultima=$num
    fi
    __fallosos_iniciado=1
    __fallosos_carpeta=$PWD             # la siguiente orden se escribirá aquí
    return $codigo                      # deja $? como estaba, por si el prompt lo usa
}

# Se añade delante de lo que ya hubiera en PROMPT_COMMAND, sin borrarlo.
if [[ "$(declare -p PROMPT_COMMAND 2>/dev/null)" == "declare -a"* ]]; then
    PROMPT_COMMAND=(__fallosos_registrar "${PROMPT_COMMAND[@]}")
else
    PROMPT_COMMAND="__fallosos_registrar${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
fi
