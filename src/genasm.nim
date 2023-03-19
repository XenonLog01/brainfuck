proc header*(): string =
  """
extern _putchar
section .data
tape:   times 256 db 0
tptr:   db 1

section .text
global  _main
_main:
  """

proc footer*(): string =
  """
  push 0x10
    call _putchar
    xor eax, eax
    ret
  """

proc op_outb*(): string =
  """
  movzx eax, byte [tptr]
    push eax
    call _putchar
  """

proc op_inc*(): string =
  """
  movzx eax, byte [tptr]
    add eax, 1
    mov byte [tptr], al
  """

proc op_dec*(): string =
  """
  movzx eax, byte [tptr]
    sub eax, 1
    mov byte [tptr], al
  """


proc op_add*(): string =
  """
  add byte [tptr], 1
  """

proc op_sub*(): string =
  """
  sub byte [tptr], 1
  """
