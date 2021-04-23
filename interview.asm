; Name: "interview.asm"
;
; Description: This file is responsible for...
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
extern scanf

; Constants
section .data
  dialog_1 db "Hello, %s. I am Ms. Fenster. The interview will begin now.", 0xA, "Wow! $%.2lf is a lot of cash. Who do you think you are? Chris Sawyer? (y or n)", 0xA, 0x0
  dialog_2 db "Alright. Now we will get to work on some electricity.", 0xA, "Please enter the resistance of circuit #1 in Ohms.", 0xA, 0x0
  dialog_3 db "What is the resistance of circuit #2 in Ohms?", 0xA, 0x0
  dialog_4 db "The total resistance is %lf Ohms.", 0xA, "Were you a computer science major? (y or n)", 0xA, 0x0
  dialog_5 db "Thank you. Please follow the exit signs to the front desk.", 0xA, 0x0

  text_input db "%s"
  number_input db "%lf"

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

  ; Place arguments in higher registers for safe-keeping.
  mov r15, rdi
  movsd xmm15, xmm0

  ; Print the first message. "Hello, {name}. I am Ms. Fenster..."
  mov rax, 0x1
  mov rdi, dialog_1
  mov rsi, r15
  movsd xmm0, xmm15
  call printf

  ; Await and capture interviewee's response.
  mov rdi, text_input
  mov rsi, rsp
  call scanf
  
  ; Confirm interviewee is Chris Sawyer.
  mov rax, [rsp]
  cdqe 
  cmp rax, 'y'
  je bring_out_the_big_bucks

  ; Print the second message. "Alright. Now we will get to work on..."
  mov rax, 0x0
  mov rdi, dialog_2
  call printf

  ; Read the resistance of circuit #1
  ; mov rdi, text_input
  ; mov rsi, rsp
  ; call scanf

  ; Print the third message. "What is the resistance of..."
  mov rax, 0x0
  mov rdi, dialog_3
  call printf

  ; Read the resistance of circuit #2
  ; mov rdi, text_input
  ; mov rsi, rsp
  ; call scanf

  ; Here, do all of the resistance calculations
  ; Read: https://github.com/AaronLieb/cs240/blob/f8a3290e01c51b7a0680c3b5698241dad798527d/f2/compute_resistance.asm

  ; Print the fourth message. "The total resistance is..."
  mov rax, 0x1
  mov rdi, dialog_4
  movsd xmm0, xmm15; TODO: replace xmm15 with total resistance
  call printf

  ; Await and capture interviewee's response.
  mov rdi, text_input
  mov rsi, rsp
  call scanf
  
  ; Confirm interviewee majored in computer science.
  mov r14, 'y'
  cmp rax, r14; try al and ax instead of rax
  je hire_this_person

  mov r13, 1200.12; $1,200.12; 0x4092C07AE147AE14 in IEEE 754
  cvtsi2sd xmm15, r13
  jmp follow_the_exit_signs

hire_this_person:
  mov r13, 88000.88; $88,000.88
  cvtsi2sd xmm15, r13
  jmp follow_the_exit_signs

bring_out_the_big_bucks:
  mov r13, 1000000; $1,000,000.00
  cvtsi2sd xmm15, r13

follow_the_exit_signs:

  ; Print the fifth message. "Thank you. Please follow the exit signs..."
  mov rax, 0x0
  mov rdi, dialog_5
  call printf

  ; Prepare to return the salary.
  movsd xmm0, xmm15

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