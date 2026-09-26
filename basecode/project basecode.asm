.model small
.stack 100h
.data
input db "Enter Number of Students: $"
mark db 13,10, "Enter mark of Student $"
counter db ": $"

high db 13,10, "Highest Mark: $"
low db 13,10, "Lowest Mark: $"
avg db 13, 10, "Average Mark: $"
pass db 13,10, "Passed Students: $"
fail db 13,10, "Failed Students: $"
list db 13,10,13,10, "Merit List ", 13,10, "$" 
    
number db 10 dup(?)  
n db ?
highest db ?
lowest db ?

passed db 0 
failed db 0

sum dw 0
average db ? 

.code        

main proc 
    mov ax, @data
    mov ds, ax
    
    ;input msg print
    lea dx, input
    mov ah, 9h
    int 21h 
    
    ;take input value 
    mov ah, 1h          ;how many students in your class
    int 21h  
    
    
    sub al, '0'
    
    mov n, al           ;n= student number
    
    call inputMarks     ;students marks input in array
    call surveyReport   ;high,low,pass,fail
    call calAvg         ;calculate average
    ;call sortMerit      ;merit list in des order
    call displayResult  ;display all output 
    
    
    
    
    exit:
    mov ah, 4ch
    int 21h 
    
    main endp 

inputMarks proc
    lea si, number
    mov cl, n
    xor ch, ch          ;garbage value jate na ashe  , cl+ch = cx
    mov dl, 1           ;maybe counter
    xor dh, dh          ;dl+dh = dx
    
    array_input:        ;students mark input in array
    push cx             ;cx value store in stack
    push dx             ;value save
    
    ;student mark msg in loop
   
    
    lea dx, mark
    mov ah, 9h
    int 21h
    
    pop dx               ;value use
    push dx              ;value save again
    add dl, '0'          ;student number convert to ascii for print  
    mov ah, 2h
    int 21h
    
    ;':' print
    lea dx, counter
    mov ah, 9h
    int 21h
    
    mov ah, 1h           ;array input marks
    int 21h
    ;al
    sub al, '0'          ; decimal conver
    mov [si], al         ; address space
    inc si               ;marks index  
    
    pop dx               ; value use
    inc dl               ;counter index
    pop cx   
    loop array_input     ;cx!=0 loop continue
    
    
    
    
    ret
    inputMarks endp   
surveyReport proc
    lea si, number
    mov cl, n
    xor ch, ch
    mov al, [si]
    
    mov highest, al        ;al=8 = highest
    mov lowest, al          ;al = 8 = lowest
    
    next_number:
    mov al, [si]
    cbw                    ;convert byte to word
    add sum, ax            ;marks sum        
    mov al, [si]          
    cmp al, highest
    jbe check_low          ;jump if below or equal
    
    ;else
    mov highest, al
    
    check_low:
    cmp al, lowest
    jae check_pass         ;jump if above or equal 
    
    ;else
    mov lowest, al
    
    check_pass:
    cmp al, 4 
    jb failed_student      ;jump if below
    
    ;else
    inc passed
    jmp continue_next
    
    failed_student:
    inc failed
    
    continue_next:
    inc si
    loop next_number
    
    ret
    surveyReport endp
    
calAvg proc
    
    mov ax, sum            ;total sum of marks
    mov bl, n              ;number of students
    div bl                 ;al = sum / n (quotient), ah = remainder
    mov average, al
    
    ret
    calAvg endp

sortMerit proc
    mov cl, n
    cmp cl, 1
    jbe end_sort          
    dec cl
    xor ch, ch

outer_loop:
    push cx
    lea si, number
    mov cl, n
    dec cl
    xor ch, ch

inner_loop:
    mov al, [si]
    cmp al, [si+1]
    jae no_swap           ; Descending Order: [si] >= [si+1] ??? swap ??? ??
    
    ; Swap (??????)
    xchg al, [si+1]
    mov [si], al

no_swap:
    inc si
    loop inner_loop

    pop cx
    loop outer_loop

end_sort:
    ret
sortMerit endp    

displayResult proc 
    
    MOV AH, 2h
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
    
    ;highest msg print
    lea dx, high
    mov ah, 9h
    int 21h
    
    ;highest value
    mov dl, highest
    add dl, '0'
    mov ah, 2
    int 21h 
    
    ;lowest msg print
    lea dx, low
    mov ah, 9h
    int 21h
    
    ;lowest value
    mov dl, lowest
    add dl, '0'
    mov ah, 2
    int 21h
    
    ;passed msg print
    lea dx, pass
    mov ah, 9h
    int 21h
    
    ;passed value
    mov dl, passed
    add dl, '0'
    mov ah, 2
    int 21h 
    
    ;failed msg print
    lea dx, fail
    mov ah, 9h
    int 21h
    
    ;failed value
    mov dl, failed
    add dl, '0'
    mov ah, 2
    int 21h   
    
    ;avg msg print
    lea dx, avg
    mov ah, 9h
    int 21h
    
    ;avg value
    mov dl, average
    add dl, '0'
    mov ah, 2
    int 21h
    
    ; Merit List Header print
    lea dx, list
    mov ah, 9h
    int 21h

    ; Display Sorted Merit List
    lea si, number
    mov cl, n
    xor ch, ch

print_merit_loop:
    mov dl, [si]
    add dl, '0'
    mov ah, 2h
    int 21h

    
    mov dl, ' '
    mov ah, 2h
    int 21h

    inc si
    loop print_merit_loop
    
    ret
    displayResult endp
        

end main
