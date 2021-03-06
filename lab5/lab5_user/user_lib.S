#define SYS_WRITE_NUMBER 0
#define SYS_FORK_NUMBER 1
#define SYS_EXIT_NUMBER 2
#define SYS_REMA_NUMBER 3
#define SYS_TASK_ID     4
#define SYS_READ_NUMBER 5
#define SYS_MMAP_NUMBER 6

.section ".text.boot"

.globl _start
_start:
    bl init_print
    bl user_main
    bl exit
hang:
    b hang

.globl delay
delay:
    subs x0, x0, #1
    bne  delay
    ret

.globl write
write:
    mov w8, #SYS_WRITE_NUMBER
    svc #0
    ret

.globl exit
exit:
    mov w8, #SYS_EXIT_NUMBER
    svc #0
    ret

.globl fork
fork:
    mov w8, #SYS_FORK_NUMBER
    svc #0
    ret

.globl remain_page_num
remain_page_num:
    mov w8, #SYS_REMA_NUMBER
    svc #0
    ret

.globl get_taskid
get_taskid:
    mov w8, #SYS_TASK_ID
    svc #0
    ret
 
.globl read
read:
    mov w8, #SYS_READ_NUMBER
    svc #0
    ret

.globl sys_mmap
sys_mmap:
    mov w8, #SYS_MMAP_NUMBER
    svc #0
    ret