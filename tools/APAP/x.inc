;format ELF dwarf executable
;This file is a mod of copyrighted den'po "x.inc" file at
; http://justdanpo.cheb.ru/data/projects/gsm/armpc.rar

PROCESSOR 0x3ff

if ~ defined MAINARMLIB
  MAINARMLIB equ 1

macro pad val
{
  db ( (($+val-1)and(0xFFFFFFFF-val+1))-$ )dup 0
}

macro bxd ad,dr
{
local _ad
  if dr eq
    ldr  r4,_ad
    bx r4
  else
    ldr  dr,_ad
    bx dr
  end if
  align 4
_ad dw (ad+1)
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

macro org off
{
  db 'justdase'
  dw off
  org off
}

macro movl r,v
{
  if v<256
    mov r,(v)
  else if v<511
    mov r,255
    add r,(v-255)
  else
    num=0x00FFFFFF
    sdv=24
    rept 23
    \{
      if (v and num)=0
        mov r,(v shr sdv)
        lsl r,r,sdv
        num = 0xFFFFFFFF
      end if
      num = (num shr 1) + 0x80000000
      sdv = sdv-1
    \}
    if ~ num = 0xFFFFFFFF
      bad value
    end if
  end if
}

macro detectcodesize
{
  virtual at 0
    nop
  global_codesize = $ * 8
  end virtual
}

DCD fix dw
DCB fix db
MOVL fix movl

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
end if
