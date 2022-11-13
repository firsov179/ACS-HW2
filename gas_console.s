    .intel_syntax noprefix

    .equ    max_size, 1000                                               # максимально разрешенная длина массива
    .equ    char_size, 2

    .section .rodata

min_msg:
    .string      "The minimal sign is \"%c\".\n"                         # Формат вывода минимума
max_msg:
    .string      "The maximal sign is \"%c\".\n"                         # Формат вывода максимума
format_elem:
    .string      "%с"                         # Формат для ввода/вывода символа
end_msg:
    .string      "\n"                         # перевод строки
    .section .data
input:
    .space max_size * char_size                # выделяем память для строки A
min:
    .int   220
max:
    .int   0
length:
    .long   0
    
    
    
    
#-------------------------------------------------------------------------------
# Подпрограмма ввода строки
.section .text
input_input:                                 
    push    rbp
    mov     rbp, rsp
    mov     QWORD PTR length[rip], 0
    
loop_scan:                                    # ввод массива
    mov	rax, QWORD PTR stdin[rip]
    mov	rdi, rax
    call	fgetc@PLT
    mov     r11, QWORD PTR length[rip]
    cmp     rax, '\n'                         # проверка на окончание
    je     scan_end                          # завершение ввода элементов


   
    lea     r13, input[rip]
    mov     dword ptr [r11* 2+r13], eax

    
    inc     r11                               # ++i
    mov     QWORD PTR length[rip], r11
    jmp     loop_scan
    
scan_end:
    pop	rbp
    ret

   


    
#-------------------------------------------------------------------------------
# Подпрограмма поиска ответа
    .section .text
    .global  find
create_ans:                                   
    push    rbp
    mov     rbp, rsp  

    mov     r11, 0                                # r11 - индексатор  
    lea     r15, input[rip]                       # r15 - хранит информацию о адресе начала массива  
    movzx     r12, BYTE PTR [r11*2+r15]           # r12 - хранит информацию о минимуме  
    movzx     r13, BYTE PTR [r11*2+r15]           # r13 - хранит информацию о максимуме 
    

start_step:
    cmp     r11, length[rip]
    jge     end_step
    movzx     r14, BYTE ptr [r11*2+r15]
    cmp     r14, r12
    jb      upd_min
    cmp     r13, r14
    jb      upd_max
  
    inc     r11
    jmp     start_step
    
upd_min:
    mov     r12, r14
    jmp     start_step
    
upd_max:
    mov     r13, r14
    jmp     start_step
    
end_step:
    mov    rax, r12
    mov    dword ptr min[rip], eax              # выгружаем результат(минимум) в переменную 
    mov    rax, r13
    mov    dword ptr max[rip], eax              # выгружаем результат(максимум) в переменную 
    pop	rbp
    ret
   


#-------------------------------------------------------------------------------
# Подпрограмма вывода
    .section .text
    .global print
print:                                       
    push    rbp
    mov     rbp, rsp
                         

    lea     rdi, min_msg[rip]                 # Вывод минимума на экран
    mov     rsi, min[rip]
    mov     eax, 0
    call    printf@PLT
    
     lea     rdi, max_msg[rip]                # Вывод максимума на экран
    mov     rsi,  max[rip]
    mov     eax, 0
    call    printf@PLT
    pop	rbp
    ret



#-------------------------------------------------------------------------------
# Главная функция программы
    .section .text
    .global main
main:
    push    rbp
    mov     rbp, rsp

    call    input_input                        # считываем строку
    call    create_ans                         # получаем ответ
    call    print                              # вывод ответа
    
main_end: 
    mov     eax, 0
    mov     rsp, rbp                           # удалить локальные переменные
    pop     rbp                                # восстановить кадр вызывающего
    ret
    