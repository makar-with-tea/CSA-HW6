# Моделирование ф-ии strncpy
.eqv     BUF_SIZE 10

.data
buf1: .space BUF_SIZE # Буфер для первой строки
buf2: .space BUF_SIZE # Буфер для второй строки
empty_test_str: .asciz ""   # Пустая тестовая строка
short_test_str1: .asciz "Hello!"     # Короткая тестовая строка
short_test_str2: .asciz "Hello!"     # Короткая тестовая строка
long_test_str:  .asciz "I am long for BUF_SIZE" # Длинная тестовая строка

.include "macro-string.m"

.text
.globl main
main:
    # тест на данных, введенных пользователем
    # ввод длины строк
    li a7 5
    ecall
    mv a2 a0
    # Ввод строки 1 в буфер
    la      a0 buf1
    li      a1 BUF_SIZE
    li      a7 8
    ecall
    # Тестовый вывод строки 1
    li a7 4
    la a0 buf1
    ecall
    # Ввод строки 2 в буфер
    la      a0 buf2
    li      a1 BUF_SIZE
    li      a7 8
    ecall
    # Тестовый вывод строки 2
    li a7 4
    la a0 buf2
    ecall
    # Запись строки 1 в строку 2
    la      a0 buf1
    la      a1 buf2
    jal     strncpy
    # Вывод результирующей строки
    li a7 4
    la a0 buf2
    ecall
    li      a0 '\n'
    li      a7 11
    ecall

    # Тесты на заранее заданных строках и числах
    # Запись не полной строки
    la      a0 short_test_str1
    la      a1 short_test_str2
    li a2 3
    jal     strncpy
    # Вывод результирующей строки
    li a7 4
    la a0 short_test_str2
    ecall
    li      a0 '\n'
    li      a7 11
    ecall

    # Запись полной строки в пустую строку
    la      a0 short_test_str1
    la      a1 empty_test_str
    li a2 6
    jal     strncpy
    # Вывод результирующей строки
    li a7 4
    la a0 empty_test_str
    ecall
    li      a0 '\n'
    li      a7 11
    ecall

    # Завершение программы
    li      a7 10
    ecall
    
.include "strcmp.s"
