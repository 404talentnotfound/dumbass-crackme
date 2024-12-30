default rel

global main

extern printf
extern scanf
extern GetCommandLineA
extern ReadFile
extern CreateFileA
extern ReadFile
extern CloseHandle
extern ExitProcess

section .data
    the db `Please input the password character by character separated by newlines.\n\0`
    a db `Hello, this is one of my first projects in assembly! Try to find the second command line argument when decompiling it to continue.\n\0`
    yeah db `Incorrect password.\n\0`
    no db `You did the thing no way!!! P.S. Modifying the program to output this message doesn't count.\n\0`
    trole db "%s", 0
    trole2 db "%d", 0
    т db "d", 0
    p db "s", 0
    о db "t", 0
    c db "f", 0
    e db "r", 0
    m db "c", 0
    к db "i", 0
    B db "l", 0
    filename equ $
    y dd 0

section .bss
    t resb 2
    р resb 2
    o resb 2
    с resb 2
    е resb 2
    м resb 2
    k resb 2
    в resb 2
    у resb 2

section .text
    main:
        mov rbx, [rsp+8]

        lea r14, [no]

        mov rax, dword `r\0`
        mov [t], rax
        mov rax, dword `q\0`
        mov [р], rax
        mov rax, dword `f\0`
        push rax
        mov rax, dword `g\0`
        pop rax
        push rax
        mov [с], rax
        pop rax
        mov [o], rax
        mov rax, qword `v\0`
        push rax
        mov rax, dword `v\0`
        mov [е], rax
        pop rax
        mov rax, qword `a\0`
        mov [м], rax
        mov rsi, .epic_fail
        push rsi
        mov rax, dword `b\0`
        mov [k], rax
        mov rax, qword `e\0`
        mov [в], rax

        pop rax

        cmp rbx, 2
        je .success

        push rax
        push rbx
        push rcx
        push rdx
        pop rdx
        pop rcx
        pop rbx
        pop rax

        jmp vicroty_yorale

        xor rax, rax
        leave
        ret

    .success:
        xor r15, r15
        mov r12, 17
        mov rbx, filename

        call GetCommandLineA
        jmp .get_file_descriptor

    .get_file_descriptor:
        cmp byte [rax], ' '
        je .write_file
        inc rax
        jmp .get_file_descriptor
    
    .write_file:
        inc rax
        cmp byte [rax], ' '
        je .write_file

        mov rdi, rax

        xor r15, r15
        mov r12, 17
        mov rbx, filename
        jmp .close_file_handle

    .print_contents:
        pop rax

    .close_file_handle:
        lea rsi, [m]
        mov rcx, 1
        repe cmpsb
        je bacon_epic_style

        jmp vicroty_yorale

    .epic_fail:
        dec rbx
        inc r15

        cmp r15, r12
        jg you_lose

        cmp byte[rbx], 65
        jl .epic_fail

        cmp byte[rbx], 127
        jg .epic_fail

        lea rcx, [trole]
        lea rdx, [у]
        call scanf
        
        mov cl, [у]

        cmp byte[rbx], cl
        je .epic_fail

        mov rdi, 1
        jmp .epic_fail

you_lose:
    cmp rdi, 1
    je .start

    cmp r8, 1
    je you_win

    cmp r12, 17
    jl .infinite_loop

    .start:
        mov r8, 1
        cmp r12, 16
        je you_win
    .stop:
        xor rcx, rcx
        xor r15, r15
        mov rbx, у
        mov r12, 16
        jmp main.epic_fail
    
    .infinite_loop:
        lea rcx, [no]
        sub rsp, 8+16
        call printf
        add rsp, 8+16

    xor rax, rax
    leave
    ret

you_win:
    .congratulations:
        lea rcx, [yeah]
        sub rsp, 8+16
        call printf
        add rsp, 8+16

    xor rax, rax
    leave
    ret

vicroty_yorale:
    .congratulations:
        lea rcx, [a]
        sub rsp, 8+16
        call printf
        add rsp, 8+16

    xor rax, rax
    leave
    ret

bacon_epic_style:
    lea rcx, [the]
    sub rsp, 8+16
    call printf
    add rsp, 8+16

    jmp main.epic_fail