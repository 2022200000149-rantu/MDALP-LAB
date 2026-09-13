; Shift(shl,shr), Rotation(rol,ror) , proc(sub function inside main function)
.model small
.stack 100h   
.data   
shiftleft db "Shift Left: $"
shiftright db 13,10, "Shift Right: $"
rotateleft db 13,10, "Rotate Left: $"
rotateright db 13,10, "Rotate Right: $"
.code

main proc
    mov ax, @data
    mov ds, ax 
    
    shift_left:                    ; left shift
    lea dx, shiftleft
    mov ah, 9h
    int 21h 
    
    mov ax, 3
    shl ax, 1                      ; opcode+shifted reg + shifted bit
    mov dx, ax
    add dx, '0'                    ; asci convert
    mov ah, 2h
    int 21h
    
    shift_right:                   ; Right shift
    lea dx, shiftright
    mov ah, 9h
    int 21h 
    
    mov ax, 3
    shr ax, 1                      ; opcode+shifted reg + shifted bit
    mov dx, ax
    add dx, '0'                    ; asci convert
    mov ah, 2h
    int 21h 
    
    
    ;-----------------------------------------------------------------
    
    rotate_left:                    ; left rotate
    lea dx, rotateleft
    mov ah, 9h
    int 21h 
    
    mov ax, 2
    rol ax, 2                      ; opcode+shifted reg + shifted bit
    mov dx, ax
    add dx, '0'                    ; asci convert
    mov ah, 2h
    int 21h
    
    rotate_right:                   ; Right rotate
    lea dx, rotateright
    mov ah, 9h
    int 21h 
    
    mov ax, 2
    ror ax, 2                      ; opcode+shifted reg + shifted bit
    mov dx, ax
    add dx, '0'                    ; asci convert
    mov ah, 2h
    int 21h
    
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
