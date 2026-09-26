displayResult proc 
    ; Newline
    mov ah, 2h
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    ; Print Highest Mark Label & Value
    lea dx, high
    mov ah, 9h
    int 21h
    
    mov dl, highest
    add dl, '0'
    mov ah, 2h
    int 21h 
    
    ; Print Lowest Mark Label & Value
    lea dx, low
    mov ah, 9h
    int 21h
    
    mov dl, lowest
    add dl, '0'
    mov ah, 2h
    int 21h
    
    ; Print Passed Count Label & Value
    lea dx, pass
    mov ah, 9h
    int 21h
    
    mov dl, passed
    add dl, '0'
    mov ah, 2h
    int 21h 
    
    ; Print Failed Count Label & Value
    lea dx, fail
    mov ah, 9h
    int 21h
    
    mov dl, failed
    add dl, '0'
    mov ah, 2h
    int 21h   
    
    ; Print Average Mark Label & Value
    lea dx, avg
    mov ah, 9h
    int 21h
    
    mov dl, average
    add dl, '0'
    mov ah, 2h
    int 21h
    
    ; Print Merit List Header
    lea dx, list
    mov ah, 9h
    int 21h

    ; Print Sorted Merit List Elements
    lea si, number
    mov cl, n
    xor ch, ch

print_merit_loop:
    mov dl, [si]
    add dl, '0'
    mov ah, 2h
    int 21h

    ; Print Space Separator
    mov dl, ' '
    mov ah, 2h
    int 21h

    inc si
    loop print_merit_loop
    
    ret
displayResult endp
