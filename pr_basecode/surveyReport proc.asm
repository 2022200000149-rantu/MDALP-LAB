surveyReport proc
    lea si, number
    mov cl, n
    xor ch, ch
    mov al, [si]
    
    mov highest, al     ; Initialize highest mark
    mov lowest, al      ; Initialize lowest mark
    
next_number:
    mov al, [si]
    cbw                 ; Convert byte to word for addition
    add sum, ax         ; Accumulate sum
    
    mov al, [si]        
    cmp al, highest
    jbe check_low       ; Jump if AL <= highest
    
    mov highest, al     ; Update highest
    
check_low:
    cmp al, lowest
    jae check_pass      ; Jump if AL >= lowest
    
    mov lowest, al      ; Update lowest
    
check_pass:
    cmp al, 4 
    jb failed_student   ; Mark < 4 is considered failed
    
    inc passed
    jmp continue_next
    
failed_student:
    inc failed
    
continue_next:
    inc si
    loop next_number
    
    ret
surveyReport endp
