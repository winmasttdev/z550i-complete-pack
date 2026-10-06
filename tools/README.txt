tools/ — flashers, drivers, patch/FS tooling and documentation
===============================================================

FLASHERS — which one you need
  XS++_v3.1_operationse.exe      9 272 832 B  XS++ 3.1, PE32 PECompact2. This is the
                                               main firmware flasher for CID 49 RED.
                                               Notes incl. the XS++ 3.2 situation: XSpp_NOTES.txt
  XSpp_3.1_SE-NSE/XS++.exe       9 272 320 B  NOT a duplicate — 512 B smaller, different
                                               sha256. A second, independently packaged copy
                                               from SE-NSE.rar. Both work; both are kept.
  setool2lite.exe                4 273 664 B  SEtool2 Lite, 2007-08-31. Notes: SETOOL2_LITE_NOTES.txt
  FARManager_A1_jdflFAR.7z      20 194 832 B  FAR Manager 32-bit WITH jdflasher and SEFP2
                                               already bundled. THIS is the package you want
                                               for break-mode patching.
  FARManager_A2.7z              19 011 337 B  FAR Manager for A2 phones. NOT for the Z550i
                                               (which is A1). Included for completeness.
  far_A1_extract/                87 890 822 B  the A1 archive unzipped, for inspection.
                                               jdflasher/ is where the real work happens —
                                               see JDFLAR_PLUGIN_NOTES.txt.
  qamaker.exe                       29 210 B  MAIN .mbn -> quick-access .vkp
  SIMLockPatchGen.exe              278 528 B  carrier-lock patch generator
  a2uploader.exe                 1 781 248 B  A2-platform flasher. NOT for the Z550i.
  1-Patcher.jar, bpatch.exe,               jjPatcher — GUI patch builder
    customize_upgrade.xml

jdflasher — the path you need for break mode
  tools/far_A1_extract/FARManager/Plugins/jdflasher/
    2010_49/DB2010cid49Red.hdr      USE THIS HEADER. DB2010 = Z550i/W810i chipset,
                                    CID49 RED = retail. The "Brown" CID49 header is the
                                    developer unit, not what a retail phone presents as.
    2010_49/K510_Z530_Z550.ose      the flashing profile for the Z550i
    bin/                            62 loaders, incl. DB2010_FLASHLOADER_R2A003.2010_49_RED
    scripts/                        XML profiles: db2012.xml, Pach_DB2012_CID52.xml, ...
    rest/                           182 rest files (superset of ../firmware/rest/)
    make_rest/                      ssw2rest
  Plus Plugins/sefp2w/ (SEFP 2, filesystem read/write on A1) and Plugins/make_rest/.
  Full writeup: JDFLAR_PLUGIN_NOTES.txt

DRIVERS
  GordonsGateFlashDriver_ggsetup-3.0.0.7.exe  3 752 913 B  the main link, from both lpcwiki
                                                          and operationse
  GordonGateDrivers/                            7 492 688 B  unpacked ggsemc/ggflt .sys + .inf
                                                          + .cat, x86 and x64, from
                                                          USBFlashDriver-world66.spcs.bio,
                                                          plus WdfCoInstaller01005.dll each
  GordonGateDrivers/gg-setup_2006.exe             300 456 B  the 2006-era installer, from the
                                                          SETool2 bundle
  GordonGateDrivers/                            ~350 KB      the FTDI "4-in-1 cable" set
                                                          (ftdibus.inf, ftser2k.sys, ...).
                                                          Only for the 4-in-1 cable, NOT for a
                                                          normal DCU-60.
  jdflasher also ships its own copies under jdflasher/drivers/ (ggsemc v2.0.0.1, epiusb
  v1.0.0.0). Those overlap with GordonGateDrivers/ — same bytes, different location — and
  both are kept because the tools look in their own paths.

