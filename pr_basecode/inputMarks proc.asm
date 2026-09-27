inputMarks proc
    lea si, number
    mov cl, n
    xor ch, ch          ; Clear CH (CX = total students)
    mov dl, 1           ; Student index counter
    xor dh, dh
    
array_input:
    push cx             ; Save loop count
    push dx             ; Save student counter
    
    ; Display "Enter mark of Student "
    lea dx, mark
    mov ah, 9h
    int 21h
    
    pop dx
    push dx
    add dl, '0'          ; Convert student index to ASCII
    mov ah, 2h
    int 21h
    
    ; Display ": "
    lea dx, counter
    mov ah, 9h
    int 21h
    
    ; Read mark
    mov ah, 1h
    int 21h
    sub al, '0'          ; Convert ASCII input to numeric decimal
    mov [si], al        ; Store mark in array
    inc si
    
    pop dx
    inc dl              ; Move to next student index
    pop cx
    loop array_input    ; Repeat until all marks are entered
    
    ret
inputMarks endp
