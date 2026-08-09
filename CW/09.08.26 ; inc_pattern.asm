.model small             ;   1 DS + 1 CS
.stack 100h              ;   256 bytes
.data    

.code

main proc
    mov ax, @data
    mov ds, ax           ;   DS Activate  
    
    mov cx, 65  
    outer_loop:          ;   line counter
    mov bx, cx
    
    mov cx, 6
    inner_loop:          ;   ascii chart counter
    ;bl store by default ascii value
    mov dl, bl
    mov ah, 2h
    int 21h  
    inc bl
    cmp bl, 090
    jg exit              ;   jump if equal
    ;else
    loop  inner_loop     ;   break bl == 256    
    
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    mov cx, bx           ;   value restore
    loop outer_loop 
      
    exit:                ;   segment build
    mov ah, 4ch          ;   ah=4c
    int 21h              ;   interreupt
    main endp            ;   end of procedure
end main                 ;   whole program exit
