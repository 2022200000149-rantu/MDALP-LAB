.model small ;     1 DS + 1 CS
.stack 100h;   256 bytes
.data  
number db 13,10, "Enter three numbers: $"
result db 13,10, "This is your largest: $"
.code

main proc
    mov ax, @data
    mov ds, ax             ;   DS Activate  

    ;input msg print
    lea dx, number         ; str load   ; load effective address
    mov ah, 9h             ; str print
    int 21h                ; interreupt      

    mov ah,1h              ; char input    
    int 21h                ; al interrupt   
    mov bl, al             ; 1st number = bl
    int 21h
    mov bh, al             ; 2nd number = bh
    int 21h
    mov cl, al             ; 3rd number = cl
    
    cmp bl, bh             ; bl>=bh
    jge large1             ; jump if greater or equal 
    ;else, bh>bl
    large2:
    cmp bh, cl             ;bh>=cl
    jge large3             ;jump if greater or equal  
    ;else, cl is largest
    
    
    ;output msg print
    lea dx, result         ; str load   ; load effective address
    mov ah, 9h             ; str print
    int 21h                ; interreupt   
    
    ;output value print
    mov dl,cl              ;output reg
    mov ah, 2h             ;char print
    int 21h 
    jmp exit
    
    large3: ;lifo order 
    
    ;output msg print
    lea dx, result         ; str load   ; load effective address
    mov ah, 9h             ; str print
    int 21h                ; interreupt   
    
    ;output value print
    mov dl,bh              ;output reg
    mov ah, 2h             ;char print
    int 21h 
    jmp exit
    
    
    large1:
    cmp bl, cl             ;bl>=cl
    jge large4                   ;jump if greater or equal  
    ;else, cl>bl
    
    ;output msg print
    lea dx, result         ; str load   ; load effective address
    mov ah, 9h             ; str print
    int 21h                ; interreupt   
    
    ;output value print
    mov dl,cl              ;output reg
    mov ah, 2h             ;char print
    int 21h 
    jmp exit
    
    large4:
    ;output msg print
    lea dx, result         ; str load   ; load effective address
    mov ah, 9h             ; str print
    int 21h                ; interreupt   
    
    ;output value print
    mov dl,bl              ;output reg
    mov ah, 2h             ;char print
    int 21h 
    jmp exit
    
    exit :                  ;   segment build
    mov ah, 4ch            ;  ah=4c
    int 21h                ;       interreupt
    main endp              ; end of procedure
end main                   ; whole program exit
