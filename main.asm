section .data
    gato db 'gato', 10          ; La cadena a imprimir, con un salto de línea al final
    count db 10                 ; Número de veces a imprimir

section .text
    global _start               ; Declarar el punto de entrada (_start)

_start:                        ; Inicio del programa
    mov ecx, [count]           ; Cargar el contador en el registro ecx

print_loop:                   ; Etiqueta para el inicio del ciclo
    ; Escribir la cadena en la salida estándar
    mov rax, 1                 ; syscall: write (número 1)
    mov rdi, 1                 ; file descriptor: 1 (stdout)
    mov rsi, gato              ; dirección de la cadena a imprimir
    mov rdx, 5                 ; longitud de la cadena (4 caracteres + 1 salto de línea)
    syscall                    ; Llamada al sistema para ejecutar la syscall

    loop print_loop            ; Decrementar ecx y saltar a print_loop si ecx != 0

    ; Salir del programa
    mov rax, 60                ; syscall: exit (número 60)
    xor rdi, rdi               ; código de salida 0 (success)
    syscall                    ; Llamada al sistema para salir