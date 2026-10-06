tosharaloud/ — the two loudest ToShaRa acoustic packs
=====================================================

183 files, 789 350 B. Both packs here are ToShaRa's, and both are APF format (.apf/.aec) —
the correct format for DB2010, which is the Z550i's platform.

    Mega_Acoustics_by_ToShaRa/acoustic/                     91 files   379 832 B
    ToShaRa_Mega_Acoustic_v1.6_HighQuality_And_Loudness/   92 files   409 518 B
                                                              (91 + Readme.txt)

WHICH ONE TO INSTALL
  ToShaRa_Mega_Acoustic_v1.6_HighQuality_And_Loudness is the one to start with. ToShaRa's
  own readme in that folder describes it as higher quality, stronger headphone bass, and more
  loudspeaker bass and treble. `Mega_Acoustics_by_ToShaRa` is his earlier set, file dates
  2006-2007.

  The community consensus across the archived threads is that ToShaRa v1.6 and v1.8 are the
  loudest available, with v1.8 reported as the very loudest. v1.8
  (ToShaRa_V1.8_Mega_Acoustic.rar) and the 1.6.8_B1 build only ever existed on hosts that
  are gone — w200style.forumeiros.com's attachment list and iprotebe.cz file36. The names are
  recorded; the bytes are not obtainable. v1.6, the pack in front of you, is the loudest you
  can actually have.

ALSO IN THIS DIRECTORY
  ../db2010_db2012_all/ holds these same two sets plus ten more, inside the full unsorted
  SE-NSE DB2010/DB2012 driver collection. The duplication is deliberate: this directory is
  the short path to the two packs most people want, that one is the whole collection.

INSTALL — NO FLASHING INVOLVED
  These are filesystem files. They replace the audio equaliser tables in ifs/settings/acoustic.

  1. Back up ifs/settings/acoustic FIRST. Use FAR Manager + SEFP 2 (see ../../plugins/sefp2w/),
     in `bfs` or `ofs` mode. A bad pack means no sound at all.
  2. Either: XS++ -> FSX -> "start FSX" -> upload the .apf/.aec files into
     ifs/settings/acoustic.
     Or: copy the whole folder over the phone filesystem with FAR + SEFP2.
  3. Shut down FSX when prompted, unplug, power on.

  On R6GA004 there is a patch that moves ifs/settings/acoustic to usb/other/acoustic so you
  can swap packs over USB without touching the phone filesystem — see
  ../../patches/wayback/r6ga004/README.txt for what exists, and note that the six patches
  which would make that workflow work were never archived.

SIX ZERO-BYTE FILES HERE, AND THEY ARE FINE
  bvhf_hcq-60_{call,play,ring}.apf and vhf_hca-60_{call,play,ring}.apf are 0 bytes. That is
  how they shipped inside SE-NSE.rar — placeholders for headset models the Z550i does not
  have. Not a failed download, not a broken extraction. The same six appear in
  ../db2010_db2012_all/.

FULL BACKGROUND
  ../../acoustic/README.txt explains what an acoustic pack is, which format goes with which
  platform, and the complete set list.