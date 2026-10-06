far_A1_extract/ — FAR Manager A1 archive, unzipped for inspection
=================================================================

316 files, 87 890 822 B. This is the contents of ../FARManager_A1_jdflFAR.7z (20 194 832 B)
extracted, kept unpacked because the interesting parts are buried and searching an archive
for them is miserable. The 7z is kept alongside so you can get a clean copy if this tree is
ever damaged.

    FARManager/Plugins/jdflasher/     the flashing plugin — this is what you need
    FARManager/Plugins/sefp2w/        SEFP 2, filesystem read/write
    FARManager/Plugins/make_rest/     ssw2rest

jdflasher/ — READ THIS ONE
  2010_49/DB2010cid49Red.hdr      USE THIS HEADER. DB2010 is the Z550i/W810i chipset,
                                  CID 49 RED is retail. The DB2010 CID49 *Brown* header is
                                  the developer unit — wrong for a retail phone.
  2010_49/K510_Z530_Z550.ose      the flashing profile for the Z550i
  2020_52/                        DB2020 (W980-class) profiles, not this phone. Also the
                                  source of the single largest file in the tree, a 26 752 048 B
                                  `part4` blob belonging to the 2020_52 flash data.
  bin/                            62 flash loaders, including
                                  DB2010_FLASHLOADER_R2A003.2010_49_RED
  scripts/                        XML flashing profiles: db2012.xml, db2020.xml,
                                  Pach_DB2012_CID52.xml, DB2012_Pach_CID53.xml, and the
                                  z550.xml / k510.xml family
  rest/                           182 REST files — the full superset. The 9 Z550-relevant
                                  ones here are byte-identical to ../../firmware/rest/
  drivers/                        jdflasher's own copies: ggsemc v2.0.0.1 (x86 + amd64),
                                  epiusb v1.0.0.0. These overlap with
                                  ../GordonGateDrivers/ — same bytes, different location.
  make_rest/                      ssw2rest, same file as ../../firmware/rest/ssw2rest.exe

  The ggsemc.sys / .inf / .cat under jdflasher/drivers/ggsemc v2.0.0.1/x86 and /amd64 are
  byte-identical to ../GordonGateDrivers/USBFlashDriver_x64/{x86,amd64}/ and
  ../GordonGateDrivers/USBFlashDriver_x64/ggsemc.{sys,inf,cat}. Both copies are kept because
  each tool looks in its own directory and neither knows about the other.

THE 85 MB, EXPLAINED
  Most of this tree's bulk is the 2020_52 flash data (a 26 MB part4 blob) and the loader
  bank, which is why it dwarfs the 20 MB archive it came from. Nothing here is a duplicate
  of anything outside this tree except as noted.

FULL DETAIL
  ../JDFLAR_PLUGIN_NOTES.txt — the long version, with the break-mode procedure, the header
  and profile choices, and the gotchas.

FLASH ORDER
  Nothing in this directory is flashed directly. You point FAR Manager at the header and
  profile here, and FAR then drives jdflasher to flash MAIN, FS and CUST from
  ../../firmware/. Patches and ElfPack go through the same plugin's bflash mode afterwards.
  Full sequences in ../../INDEX.md §8.