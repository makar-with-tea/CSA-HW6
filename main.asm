# ������������� �-�� strncpy
.eqv     BUF_SIZE 10

.data
buf1: .space BUF_SIZE # ����� ��� ������ ������
buf2: .space BUF_SIZE # ����� ��� ������ ������
empty_test_str: .asciz ""   # ������ �������� ������
short_test_str1: .asciz "Hello!"     # �������� �������� ������
short_test_str2: .asciz "Hello!"     # �������� �������� ������
long_test_str:  .asciz "I am long for BUF_SIZE" # ������� �������� ������

.include "macro-string.m"

.text
.globl main
main:
    # ���� �� ������, ��������� �������������
    # ���� ����� �����
    li a7 5
    ecall
    mv a2 a0
    # ���� ������ 1 � �����
    la      a0 buf1
    li      a1 BUF_SIZE
    li      a7 8
    ecall
    # �������� ����� ������ 1
    li a7 4
    la a0 buf1
    ecall
    # ���� ������ 2 � �����
    la      a0 buf2
    li      a1 BUF_SIZE
    li      a7 8
    ecall
    # �������� ����� ������ 2
    li a7 4
    la a0 buf2
    ecall
    # ������ ������ 1 � ������ 2
    la      a0 buf1
    la      a1 buf2
    jal     strncpy
    # ����� �������������� ������
    li a7 4
    la a0 buf2
    ecall
    li      a0 '\n'
    li      a7 11
    ecall

    # ����� �� ������� �������� ������� � ������
    # ������ �� ������ ������
    la      a0 short_test_str1
    la      a1 short_test_str2
    li a2 3
    jal     strncpy
    # ����� �������������� ������
    li a7 4
    la a0 short_test_str2
    ecall
    li      a0 '\n'
    li      a7 11
    ecall

    # ������ ������ ������ � ������ ������
    la      a0 short_test_str1
    la      a1 empty_test_str
    li a2 6
    jal     strncpy
    # ����� �������������� ������
    li a7 4
    la a0 empty_test_str
    ecall
    li      a0 '\n'
    li      a7 11
    ecall

    # ���������� ���������
    li      a7 10
    ecall
    
.include "strcmp.s"
