main proc 
    mov ax, @data
    mov ds, ax
    
    ; Input student count message
    lea dx, input
    mov ah, 9h
    int 21h 
    
    ; Read total number of students
    mov ah, 1h
    int 21h  
    
    sub al, '0'
    mov n, al           ; Store total student count

    ; Procedure calls
    call inputMarks     ; Read marks into array
    call surveyReport   ; Calculate highest, lowest, pass/fail count
    call calAvg         ; Calculate average
    call sortMerit      ; Sort marks in descending order
    call displayResult  ; Display all outputs
    
exit:
    mov ah, 4ch
    int 21h 
main endp
