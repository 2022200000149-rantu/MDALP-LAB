.model small ; 1 DS + 1 CS, average, large
.stack 100h  ; ss declare, 256 bytes

.data  
    dividend  db 13, 10, "Enter Dividend: $"  
    divisor   db 13, 10, "Enter Divisor: $"
    quotient  db 13, 10, "Quotient: $"
    remainder db 13, 10, "Remainder: $"
    error     db 13, 10, "Error: Division by Zero!$"

.code
main proc
    mov ax, @data
    mov ds, ax ; Activate Data Segment
    
    ; --- 1. GET DIVIDEND ---
    lea dx, dividend
    mov ah, 9h
    int 21h 
    
    mov ah, 1h ; character input
    int 21h 
    mov bl, al ; store dividend ASCII in BL
    sub bl, '0' ; convert ASCII to integer number
    
    ; --- 2. GET DIVISOR ---
    lea dx, divisor
    mov ah, 9h
    int 21h 
    
    mov ah, 1h ; character input
    int 21h 
    mov bh, al ; store divisor ASCII in BH
    sub bh, '0' ; convert ASCII to integer number
    
    ; --- 3. CHECK DIVIDE BY ZERO ---
    cmp bh, 0
    je divide_zero 
     
    ; --- 4. PERFORM DIVISION ---
    ; Must clear AH right before DIV so AX contains ONLY the dividend
    mov al, bl 
    xor ah, ah ; clear high byte (AX = 0000 + AL)
    div bh     ; AX / BH -> AL = Quotient, AH = Remainder
    
    mov ch, ah ; safely save remainder in CH before AH is modified by string printing
    mov cl, al ; safely save quotient in CL

    ; --- 5. PRINT QUOTIENT ---
    lea dx, quotient
    mov ah, 9h
    int 21h 

    mov dl, cl  ; load saved quotient
    add dl, '0' ; convert integer back to ASCII character
    mov ah, 2h  ; print character
    int 21h   
    
    ; --- 6. PRINT REMAINDER ---
    lea dx, remainder
    mov ah, 9h
    int 21h 

    mov dl, ch  ; load saved remainder
    add dl, '0' ; convert integer back to ASCII character
    mov ah, 2h  ; print character
    int 21h

    jmp exit
    
divide_zero:   
    lea dx, error
    mov ah, 9h
    int 21h 
     
exit:
    mov ah, 4ch
    int 21h
main endp
end main
