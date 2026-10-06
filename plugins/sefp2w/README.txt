sefp2w/ — SEFP 2 filesystem plugin
==================================

8 files, 1 976 775 B. SEFP 2 is what lets you read and write the phone's filesystem over USB
through FAR Manager. On this phone it is the tool you use for anything that is not a firmware
flash.

    sefp2.dll        the plugin itself
    meflash.dll      the filesystem engine it drives
    changelog_en.txt what changed between builds
    changelog_ru.txt  the same, Russian

HOW IT FITS WITH FAR MANAGER
  FAR Manager is a general phone-management tool with a plugin architecture. SEFP 2 is a
  plugin for it: install it into FAR's Plugins folder, start FAR, press F11, and SEFP 2
  appears in the plugin list. ../tools/far_A1_extract/FARManager/Plugins/sefp2w/ carries a
  byte-identical copy of meflash.dll — kept in both places because this one is here to be
  dropped into your own FAR install, and that one is what the bundled A1 archive ships.

MODES, AND WHICH ONE YOU WANT
  bfs    browse the filesystem
  ofs    operate on the filesystem — copy in, copy out, write
  efs    erase. Destructive. Do not use it unless you mean it.

  Reading a folder is bfs. Installing an acoustic pack is ofs. Everything that changes the
  phone is ofs.

WHAT YOU NEED IT FOR
  Installing acoustic packs — the main use. See ../acoustic/README.txt.
  Backing up ifs/ before doing anything risky. Do this first, always.
  Reading the live filesystem when you want to see what is actually on the phone rather than
  what you think is on it.
  Copying folders around, which is what the R6GA004 folder-move patches are for.

FLASH ORDER
  None. Nothing here is flashed. This is filesystem-level access.

  1. Back up the folder you are about to touch: bfs, select it, copy out over USB.
  2. Install FAR Manager (../tools/FARManager_A1_jdflFAR.7z, or your own build).
  3. Drop sefp2.dll and meflash.dll into FAR's Plugins folder. Match the bitness of the
     plugin to the FAR build you are running.
  4. Start FAR, F11, pick SEFP 2, connect over USB.
  5. ofs mode. Navigate to the target folder. Copy your files in.
  6. Shut down cleanly when prompted. Unplug. Power cycle.

  Order within step 5 matters when you are replacing a folder wholesale: copy to a new name,
  verify, then swap. A half-written filesystem is how phones get bricked without any
  flashing being involved at all.

THE TUTORIAL
  ../tools/docs_tutorials/Tutorial How To Extract Your Phones Filesystem/ covers the backup
  half of this, which is the half worth learning first.