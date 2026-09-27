sortMerit proc
    mov cl, n
    cmp cl, 1
    jbe end_sort        ; If student count <= 1, skip sorting
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
    jae no_swap         ; For descending order: keep if [si] >= [si+1]
    
    ; Swap elements
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
