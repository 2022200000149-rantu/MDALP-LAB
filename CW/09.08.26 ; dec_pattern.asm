.model small             ;   1 DS + 1 CS
.stack 100h              ;   256 bytes
.data  
.code

main proc
    mov ax, @data
    mov ds, ax           ;   DS Activate  
      
    mov cx, 5            ;   global condition
    outer_loop:          ;   new line print, line counter  
    mov bx, cx           ;   temp saver
    
    inner_loop:          ;   Char print,count
    mov dl, '*'          ;   load char
    mov ah, 2            ;   char print  
    int 21h              ;   Interupt
    loop inner_loop      ;   break when cx =0
    
    
    ;13,10 alternate
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    mov cx, bx           ;   Value Restore
    loop outer_loop      ;   break when cx =0
    
      
    exit :               ;   segment build
    mov ah, 4ch          ;   ah=4c
    int 21h              ;   interreupt
    main endp            ;   end of procedure
end main                 ;   whole program exit
