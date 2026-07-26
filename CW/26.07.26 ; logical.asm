;Logical 1.AND 2.OR 3.XOR
;Case Conversion (upper to lower and lower to upper)
    
;Let 1st operand : 011b 2nd operand : 111b   
;AND= 011b=3='3'
;OP=111b=7='7'
;XOR=100=4='4'

.model small ;     1 DS + 1 CS
.stack 100h;   256 bytes
.data 

andmsg db "AND Result: $"
ormsg db 13,10, "OR Result: $"
xormsg db 13,10, "XOR Result: $"
 
.code

main proc
    mov ax, @data
    mov ds, ax ;   DS Activate  
    
    AND_Gate:
    lea dx, andmsg ; str load   ; load effective address
    mov ah, 9h ; str print
    int 21h ; interreupt   
    
    ;and operation
    mov bl, 011b
    and bl, 111b
    mov dl,bl      ;output reg
    add dl,'0'     ;asci convert
    mov ah, 2h     ;char print
    int 21h
    
    OR_Gate:
    lea dx, ormsg ; str load   ; load effective address
    mov ah, 9h ; str print
    int 21h ; interreupt   
    
    ;or operation
    mov bl, 011b
    or bl, 111b
    mov dl,bl      ;output reg
    add dl,'0'     ;asci convert
    mov ah, 2h     ;char print
    int 21h
    
    XOR_Gate:
    lea dx, xormsg ; str load   ; load effective address
    mov ah, 9h ; str print
    int 21h ; interreupt   
    
    ;xor operation
    mov bl, 011b
    xor bl, 111b
    mov dl,bl      ;output reg
    add dl,'0'     ;asci convert
    mov ah, 2h     ;char print
    int 21h
    
    
    
    exit :  ;   segment build
    mov ah, 4ch ;  ah=4c
    int 21h;       interreupt
   
    main endp    ; end of procedure
end main  ; whole program exit
