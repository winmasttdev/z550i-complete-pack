elfs/ — 15 verified Z550i .elf binaries
=======================================

INDEX.md previously said no copy of a single Z550i `.elf` was reachable anywhere. These are
them, recovered from the Wayback Machine. All 15 pass `file(1)` as `ELF 32-bit LSB
executable, ARM`. Directory names are the se-zone file ids.

    id  name / title                          author
    86  fscaller.elf — FSCaller               SlaveMaster
    87  volumeplay.elf — VolumePlay v2.2      DuMOH
    89  extopen_v3.elf — ExtOpen v3           SlaveMaster
    90  livebalancelite.elf — LiveBalanceLite v1.1, Kren Mods
    91  callfiltre.elf — CallFilter v0.9      $korp!
    92  dbs.elf — Deception Battery and Signal MODDER-GT
    93  layout_change.elf — Layout_change     Dimmu
    94  findfiles_v0.1fix3.elf — Find Files   MoneyMasteR
    95  grar_v1.1.elf — GRar v1.1             Joker XT / Slawwan
    96  smsview.elf — SMSView                 DuMOHsmol
    97  registryeditor_v1.5.2.elf — RegEdit v1.5.2
    98  fontviewer.elf — FontViewer           Tartes
    100 eventcontrol_993.pkg — EventControl + EvtEdit + EvtDesk (UltraShot, Slaventino).
        A real Elf Installer package, unpacked under
        100_eventcontrol_evtedit_evtdesk/pkg/:
          EventControl.elf  25 616 B
          EvtDesk.elf        5 024 B
          EvtEdit.elf       36 756 B
        plus en.cfg and stop.mp3 from the original package

Each `NN_name/` folder holds the original `pkg.zip` exactly as served, plus the extracted
`.elf`, so you can check the unpack against the original.

APPLICABLE TO BOTH FIRMWARES
  Ids 86-100 appear on both the R6CA009 and the R6GA004 elf listing pages, so these binaries
  apply to either firmware. That is convenient, given R6GA004 firmware is unobtainable.

TWO OF THEM WANT A CONFIG FOLDER TOO
  VolumePlay (87) and ExtOpen (89) ship a `.bcfg` config directory per their own readme.
  Copy that to `ZBin/Config/` as well as the .elf to `ZBin/Daemons/`, or they will start and
  do nothing.

FLASH ORDER AND INSTALL
  Nothing to flash for an .elf. The ElfPack has to be on the phone first:
  1. Flash the main ElfPack vkp, then the library vkp, separately. (../../../../README.txt)
  2. Create Others/ZBin/{Config,DLL,Daemons}/ on the phone.
  3. DYN_CONST.bin -> Config/, LibraryDLL.dll -> DLL/.
  4. The .elf -> Daemons/ to auto-start, or launch it from the file manager.

PERMANENTLY LOST
    ids 71-85 (15 files)   the R6GA004-only elves; no captures at all
    id 88                  no capture of elfs/files/elfs/88.zip

  Ids 71-85 are confirmed from the archived elf listing itself, which links info-71 through
  info-85. Neither 71-85 nor 88 appear anywhere in the complete CDX result set for
  se-zone.ru/elfs/*, while 86, 87 and 89-100 around them are all captured. So 14 of the 30
  catalogued Z550i elves are recovered and 16 are gone for good. The 162-name catalogue is
  in ../../../../tools/docs/sezone_ELF_names_catalogue.txt.