PATCH / PORTING / FS TOOLING
  APAP/                            Advanced Patch Porting: APAP_Beta.exe + libs + langs
  Extract_FS_tools/                SEFStool4.exe, main2raw.exe, CodeClaw DB3210 CID53
                                   File Xtractor 2.0
  SE_Layout_Editor/                Sony Ericsson Layout Editor (SELE) + Layouts
  Theme_FlashMenu_Connector/       TinyFlashMenu + flash-menu/theme connector
  BleEditor.exe                    BLE editor
  elfpack_sources_perk11/          4 333 263 B  full ElfPack + dynconst source trees,
                                   .svn history stripped. Overlaps ../elfpack/sources_perk11/
                                   (6 files, 13 369 B) which is the Z550-only subset.
  drivers_db2010_db2012/           same-platform camera drivers (Clara v4.8, Sarmad 6.1,
                                   SUPER FUNCTION v6.2, SUPER Camera Driver) + 2 display packs

DOCS — local mirrors, all live-verified at download time
  docs/lpcwiki_Flashing_SonyEricsson.html      the main toolchain article
  docs/operationse_db2010_cid49_patching.html   the procedure that matters: FAR -> F11 ->
                                               jdflasher -> bflash -> copy .vkp -> restore
  docs/operationse_a1_flashing_xs.html         XS++ flashing walkthrough
  docs/operationse_elfpack.html                the 3-file ElfPack procedure
  docs/operationse_tools.html                  source of every Operation SE binary above
  docs/operationse_download_links.html         ditto
  docs_tutorials/                              36 files, 14 .doc tutorials from SE-NSE:
                                               XS++ 3.1 usage, jjPatcher, ElfPack install,
                                               FS/MAIN extraction, SE Image Tool, camdriver
                                               modding, A2 permanent patching, password-
                                               protecting a flash menu, and more. THE
                                               RELEVANT PAIR is "Tutorial Elfpack
                                               installation" + "Tutorial General Usage -
                                               XS++ v3.1".
  docs/sezone_GATED_patches_catalogue.txt      all 28 se-zone.ru Z550i patches by name
  docs/sezone_GATED_elfs_catalogue.txt         elf/ElfPack endpoints + what substitutes exist
  docs/sezone_ELF_names_catalogue.txt          162 Z550i elf names, by firmware
  docs/sezone_GATED_download_urls.txt          the ElfPack/Library endpoint list
  docs/iprotebe_z550_r6ga004_patch_files_section576.html
                                               iProTebe.cz listing: 41 R6GA004 patch names,
                                               all downloads gated
  docs/sezone_*.html, docs/sezone_z550i_flash_index.html   the original listing pages

PER-TOOL NOTES
  XSpp_NOTES.txt  SETOOL2_LITE_NOTES.txt  OMNIUS_NOTES.txt  JDFLAR_PLUGIN_NOTES.txt
  cover each tool's version, provenance and gotchas.

FLASH ORDER, SHORT VERSION
  Full sequences are in ../INDEX.md §8. In one line: install drivers -> flash MAIN, FS, CUST
  from ../firmware/ -> then patches (heap_shift first) or ElfPack (main vkp, then library vkp)
  in bflash -> restore firmware -> reboot. Acoustics need no flash at all, just a filesystem
  copy; see ../acoustic/README.txt.

DEAD HOSTS, SO YOU DO NOT RE-TRY THEM
  justdanpo.ru (jdflasher's classic host) — DNS does not resolve
  kaijousuru.com, archives.kaijousuru.com (Omnius) — DNS does not resolve
  MEGA.nz / Google-Drive handles in lpcwiki — API error -15
  gsmforum.ru — connection failure
  patches.kibab.com — reachable, but Siemens only, no SE content
  rapidshare.com — the links are gone
  Full detail in OMNIUS_NOTES.txt. Not needed anyway: XS++ + SETool2 Lite + FAR/jdflasher
  between them cover every operation this archive supports.