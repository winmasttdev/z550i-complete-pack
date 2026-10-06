db2010_db2012_all/ — the full SE-NSE DB2010/DB2012 driver collection
=====================================================================

905 files, 4 882 582 B. Twelve acoustic sets, plus the camera and display drivers for the
same chipset. This is the whole collection as it shipped inside SE-NSE.rar, unsorted.

ACOUSTIC SETS (all APF format, correct for DB2010)
    Mega Acoustics by ToShaRa                            the 91-file set, dates 2006-2007
    ToShaRa Mega Acoustic v1.6 High Quality And Loudness  <- the one named "loudest"
    Agrakesh                    three mixes (v1, v2, v3) + an Equalizer_Patch (see warning)
    Bizzaro™ ApF Acoustic       SE_NSE_ACOUSTIC_MIXT APF v2
    Ex Audio v1.3 by patrick
    EXtreme Power™ W200 Edition by mid_extreme
    SmellULater Quality Pack for W800/W810 etc.           not W300 compatible, per its own name
    Thunder by hyper_t
    Ultra Acoustics for W810/W810i by SmellULater
    uLtRa BaSs V3.0 by SANAL47                             ships a Procedure.txt — read it
    XSound CyberBass by Ng LC
    XSound Nex by Ng LC

DUPLICATION IS DELIBERATE
  The two ToShaRa sets also appear in ../tosharaloud/. That is intentional: ../tosharaloud/ is
  the short path to the two packs most people want, this directory is the complete collection.
  Within individual packs there is also a lot of apparent duplication — the same .apf bytes
  under several filenames for different headset profiles. That is correct and must NOT be
  cleaned up: the filename is what tells the phone which hardware profile a file applies to.
  Identical bytes under different names are different profiles.

WARNING — THE Equalizer_Patch IN THE AGRAKESH SET
  Agrakesh/Equalizer_Patch/Equalizer_Patch.vkp is NOT a Z550i patch. Its header reads
  `;W810 SW-R4EA031` — wrong model, wrong firmware. It is byte-identical to the copy now kept
  at ../../patches/NOT_Z550_do_not_flash/Equalizer_Patch_W810_R4EA031.vkp, which is where it
  should be. Left in place here because this directory is preserved as it shipped.

CAMERA AND DISPLAY DRIVERS
  Not in this directory — they are at ../../tools/drivers_db2010_db2012/. Same platform:
  Clara v4.8, Sarmad 6.1, SUPER FUNCTION v6.2, SUPER Camera Driver for K750/W800, plus two
  display packs.

INSTALL — IDENTICAL TO ../tosharaloud/
  1. Back up ifs/settings/acoustic first (FAR + SEFP 2, bfs or ofs mode).
  2. XS++ -> FSX -> "start FSX" -> upload the .apf/.aec files, or copy the folder over the
     filesystem with FAR + SEFP2.
  3. Shut down FSX when prompted, unplug, power on.
  No flash, no patch, no restart beyond the power cycle.

SIX ZERO-BYTE FILES PER TOsharaloud SET
  bvhf_hcq-60_{call,play,ring}.apf and vhf_hca-60_{call,play,ring}.apf are 0 bytes, in both
  this directory and ../tosharaloud/. Upstream placeholders for headset models the Z550i does
  not have. Not a bad download.

FULL BACKGROUND
  ../README.txt