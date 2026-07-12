.model small ;     1 DS + 1 CS
.stack 100h;   256 bytes
.data  
msg db "welcome to 8086 lab." ,13,10, "Work Hard, Keep Shine." ,13,10, "Brazil is the best. $"   
; rantu db 13,10, "Work Hard, Keep Shine. $" ;13 = carraige return ; 10 = line feet
;var_name+var_size+str
.code

main proc
    mov ax, @data
    mov ds, ax ;   DS Activate  
    
    lea dx, msg ; str load   ; load effective address
    mov ah, 9h ; str print
    int 21h ; interreupt   
    
   ; lea dx,  ; str load   ; load effective address
   ; mov ah, 9h ; str print
   ; int 21h ; interreupt
    
    exit :  ;   segment build
    mov ah, 4ch ;  ah=4c
    int 21h;       interreupt
    main endp    ; end of procedure
end main  ; whole program exit
