APAP/ — Advanced Patch Porting
===============================

10 files, 1 029 218 B. A patch-porting workbench: it takes an existing patch for one model
and helps you retarget it at another.

    APAP_Beta.exe      the application. Beta, as the name says.
    fasmarm.dll        the assembler it drives — this is the piece that actually turns
                       offset/payload text into bytes
    x.inc              include file for the assembly dialect
    Lib.ini            library configuration
    Lang/              English, Russian, Polish, Portuguese-Brazil, Norwegian
    _Changelog.txt     upstream's own change log

WHY IT IS HERE
  The Z550i patch scene was almost entirely one community patching its own phone, and every
  .vkp in ../../patches/ came out of that workflow. APAP is the tool for the next step:
  taking a patch that works on a neighbouring DB2010-family phone and making it work here.

WHEN YOU WOULD ACTUALLY USE IT
  If you wanted to port one of the W810i or W600i patches — the Z550i shares the DB2010
  chipset with the W810i and is close to a sibling of it — to R6GA004, whose offsets differ
  from R6CA009's. Or to build a new patch from scratch, where jjPatcher
  (../../1-Patcher.jar, bpatch.exe, customize_upgrade.xml) is the easier GUI route and APAP
  is the lower-level one.

THE TOOLCHAIN, IN ONE PLACE
    writing a patch by hand   jjPatcher (GUI) or a text editor
    porting a patch           APAP
    the vkp format reference ../../patches/farid1991_patch-se/ — ~50 complete projects
    building an ElfPack       ../../elfpack/sources_perk11/ and ./elfpack_sources_perk11/
    the ELF binaries          ../../elfpack/wayback/elfs/

FLASH ORDER
  None of this is flashed. It is tooling that produces .vkp files, which are then flashed in
  bflash exactly as described in ../../INDEX.md §8.B — heap_shift.vkp first if you stack
  several.

A WORD OF WARNING
  All 18 flashable patches in ../../patches/ target R6CA009 specifically. Porting one to
  R6GA004 is real work, not a matter of changing a header. Read ../../INDEX.md §1 before you
  assume an address carries over.