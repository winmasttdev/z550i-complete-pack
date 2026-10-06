r6ga004/ — 12 patches recovered from the Wayback Machine
========================================================

THE HEADLINE RESULT OF THE WHOLE ARCHIVE
  Before this recovery, this repository contained zero R6GA004 patches and INDEX.md stated
  that none were obtainable from any host. These 12 are the first R6GA004 `.vkp` files for
  the Z550i recovered from anywhere at all.

  All twelve declare `;Z550 SW-R6GA004`. They apply to R6GA004 ONLY. None of the 18 patches
  in ../../ works on this firmware — the binary differs. Keep the two sets strictly apart;
  cross-flashing corrupts the phone.

    0723  SMS melody duration on incoming SMS        svinuk / sunfire7
    0725  remove the "accept file?" BT prompt        the_laser / sunfire7
    0726  radio works with no headset                SiNgle / sunfire7
    0922  remove the "silent mode ON" message        SiNgle / YAR / Mobilefree
    0923  camera works while Java runs               SiNgle / Sunfire7
    0924  headset control of the player              SiNgle / m1ch43lzm
    0925  faster scrolling of long filenames         SiNgle / stuCk
    0926  fast rewind of long mp3 / video            SiNgle
    0927  no SIM wizard after a SIM change           SiNgle
    0928  stock EQ settings replaced with Mega Bass  Adow
    0929  right softkey remapped to Media Player     nkls
    0930  font 60 in sleep mode                      IronMaster

  Sizes range from 181 B to 14 913 B. Total 19 151 B across 12 files.

THE CATCH: NO FIRMWARE TO FLASH THEM ONTO
  The R6GA004 MAIN and filesystem images do not exist on any reachable host and were never
  archived by the Wayback Machine either. The patch set is complete and verified; the three
  firmware binaries it targets are not. See ../../../../INDEX.md §11.6.

FLASH ORDER
  Identical mechanism to any vkp: FAR Manager -> F11 -> jdflasher -> bflash -> pick the
  file -> Copy -> tick "as vkp patch" -> flash -> restore firmware -> reboot. Full procedure
  in ../../../../INDEX.md §8.B.

  Since you cannot obtain R6GA004 firmware, these files are currently reference material:
  they document what the R6GA004 patch scene contained, and they are the offsets you would
  need if you ever obtain the firmware or build it from a dump.

  No heap_shift.vkp in this firmware's set exists. If you stack several, be aware that the
  R6CA009 heap_shift patch's own header says its address range is firmware-version
  dependent — do not assume the R6CA009 one is valid here.