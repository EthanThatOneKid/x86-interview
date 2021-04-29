; Name: "interview.asm"
;
; Description: This file walks the user through a digital interview
;              with Ms. Fenster of Paramount Programmers, Inc.
;              This includes several questions relying on the
;              user's input. The offered salary at the end of
;              the interview is based on how the questions are
;              answered.
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

  text_input db "%s", 0x0
  float_input db "%lf", 0x0

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
  ; and store in xmm14.
  mov rdi, float_input
  mov rsi, rsp
  call scanf
  movsd xmm14, [rsp]

  ; Print the third message. "What is the resistance of..."
  mov rax, 0x0
  mov rdi, dialog_3
  call printf

  ; Read the resistance of circuit #1
  ; and store in xmm13.
  mov rdi, float_input
  mov rsi, rsp
  call scanf
  movsd xmm13, [rsp]

  ; Create a constant for 1.0
  ; and store it in xmm11
  mov rax, 0x3FF0000000000000; 1.0 in IEEE 754
  movq xmm11, rax

  ; Here, do all of the resistance calculations
  ; and store the result in xmm12.
  movsd xmm10, xmm11; Copy over the 1.0 temporarily.
  divsd xmm10, xmm14; 1.0 / R_1
  addsd xmm12, xmm10; Add to denominator.
  movsd xmm10, xmm11; Copy over the 1.0 temporarily.
  divsd xmm10, xmm13; 1.0 / R_2
  addsd xmm12, xmm10; Add to denominator.
  divsd xmm11, xmm12; 1.0 / denominator
  movsd xmm12, xmm11; Move calculation to xmm12.

  ; Print the fourth message. "The total resistance is..."
  mov rax, 0x1
  mov rdi, dialog_4
  movsd xmm0, xmm12
  call printf

  ; Await and capture interviewee's response.
  mov rdi, text_input
  mov rsi, rsp
  call scanf
  
  ; Confirm interviewee majored in computer science.
  mov rax, [rsp]
  cdqe 
  cmp rax, 'y'
  je hire_this_person

  ; Prepare to offer a minimal salary.
  mov r8, 0x4092C07AE147AE14; $1,200.12 in IEEE 754
  jmp follow_the_exit_signs

hire_this_person:

  ; Offer a respectable salary.
  mov r8, 0x40F57C0E147AE148; $88,000.88 in IEEE 754
  jmp follow_the_exit_signs

bring_out_the_big_bucks:

  ; Offer a magnum opus-level salary.
  mov r8, 0x412E848000000000; $1,000,000.00 in IEEE 754

follow_the_exit_signs:

  ; Place final salary into xmm15
  movq xmm15, r8

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