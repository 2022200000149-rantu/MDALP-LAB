.model small ;     1 DS + 1 CS
.stack 100h;   256 bytes
.data  
msg db "Summation:  $"   ;to print " only and $ only
;var_name+var_size+str
.code

main proc
    mov ax, @data
    mov ds, ax ;   DS Activate  
    
     
    
    lea dx, msg ; str load   ; load effective address
    mov ah, 9h ; str print
    int 21h ; interreupt       
    
    addtion:
    mov al, 4 ; ax = 4
    mov dl, 4 ; dx=4
    add dl, al ; dx = dx + ax = 4 + 4 = 8  
    add dl,'0' ; '0' = 30h = 048           
    mov ah, 2h ; char print
    int 21h ; interrupt
    
    
    exit :  ;   segment build
    mov ah, 4ch ;  ah=4c
    int 21h;       interreupt
    main endp    ; end of procedure
end main  ; whole program exit
