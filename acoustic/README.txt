acoustic/ — sound drivers for the Z550i (DB2010, APF platform)
==============================================================

WHAT AN ACOUSTIC PACK IS
  A set of .apf and .aec files that replace the phone's audio equaliser tables. They go to
  ifs/settings/acoustic on the filesystem — which is the path the R6GA004 patch "move
  ifs/settings/acoustic -> usb/other/acoustic" exists to create, so you can swap packs over
  USB instead of reflash. Install with XS++ in FSX mode, or copy them onto the phone
  filesystem with FAR Manager + SEFP 2 (bfs or ofs mode).

  Format follows the PLATFORM, not the model: .apf/.aec = APF (DB2010: Z550i, W810i, W600i,
  K750i, K790i, K800i), .wbxml = ZAPF, .aat = later platforms. Everything in this directory
  is APF, which is right for this phone.

  Back up the originals first. A bad pack means no sound at all.

WHAT IS HERE
  tosharaloud/              the two loudest ToShaRa packs, 183 files, 789 350 B
    Mega_Acoustics_by_ToShaRa/acoustic/                      91 files, 379 832 B
    ToShaRa_Mega_Acoustic_v1.6_HighQuality_And_Loudness/    92 files, 409 518 B
                                                  <- START HERE, see tosharaloud/README.txt

  db2010_db2012_all/        the whole SE-NSE DB2010/DB2012 collection, 905 files, 4 882 582 B
                              12 acoustic sets, listed in db2010_db2012_all/README.txt

  The two ToShaRa sets appear in both directories. That is deliberate: tosharaloud/ is the
  short path to the two packs most people want, db2010_db2012_all/ is the complete collection.

WHICH ONE IS "LOUDEST"
  ToShaRa's own Readme ranks his releases: v1.5_high_quality_and_Loud added bass and treble in
  the loudspeaker and more MegaBass in headphones; v1.6_high_quality_and_Loudness is the later
  one, with higher quality and stronger headphone bass. Community consensus across the archived
  threads is v1.6/v1.8 as the loudest, with v1.8 reported as the very loudest.

  We have v1.6 in two variants, plus the 91-file "Mega Acoustics by ToShaRa" set with file
  dates 2006-2007. ToShaRa v1.8 (ToShaRa_V1.8_Mega_Acoustic.rar) and the 1.6.8_B1 build only
  ever existed on hosts that are gone — w200style.forumeiros.com's attachment list,
  iprotebe.cz file36. The names are recorded; the bytes are not obtainable anywhere.

  So: v1.6, in tosharaloud/, is the loudest pack you can actually have.

RELATED, SAME PLATFORM, NOT ACOUSTIC
  Equalizer_Patch.vkp was extracted from the Agrakesh set. It is NOT a Z550i patch — its header
  reads `;W810 SW-R4EA031`. It is kept at ../patches/NOT_Z550_do_not_flash/ and should not be
  flashed on this phone. The copy inside db2010_db2012_all/Agrakesh/Equalizer_Patch/ is
  byte-identical; it is left there because that directory is preserved as it shipped.

  ../tools/drivers_db2010_db2012/ holds the same platform's camera and display drivers.

INSTALL — NO FLASHING INVOLVED
  1. Back up ifs/settings/acoustic first. FAR Manager + SEFP 2, `bfs` or `ofs` mode.
  2. XS++ -> FSX -> "start FSX" -> upload the .apf/.aec files to ifs/settings/acoustic.
     Or copy the whole folder onto the filesystem with FAR + SEFP2.
  3. Shut down FSX when prompted. Unplug. Power on.

  On R6GA004 there is a patch that moves the acoustic folder to usb/other/acoustic so you can
  swap packs over USB without touching the phone filesystem — see
  ../patches/wayback/r6ga004/README.txt. Note that the six patches that would make that
  workflow actually work were never archived, so treat it as documented-but-unavailable.

TWO THINGS THAT LOOK LIKE MISTAKES AND ARE NOT

  Six zero-byte files. bvhf_hcq-60_{call,play,ring}.apf and
  vhf_hca-60_{call,play,ring}.apf are 0 bytes. That is how they shipped inside SE-NSE.rar —
  placeholders for headset models the Z550i does not have. Not a failed download, not a
  broken extraction. They appear in both directories, identically.

  Identical bytes under different filenames. Within each pack there are many .apf files whose
  contents are byte-for-byte identical to another file in the same pack. That is correct, and
  it must NOT be cleaned up: the filename is what tells the phone which hardware profile the
  file applies to. Identical bytes under different names are different profiles. This is the
  one place in this archive where apparent duplication is load-bearing.

FLASH ORDER
  None. Acoustics need no flash, no patch, no break mode — just a filesystem copy. That makes
  this the lowest-risk thing in the archive to try first, which is why it is a reasonable
  starting point on a phone you have just restored to stock.