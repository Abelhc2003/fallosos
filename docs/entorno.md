# Entorno del laboratorio

Qué es cada pieza, cómo funciona y cómo se comprueba. Solo entra lo que he comprobado
con una orden; lo que aún no existe va al final, como «Previsto (no decidido)».

## Anfitrión: el portátil

| Dato | Valor | Comprobado con |
| --- | --- | --- |
| Sistema | Ubuntu … | `lsb_release -ds` |
| Núcleo | … | `uname -r` |
| Virtualización por hardware | … (vmx = Intel, svm = AMD) | `grep -Ec '(vmx\|svm)' /proc/cpuinfo` |
| Memoria | … | `free -h` |

## Virtualización

- **KVM** (Kernel-based Virtual Machine): …
- **QEMU**: …
- **libvirt** y `virsh`: …

| Componente | Versión | Comprobado con |
| --- | --- | --- |
| QEMU | … | `qemu-system-x86_64 --version` |
| libvirt | … | `virsh --version` |

## Máquina virtual `fallosos-base`

| Dato | Valor | Comprobado con |
| --- | --- | --- |
| Sistema | Debian 13.… | `cat /etc/debian_version` |
| Núcleo | … | `uname -r` |
| Recursos | 2 vCPU · 2 GB · 20 GB | `virsh dominfo fallosos-base` |
| nginx | … | `nginx -v` |

## Acceso

- SSH (Secure Shell) desde el portátil con el alias `fallosos`: …

## Instantáneas

- `base-limpia`: …

## Registro de sesiones

- Terminal del TFG en el portátil (`herramientas/tfg.sh`): …
- Registro de órdenes dentro de la máquina: …

## Previsto (no decidido)

- Arnés de O2: máquinas desechables creadas por programa, inyección, comprobación y puntuación.
- Cómo se aísla la máquina de los agentes evaluados (red, acceso al repositorio).
