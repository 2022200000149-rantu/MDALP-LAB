.model small
.stack 100h

.data
    msg1 db 'Enter first number: $'
    msg2 db 0dh, 0ah, 'Enter second number: $'
    msg3 db 0dh, 0ah, 'Sum: $'
    
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

    ; --- Multi-digit Addition Setup ---
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

    mov cx, 0              ; CX will count total digits in the final sum
    mov bl, 0              ; BL holds the carry bit (starts at 0)

add_loop:
    ; Check if both numbers are fully processed AND carry is 0
    cmp len1, 0
    jne continue_add
    cmp len2, 0
    jne continue_add
    cmp bl, 0
    je print_result

continue_add:
    mov al, bl             ; Load carry into AL
    mov bl, 0              ; Clear carry for this step

    ; Add digit from num1 if available
    cmp len1, 0
    je add_num2
    add al, [si]
    dec si
    dec len1

add_num2:
    ; Add digit from num2 if available
    cmp len2, 0
    je handle_carry
    add al, [di]
    dec di
    dec len2

handle_carry:
    ; Perform ASCII adjustment / decimal correction manually
    mov ah, 0
    mov dl, 10
    div dl                 ; AL = Quotient (Carry), AH = Remainder (Digit)

    mov bl, al             ; Store new carry in BL
    mov al, ah             ; Store current digit in AL

    push ax                ; Push the result digit onto stack (LIFO reverses order)
    inc cx                 ; Track total digits pushed
    jmp add_loop

print_result:
    ; If the input was 0 + 0, ensure at least one digit prints
    cmp cx, 0
    jne pop_loop
    mov dl, '0'
    mov ah, 02h
    int 21h
    jmp exit

pop_loop:
    pop ax                 ; Pop digit from stack in correct left-to-right order
    add al, '0'            ; Convert numeric value back to ASCII
    mov dl, al
    mov ah, 02h            ; Print single character
    int 21h
    loop pop_loop

exit:
    mov ah, 4ch
    int 21h
main endp
end main
