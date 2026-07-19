.model small ;     1 DS + 1 CS, average, large
.stack 100h;ss declare,   256 bytes
.data  
dividend db "Enter Dividend: $" ;db=define 1 byte , dw= define word(2byte)  
 divisor db 13,10, "Enter Divisor: $"
 quotient db 13,10, "Quotient: $"
 error db  "Error Undifined $"
.code ;whole code

main proc     ;procedure
    mov ax, @data
    mov ds, ax ;   DS Activate 
    
    ;load effective address   
    lea dx,   dividend  ;str load
    mov ah,9h     ;str print
    int 21h ;  interrupt 
    
    ;divident  input
    mov ah,1h ; char input    
    int 21h ; al interrupt
    mov bl, al ;divident
    sub bl, '0' ; dec convert
    
    ;load effective address 
    lea dx,   divisor  ;str load
    mov ah,9h     ;str print
    int 21h ;  interrupt
    
    ;divisor   input
    mov ah,1h ; char input    
    int 21h ; al interrupt
    mov bh, al ;divisor
    sub bh, '0' ; dec convert 
    
    ;load effective address 
    lea dx,   quotient  ;str load
    mov ah,9h     ;str print
    int 21h ;  interrupt 
    
    ;corner case
    cmp bh, 0
    je divide_zero ;jump if equal 
     
    ;else 
    mov al, bl ; division 
    xor ah,ah ;memory clear
    div bh ; divisior
    mov dl, al ; output reg
    add dl, '0' ; asci convert
    mov ah, 2h; 
    int 21h   
    jmp exit
    
    
    divide_zero:   
    ;load effective address   
    lea dx,   error  ;str load
    mov ah,9h     ;str print
    int 21h ;  interrupt           
                         
     
    exit:
    mov ah, 4ch
    int 21h
main endp ; end of precedure 
end main ; whole program exit