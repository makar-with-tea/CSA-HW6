.text
strncpy:
    li t1 0
loop:
    lb t0 (a0)     # �������� ������� �� 1-� ������ ��� ���������
    beqz t0 end      # ����� ������ 1
    sb t0 (a1)
    addi a0 a0 1     # ����� ������� � ������ 1 ������������� �� 1
    addi a1 a1 1     # ����� ������� � ������ 2 ������������� �� 1
    addi t1 t1 1
    blt t1 a2 loop # ������ ��� �����, ��� ��� ���� � ����� ������ �� ����������� � �� �����
end:
    sb zero (a1)
    ret