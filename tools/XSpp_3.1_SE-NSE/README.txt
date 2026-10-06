XSpp_3.1_SE-NSE/ — the second XS++ 3.1 copy
==============================================

1 file, 9 272 320 B.

    XS++.exe    PE32 i386, PECompact2 packed, dated 2007-11-15

WHY TWO COPIES EXIST
  ../XS++_v3.1_operationse.exe is 9 272 832 B, from operationse.github.io/tools.html.
  This one is 9 272 320 B, from SE-NSE.rar. They are 512 bytes apart in size and differ
  throughout — 9 120 847 differing bytes — so they are not the same file with a different
  name.

  Both are XS++ 3.1 for the same platform, both report the same internal date, and both are
  reported by `file` as PECompact2-compressed PE32. The difference is in what the two
  distributions bundled alongside the executable rather than in the flasher itself: the
  SE-NSE copy ships with that collection's own file-selection dialogs and matches the
  tutorials in ../docs_tutorials/, while the operationse copy is what the Operation SE
  download page serves alongside its own documentation.

  Both work. Both are kept so that if one misbehaves on a particular Windows build, the other
  is there.

WHICH TO USE
  Either. Start with ../XS++_v3.1_operationse.exe, since ../docs/ mirrors are from the same
  site and are written against it. If you prefer to follow the SE-NSE tutorials word for
  word, use this copy instead.

WHAT XS++ IS FOR
  XS++ is the main firmware flasher for this phone: MAIN, filesystem, and customization
  pack, in that order. It is not a patcher — for patching you need FAR + jdflasher, see
  ../README.txt.

FLASH ORDER
  1. Install the Gordon's Gate drivers: ../GordonsGateFlashDriver_ggsetup-3.0.0.7.exe or the
     unpacked ../GordonGateDrivers/.
  2. Battery out, battery in.
  3. Hold C.
  4. Plug the DCU-60.
  5. XS++ -> Connect. CID 49 RED.
  6. MAIN = ../../firmware/Z550_R6CA009_MAIN_GENERIC_RED49.mbn
  7. FS   = ../../firmware/Z550_R6CA009_FS_RUSSIA_RED49.fbn
  8. CUST = ../../firmware/custpacks/Z550_CDA102577_8_RUSSIA_extracted/ in an `own_custpack/`
     directory next to XS++.exe, phone model set to `own_custpack`
  9. Flash, 5-10 minutes. Unplug, battery out, battery in, power on.

  Then patches, if you want them: ../README.txt §8.B, heap_shift.vkp first.

VERSION NOTES
  ../XSpp_NOTES.txt covers where 3.1 came from, and what "3.2" actually is — leaked dev
  builds on hosts that no longer exist. For a CID 49 RED Z550i, 3.1 is the correct version:
  everything 3.2 claimed to add was for new-security models and CID 50 loaders, neither of
  which applies here.