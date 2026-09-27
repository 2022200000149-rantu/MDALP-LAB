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
