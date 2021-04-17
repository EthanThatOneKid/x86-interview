; Name: "interview.asm"
;
; Description: This file is responsible for orchestrating the
;              user inputting floats into an array, displaying
;              the array, and calculating the sum of the user-
;              entered numbers.
;
; Author: Ethan Davidson
;         EthanDavidson@csu.fullerton.edu
;         https://github.com/EthanThatOneKid
;
;                     GNU GENERAL PUBLIC LICENSE
;                        Version 3, 29 June 2007
;
;  Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
;  Everyone is permitted to copy and distribute verbatim copies
;  of this license document, but changing it is not allowed.

; Imports
extern printf

; Constants
section .data
  debug_dialog_1 db "Name: %s", 0xA, 0x0
  debug_dialog_2 db "Salary: %f", 0xA, 0x0

; Exports
section .text
  global interview

; Interview Module
interview:
  push rbp
  mov rbp, rsp
  push rbx
  push rcx
  push rdx
  push rdi
  push rsi
  push r8
  push r9
  push r10
  push r11
  push r12
  push r13
  push r14
  push r15
  pushf

  ; Place arguments in registers for longer-term storage.
  mov r15, rdi
  movsd xmm15, xmm0

  ; Dummy push to the align stack.
  push qword 0x0

  ; Print the welcome message.
  mov rax, 0x0
  mov rdi, debug_dialog_1
  mov rsi, r15
  call printf

  ; Print the welcome message.
  mov rax, 0x1
  mov rdi, debug_dialog_2
  mov rsi, xmm15
  call printf

  ; 15 pops
  popf
  pop r15
  pop r14
  pop r13
  pop r12
  pop r11
  pop r10
  pop r9
  pop r8
  pop rsi
  pop rdi
  pop rdx
  pop rcx
  pop rbx
  pop rbp
  ret

; Copyright © 2021 Ethan Davidson