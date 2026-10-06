custpacks/ — customization / finalization packs
===============================================

A100-platform firmwares need a third file beyond MAIN and filesystem: a customization pack,
also called a finalization pack or CDA pack. Without it the phone flashes but sits
unconfigured. Flash all three.

WHAT IS HERE
  ../Z550_CDA102577_8_RUSSIA.zip                     9 467 B   THE CORRECT ONE for R6CA009
  Z550_CDA102577_8_RUSSIA_extracted/                 66 029 B   the above, unzipped
  Z520i_CDA102414_1_EMEA_1.zip                      14 138 B   Z520i — DO NOT USE ON A Z550i

Z550_CDA102577_8_RUSSIA.zip
  CDA102577_8, revision R2A. This is the pack that matches R6CA009 on this phone. It came
  from firmware.center; archive.org's dump carries the same pack, and se-zone.ru listed the
  identical CDA102577_8/R2A zip, so all three routes agree on what belongs here.

Z550_CDA102577_8_RUSSIA_extracted/
  Already in XS++ shape. It contains exactly one child folder, tpa/, which is what XS++
  expects to find inside an `own_custpack/` directory — you do not need to unpack or
  restructure anything:

    tpa/preset/custom/Customize.xml
    tpa/preset/custom/CONTENT_DOWNLOAD_HOOK.itm
    tpa/preset/custom/FM_PICTURES_HOOK_3.itm
    tpa/preset/custom/FM_SOUNDS_HOOK_3.itm
    tpa/preset/custom/FM_THEMES_HOOK_3.itm
    tpa/preset/custom/FM_VIDEOS_HOOK_3.itm
    tpa/preset/custom/GAMES_HOOK_3.itm
    tpa/preset/custom/SETT_RINGTONE_HOOK_3.itm

Z520i_CDA102414_1_EMEA_1.zip
  This is a Z520i finalization pack that shipped inside the archive.org dump as an example
  of the format. It is for a different model. Flashing it to a Z550i configures the phone
  with the wrong model identity. Do not.

NO CDA PACK EXISTS FOR R6GA004 OR R6BA033
  Not on any reachable host. That is the hard blocker on flashing those two firmwares
  through XS++/SEtool, on top of the missing MAIN/FS binaries themselves. You would have to
  build a custom pack yourself. See ../../INDEX.md §11.6.

FLASH ORDER — STEP 6 OF THE MAIN SEQUENCE
  1. Drivers installed.
  2. Battery out, battery in, hold C, plug DCU-60.
  3. XS++ 3.1 -> Connect, CID 49 RED.
  4. MAIN = ../Z550_R6CA009_MAIN_GENERIC_RED49.mbn
  5. FS   = ../Z550_R6CA009_FS_RUSSIA_RED49.fbn
  6. CUST = this directory's Z550_CDA102577_8_RUSSIA_extracted/, placed in an
     `own_custpack/` directory next to XS++.exe, with the phone model set to
     `own_custpack`.
  7. Flash (5-10 min), unplug, battery out, battery in, power on.

  Customization goes LAST, after MAIN and FS. Flashing FS forces a customization flash too,
  which is why the order is not negotiable.