; basic structure
; Msg Show 1. Single ,13,10, 2. Multiple Str ,13,10, 3. var (1) 1. str 1 2. str 3      
; id taker
;19/7/26
; Multiplication [input: {0-9} output: (0-9}]
      

;.model small ;     1 DS + 1 CS, average, large
;.stack 100h;ss declare,   256 bytes
;.data  
;msg db "welcome to 8086 lab." ,13,10, "Work Hard, Keep Shine." ,13,10, "Brazil is the best. $"   
; rantu db 13,10, "Work Hard, Keep Shine. $" ;13 = carraige return ; 10 = line feet
;var_name+var_size+str
;.code ;whole code

;main proc     ;procedure
 ;   mov ax, @data
 ;   mov ds, ax ;   DS Activate  
    
 ;   lea dx, msg ; str load   ; load effective address
 ;   mov ah, 9h ; str print
;    int 21h ; interreupt   
    
   ; lea dx,  ; str load   ; load effective address
   ; mov ah, 9h ; str print
;   ; int 21h ; interreupt
    
;    exit :  ;   segment build
;    mov ah, 4ch ;  ah=4c
;    int 21h;       interreupt
;    main endp    ; end of procedure
;end main  ; whole program exit        



.model small ;     1 DS + 1 CS, average, large
.stack 100h;ss declare,   256 bytes
.data  
.code ;whole code

main proc     ;procedure
    mov ax, @data
    mov ds, ax ;   DS Activate
    
    mov ax, 3 
    mov cx, 3 
    mul cx ;multiplier
    mov dx, ax     ;out reg  
    add dx, '0'   ; ascii convert
    mov ah, 2h; char print
    int 21h ; interrupt
    
    exit:
    mov ah, 4ch
    int 21h
main endp ; end of precedure 
end main ; whole program exit
    
