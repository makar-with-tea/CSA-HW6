strncpy:
loop:
    lb      t0 (a0)     # �������� ������� �� 1-� ������ ��� ���������
    beqz    t0 end      # ����� ������ 1
    sb t0 (a1)
    addi    a0 a0 1     # Адрес символа в строке 1 увеличивается на 1
    addi    a1 a1 1     # Адрес символа в строке 2 увеличивается на 1
    b       loop
end:
    ret