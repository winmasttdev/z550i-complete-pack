drivers_db2010_db2012/ — camera and display drivers, same chipset
================================================================

20 files, 405 662 B. Not acoustics — camera and display drivers for the DB2010/DB2012
platform, the same chipset the Z550i runs on.

CAMERA DRIVERS (Camdrivers/)
  Clara v4.8
  Sarmad 6.1 Camera Driver by Ng LC
  Super Camera Driver for K750 W800 by chengrong
      8.54 for CID36 R1CA021
      8.54 for CID49 Other
      8.54 for CID 49 R2B001
  SUPER FUNCTION v6.2 FINAL by strong
      W800-K750/  CID 36/ and CID 49/ variants, each with Color Auto and Color Corection
      W810/       the W810 variant, same three sub-variants

DISPLAY DRIVERS (Display Drivers/)
  Driver for w810 w800 k750i Unknown Creator
  W200 With K510 Screen = No Sufficient Contrast by fabiode34

THE CID SUBDIRECTORIES ARE THE POINT
  A camera driver is not a generic file — it has to match the phone's CID and firmware
  branch, because the registers and the camera-control code differ. That is why the same
  driver exists in a CID 36 and a CID 49 build, and why "Super Camera Driver for K750 W800"
  has three variants for a phone that is not a K750 or a W800 at all. This is the same
  firmware-pinning logic as the patches: R6CA009 addresses are not R6GA004 addresses.

WHICH ONE FOR A Z550i
  Honestly: none of them, directly. There is no Z550i camera driver in this archive and none
  was ever found — the Z550i-specific camera work that exists is the camera driver collections
  referenced by se-zone.ru patch names, not standalone files.

  What IS here is useful for a different reason: several of these packages ship for CID 49,
  which is the Z550i's CID, and a camdriver is mostly a data file (camdriver0.dat) plus
  small scripts. The tutorial
  ../docs_tutorials/Introduction To Camdriver Modding/ explains the format, and with a CID 49
  driver in hand you can see the structure. Whether it can be adapted is a question the
  tutorial helps you answer.

  SUPER FUNCTION v6.2 is the most substantial of the set. Its INFO.txt credits upstream
  work from Raiderski (supermode) and Kriomag, with the W810 variant based on Kriomag's
  work.

INSTALL
  A camera driver is normally installed as a filesystem operation into the phone's camera
  settings folder, using FAR + SEFP2 (../../plugins/sefp2w/) in `bfs` or `ofs` mode. Back up
  the original driver folder first — a wrong camdriver means no camera at all.

  FLASH ORDER
  Nothing here is flashed in the MAIN/FS sense. Back up the relevant filesystem folder, copy
  the driver in with FAR + SEFP2, reboot. The full flashing sequences are in
  ../../INDEX.md §8; acoustics are the no-flash equivalent, see ../../acoustic/README.txt.