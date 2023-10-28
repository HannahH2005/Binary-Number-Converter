section .data
    msg db 'Binary: ',0

section .bss
    binary resb 32

section .text
    global _start

_start:
    ; Initialize a decimal number
    mov eax, 10  ; Example: Convert the number 10 to binary

    ; Initialize counter
    mov ecx, 0

convert_to_binary:
    ; If eax becomes 0, stop the loop
    test eax, eax
    jz done_conversion

    ; Extract the least significant bit and store it in the binary string
    mov edx, 0
    mov ebx, 2
    div ebx
    add dl, '0'
    mov [binary + ecx], dl

    ; Increment counter
    inc ecx

    ; Continue the loop
    jmp convert_to_binary

done_conversion:
    ; Display message
    mov edx, 8
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Display the binary number (in reverse)
    mov edx, ecx
    mov ecx, binary
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Exit
    mov eax, 1
    int 0x80
