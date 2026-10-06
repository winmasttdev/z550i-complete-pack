NOT_Z550_do_not_flash/ — kept as a format example, never flash
===============================================================

    Equalizer_Patch_W810_R4EA031.vkp   235 B

DO NOT FLASH THIS ON A Z550I.

  Its header reads `;W810 SW-R4EA031`. That is a W810i patch, firmware R4EA031. The Z550i is
  DB2010 on R6CA009/R6GA004. The addresses are wrong for this phone — applying it would write
  the wrong bytes to the wrong places, which on an A1 platform means a bricked filesystem at
  best.

  This file surfaced inside the Agrakesh acoustic set in SE-NSE.rar, where it sits next to
  sound-driver files and looks plausible. It is not a Z550i patch.

WHY IT IS HERE ANYWAY
  As a worked example of vkp structure: how the comment header, the optional `+base` line
  and the offset/payload pairs are laid out. Useful if you want to read or hand-write a vkp.
  For that purpose the full reference material is ../../farid1991_patch-se/, which has ~50
  complete patch projects with IAR sources and the elf2vkp toolchain.

  A second copy of this same W810i patch was also found inside the Agrakesh acoustic set in
  ../../acoustic/db2010_db2012_all/Agrakesh/Equalizer_Patch/. That one is left in place as it
  arrived; it is the same wrong-model patch and equally not for this phone.

FLASH ORDER
  None. This file is documentation.