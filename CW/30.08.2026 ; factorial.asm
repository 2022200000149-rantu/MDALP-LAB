.model small
.stack 100h
.data

n dw 7
str db "Output Factorial: $"
buffer db 6 dup(?)
 
.code 

main proc
    
    mov ax, @data
    mov ds, ax
    
    lea dx, str
    mov ah, 9h
    int 21h
    
    
    mov ax, n        ; ax = 7
    mov cx, n        ; cx = 7
    dec cx           ; cx = 6
    
    fact_count:      ;factorial count loop
    dec n 
    mul n
    dec cx 
    cmp cx , 0
    jne fact_count             ; jump if not equal to zero
    
    
    mov cx, 0                  ;digit counter
    lea si, buffer+5
    
    digit_store:               ; multdigit store to buffer 
    xor dx, dx                 ; memory clear, dx = reminder
    mov bx, 10 
    div bx
    add dl, '0'
    dec si
    mov [si], dl
    inc cx
    cmp ax, 0
    jne digit_store
    
    print_fact:  ; multidigit
    mov dl, [si]  
    mov ah, 2h
    int 21h
    inc si
    loop print_fact
    
    
    exit:
    mov ah, 4ch
    int 21h
    
    main endp
end main
    
    
