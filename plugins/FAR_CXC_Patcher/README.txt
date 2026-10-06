FAR_CXC_Patcher/ — the FAR CXC patcher
======================================

5 files, 677 657 B. A FAR Manager plugin by den_po, dated 2012-02-18, for installing and
removing CXC-format patches on a connected phone.

    farcxcplugin_x64/farcxcplugin.dll    64-bit, narrow charset
    farcxcplugin_x86/farcxcplugin.dll    32-bit, narrow charset
    farcxcpatcherW_x64/farcxcplugin.dll  64-bit, wide charset
    farcxcpatcherW_x86/farcxcplugin.dll  32-bit, wide charset
    readme.txt                           upstream's changelog, in Russian

WHY FOUR COPIES
  FAR Manager itself ships in four combinations — 32- and 64-bit, narrow and wide charset —
  because it has to run on every Windows from XP onward. A FAR plugin has to match the host
  build exactly, or it will not load. Four files, one per combination. Pick the one matching
  the FAR you are running; the directory names say which is which.

INSTALL
  Copy the matching farcxcplugin.dll into FAR's Plugins folder. Start FAR, F11, pick the CXC
  patcher.

WHAT IT DOES, IN ONE LINE
  It manages CXC patches — the patch format used by the later "permanent patch" tooling — as
  an install/remove list, reports which patches conflict, and refuses to run on a FAR older
  than 2.0.1160.

WORTH KNOWING FROM THE CHANGELOG
  2012/02/18  fixed bad addresses
  2011/01/21  clearer error messages
  2010/07/01  x64 version
  2010/06/30  shows which patches conflict; attempts to delete the ".." folder; no longer
              crashes on empty patch lists or on an incomplete model line
  2009/10/12  minimum FAR version 2.0.1160
  2009/09/30  ESC key now works in dialogs

  It is the most actively maintained tool in this archive by date, which is worth knowing:
  it is from 2012, seven years newer than the firmware it operates on.

WHAT THIS IS NOT
  This is not the .vkp patcher. The 18 patches in ../../patches/ are .vkp files applied in
  bflash through jdflasher, and this plugin has nothing to do with them. CXC is a different
  format with a different mechanism. Do not mix the two up.

FLASH ORDER
  None. This plugin does not flash firmware. It installs patches on an already-flashed phone
  through FAR's connection, and it can remove them again. Firmware flashing is
  ../tools/README.txt §A.