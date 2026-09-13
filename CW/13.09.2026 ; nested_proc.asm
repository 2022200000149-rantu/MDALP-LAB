.model small
.stack 100h
.data
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, 5
    
    call final
    mov bx, 7
    
    
    
    exit:
    mov ah, 4ch
    int 21h 
    
    
    
    main endp  

final proc 
    
    mov ax, 7 
    
    call result
    
    mov bx, 9
    
    ret
    final endp

result proc
    mov cx, 4
     
    ret 
    mov dx, 8
    result endp


ret
