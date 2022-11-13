    .intel_syntax noprefix

    .equ    max_size, 1000                                               # максимально разрешенная длина массива
    .equ    char_size, 2

    .section .rodata
errMessage:
    .string      "Something wrong!\n You should set names of two files.\n"
toRead:
    .string "r"
toWrite:
    .string "w"
correct:
    .string      "Correct!\n"
debug:
    .string      "debug %d!\n"
error:
    .string      "Result!\n" 
error_min:
    .string      "Minimal sign is \"%c\", but your \"%c\".\n"    
error_max:
    .string      "Maximal sign is %с, but your %с.\n"  
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
    .int   126
max:
    .int   34
length:
    .long   0
    
argc:
    .space  4
ifst:           # указатель на файл, открываемый файл для чтения
    .space  8
ofst:           # указатель на файл, открываемый файл для проверки ответа.
    .space  8
    
    
    
    
#-------------------------------------------------------------------------------
# Файловый ввод
.section .text
input_input:                                 
    push    rbp
    mov     rbp, rsp
    mov     QWORD PTR length[rip], 0
    
loop_scan:                                    # ввод массива
    mov	rax, QWORD PTR ifst[rip]
    mov	rdi, rax
    call	fgetc@PLT
    
    
    mov     r11, QWORD PTR length[rip]
    cmp     eax, -1                          # проверка на окончание
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
    mov       rax, length[rip]

start_step:



    cmp     r11, rax
    jge     end_step
    movzx     r14, BYTE ptr [r11*2+r15]
    cmp     r14, r12
    jb      upd_min
    cmp     r13, r14
    jb      upd_max
  
    inc     r11
    jmp     start_step
    
upd_min:
    cmp     r12, '\n'
    je      start_step
    mov     r14, r12
    inc     r11
    jge     start_step
    
upd_max:
    mov     r13, r14
    inc     r11
    jmp     start_step
    
end_step:
    mov    rax, r12
    mov    dword ptr min[rip], eax              # выгружаем результат(минимум) в переменную 
    mov    rax, r13
    mov    dword ptr max[rip], eax              # выгружаем результат(максимум) в переменную 
    pop	rbp
    ret
   


#-------------------------------------------------------------------------------
# Подпрограмма вывода результата
    .section .text
    .global print
print:                                       
    push    rbp
    mov     rbp, rsp
    
    

    mov     rdi, ofst[rip]                     # указатель на файл
    lea     rsi, min_msg[rip]                   # Вывод минимума на экран
    mov     rdx, min[rip]
    mov     eax, 0
    call    fprintf@PLT
    

    mov     rdi, ofst[rip]                     # указатель на файл
    lea     rsi, max_msg[rip]                   # Вывод минимума на экран
    mov     rdx, max[rip]
    mov     eax, 0
    call    fprintf@PLT
    
   
print_end:
    pop	rbp
    ret


#-------------------------------------------------------------------------------
# Главная функция программы
    .section .text
    .global main
main:
    push    rbp
    mov     rbp, rsp
    
    mov r12, rdi
    mov r13, rsi
    cmp r12, 3                                # проверка количества аргументов
    je next
    lea     rdi, errMessage[rip]
    xor     eax, eax
    call    printf
    mov     eax, 0
    jmp     main_end
    
next:    
    
    mov     rdi, [r13+8]                      # имя открываемого файла
    lea     rsi, toRead[rip]                  # открыть для чтения
    mov     rax, 0
    call    fopen
    mov     ifst[rip], rax                    # сохранение указателя на файл
    
    mov     rdi, [r13+16]                     # имя открываемого файла
    lea     rsi, toWrite[rip]                 # открыть для чтения
    mov     rax, 0
    call    fopen
    mov     ofst[rip], rax                    # сохранение указателя на файл
    

    call    input_input                        # считываем строку
    call    create_ans                         # получаем ответ
    call    print                              # вывод ответа
    
main_end: 
    mov     eax, 0
    mov     rsp, rbp                           # удалить локальные переменные
    pop     rbp                                # восстановить кадр вызывающего
    ret
    