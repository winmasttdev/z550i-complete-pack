GordonGateDrivers/ — USB flash drivers
======================================

30 files, 7 492 688 B. The drivers that let Windows talk to the phone in flash mode over
USB. Install these before any flashing attempt; nothing works without them.

THE INSTALLER — USE THIS FIRST
  ../GordonsGateFlashDriver_ggsetup-3.0.0.7.exe   3 752 913 B
    The current Gordon's Gate flash driver. This is the main link from both lpcwiki and
    operationse. On modern Windows install the x64 variant; x86 only if you are on 32-bit.

  gg-setup_2006.exe                                300 456 B
    The 2006-era installer that shipped inside the SETool2 bundle. Older, kept because it is
    what the 2006-2007 documentation assumed. If 3.0.0.7 misbehaves on your Windows build,
    this is the fallback.

THE UNPACKED TREE — WHAT'S IN IT
  USBFlashDriver_x32/ and USBFlashDriver_x64/
    ggsemc.sys, ggsemc.inf, ggsemc.cat    the flash-interface driver
    x86/ and amd64/                      the matching kernel-mode binaries for each
    WdfCoInstaller01005.dll              Windows Driver Framework co-installer, required
                                         alongside
  FTDI set: ftdibus.inf, ftdibus.sys, ftdibus.cat, FTDIBUS.DLL, FTDIPORT.INF, ftdiport.cat,
    ftser2k.sys, ftserui2.dll, FTCSERCO.DLL, FTDIUN2K.INI, FTDIUNIN.exe, FTLang.dll
    This is the "4-in-1 cable" driver. ONLY needed if you use the 4-in-1 cable. A normal
    DCU-60 does not need it — installing it when you do not have that cable just adds noise
    to Device Manager.
  2176 Release Info.DOC, Описание.txt (Russian), Application Notes.url,
  Installation Guides.url
    Upstream documentation, as shipped.

  Source of the tree: the USBFlashDriver-world66.spcs.bio bundle, which is where both
  lpcwiki and operationse point for these drivers.

DELIBERATE OVERLAP WITH jdflasher
  far_A1_extract/FARManager/Plugins/jdflasher/drivers/ggsemc v2.0.0.1/ carries its own
  copies of ggsemc.sys, ggsemc.inf and ggsemc.cat, byte-identical to the USBFlashDriver_x64
  copies here. Both sets are kept: jdflasher looks in its own folder and does not know about
  this one. Verified identical file-by-file at publication prep.

INSTALL ORDER
  1. Install the driver (3.0.0.7 x64, or the gg-setup_2006.exe fallback).
  2. Battery out, battery in.
  3. Hold C.
  4. Plug the DCU-60 cable. The phone enumerates as a flash device.
  5. Only now start XS++ or FAR and connect.

  The hold-C-before-plug step is not optional. The phone only presents the flash interface
  when C is held during power-up.