.model small             ;     1 DS + 1 CS
.stack 100h              ;   256 bytes
.data  
.code

main proc
    mov ax, @data
    mov ds, ax           ;   DS Activate  
      
      
    exit :               ;   segment build
    mov ah, 4ch          ;  ah=4c
    int 21h              ;       interreupt
    main endp            ; end of procedure
end main                 ; whole program exit
