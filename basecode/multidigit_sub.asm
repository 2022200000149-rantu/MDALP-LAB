.model small
.stack 100h

.data
    msg1 db 'Enter first number (larger): $'
    msg2 db 0dh, 0ah, 'Enter second number (smaller): $'
    msg3 db 0dh, 0ah, 'Difference: $'
    
    num1 db 10 dup(0)      ; Buffer to store digits of first number
    num2 db 10 dup(0)      ; Buffer to store digits of second number
    len1 dw 0              ; Length of first number
    len2 dw 0              ; Length of second number

.code
main proc
    mov ax, @data
    mov ds, ax

    ; --- Read First Number ---
    lea dx, msg1
    mov ah, 09h
    int 21h

    lea si, num1
read_num1:
    mov ah, 01h            ; Read single character from user
    int 21h
    cmp al, 0dh            ; Check if Enter key (Carriage Return) was pressed
    je end_read1
    sub al, '0'            ; Convert ASCII character to numeric value
    mov [si], al
    inc si
    inc len1
    jmp read_num1
end_read1:

    ; --- Read Second Number ---
    lea dx, msg2
    mov ah, 09h
    int 21h

    lea di, num2
read_num2:
    mov ah, 01h            ; Read single character from user
    int 21h
    cmp al, 0dh            ; Check if Enter key was pressed
    je end_read2
    sub al, '0'            ; Convert ASCII character to numeric value
    mov [di], al
    inc di
    inc len2
    jmp read_num2
end_read2:

    ; --- Multi-digit Subtraction Setup ---
    lea dx, msg3
    mov ah, 09h
    int 21h

    ; Position pointers at the last digit of each number
    lea si, num1
    add si, len1
    dec si

    lea di, num2
    add di, len2
    dec di

    mov cx, 0              ; CX will count total digits in the result stack
    mov bl, 0              ; BL holds the borrow bit (0 or 1)

sub_loop:
    ; Stop when all digits of the first (larger) number are processed
    cmp len1, 0
    je prepare_print

    mov al, [si]           ; Get digit from num1
    dec si
    dec len1

    sub al, bl             ; Subtract previous borrow (if any)
    mov bl, 0              ; Clear borrow flag

    ; Subtract digit from num2 if available
    cmp len2, 0
    je check_borrow
    sub al, [di]
    dec di
    dec len2

check_borrow:
    ; If AL < 0 (sign bit set / underflow occurred), handle borrow
    cmp al, 0
    jge store_digit
    add al, 10             ; Borrow 10 from next higher position
    mov bl, 1              ; Mark borrow for next iteration

store_digit:
    push ax                ; Push calculated digit onto stack
    inc cx                 ; Track digits count
    jmp sub_loop

prepare_print:
    ; --- Strip Leading Zeros ---
    mov bh, 0              ; BH = 1 when first non-zero digit is found

pop_leading_zeros:
    cmp cx, 1              ; Keep at least 1 digit (in case result is 0)
    je print_remaining
    pop ax
    dec cx
    cmp al, 0
    jne found_nonzero
    jmp pop_leading_zeros

found_nonzero:
    push ax                ; Put back non-zero digit
    inc cx

print_remaining:
    pop ax                 ; Pop digits in correct left-to-right order
    add al, '0'            ; Convert back to ASCII character
    mov dl, al
    mov ah, 02h            ; Print character interrupt
    int 21h
    loop print_remaining

exit:
    mov ah, 4ch
    int 21h
main endp
end main
