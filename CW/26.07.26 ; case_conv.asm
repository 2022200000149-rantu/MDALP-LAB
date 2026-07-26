.model small ;     1 DS + 1 CS
.stack 100h;   256 bytes
.data    
lower db 13,10, "Enter lowercase: $"
higher db 13,10, "This is your highercase: $"
.code

main proc
    mov ax, @data
    mov ds, ax ;   DS Activate  
            
    ;lower msg print
    lea dx, lower ; str load   ; load effective address
    mov ah, 9h ; str print
    int 21h ; interreupt  
    
    ;user input
    mov ah,1h ;user input 
    int 21h
    ;al rcv input by default  - to take next input al miust be free
    mov bl,al 
    
    ;higher msg print
    lea dx, higher ; str load   ; load effective address
    mov ah, 9h ; str print
    int 21h ; interreupt
    
    ;operation
    sub bl, 32    ; 'c' = 99, 'C' = 67 ; 99-67=32 ; higher base convert 
    mov dl, bl  ;output register shift
    mov ah,2h  ;char output
    int 21h 
    jmp exit
    
    exit :  ;   segment build
    mov ah, 4ch ;  ah=4c
    int 21h;       interreupt
    main endp    ; end of procedure
end main  ; whole program exit
