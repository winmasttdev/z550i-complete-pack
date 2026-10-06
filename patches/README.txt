patches/ — .vkp patches, SIM unlock, and patch-writing references
===============================================================

LAYOUT
  *.vkp (18 files at top level)   flashable, ALL target R6CA009
  simlock/                        carrier-lock removal vkp
  NOT_Z550_do_not_flash/          a W810i patch, kept as a format example only
  wayback/r6ca009/                5 patches recovered from the Wayback Machine, R6CA009
  wayback/r6ga004/               12 patches recovered from the Wayback Machine, R6GA004
  PATCH_HEADERS.txt               every header in this tree, decoded, target firmware noted
  farid1991_patch-se/             upstream patch-project clone (reference material)

THE 18 TOP-LEVEL PATCHES ARE ALL R6CA009-ONLY
  Every one carries `;Z550 SW-R6CA009` in its header. The binary under R6CA009 is not
  bit-compatible with R6GA004, so not one of these will apply there — different addresses,
  different code. The `wayback/r6ga004/` set is the only R6GA004 patch set for this phone
  that exists anywhere. Keep the two sets strictly apart; cross-flashing corrupts the phone.

  Start with heap_shift.vkp when stacking several patches: it moves the patch window, and
  several of the others note that they want it. It also warns in its own comment that its
  address range is firmware-version dependent.

WHAT EACH ONE DOES
  heap_shift.vkp                              move the patch window (flash FIRST)
  system_fs_in_file_manager.vkp              file-manager 4th tab: tpa/system/smsdata/card/
                                              usb/ifs, copy+move, protected files unlocked.
                                              The most useful patch in the set.
  bluetooth_transfer_minimize.vkp            minimise the BT file-transfer window
  display_brightness_extended_range.vkp      brightness 10-100% instead of the stock range
  vibration_on_start_of_conversation.vkp     vibrate on incoming call
  illumination_reduction.vkp                 keyboard illumination -20%, off at 50%
  radio_without_headset.vkp                  radio works with no headset attached
  change_java_folder.vkp                     java folder -> usb/other/java
                                              DELETE ALL GAMES/ APPS FIRST
  remove_voicerecorder_beeps.vkp             drop the voice-recorder beep
  vibration_on_menu_open.vkp                 vibrate when entering the menu
  remove_bluetooth_prompts.vkp               kill the "accept file? (yes/no)" BT prompt
  rename_file_extension.vkp                  rename dialog shows the extension
  display_file_extension.vkp                 file list shows extensions
  photo_while_java_is_running.vkp            camera works with Java running in background
  time_and_data_instead_of_carrier_logo.vkp  clock in the top bar, not the carrier logo
  remove_camera_shutter_sound.vkp            silent shutter
  disable_java_permissions.vkp               ignore Java security prompts
  fix_activity_menu_bug.vkp                  square artifact behind "New events" in Activity

FLASH ORDER
  1. Flash firmware first (see ../firmware/README.txt §flash order). Patches assume stock
     R6CA009 is already on the phone.
  2. heap_shift.vkp
  3. any of the other 17, in any order
  4. reboot, battery out/in

  Mechanism, because the vkp format itself is not self-explanatory: FAR Manager (32-bit —
  use a 32-bit VM on modern Windows) -> F11 -> jdflasher -> header
  tools/far_A1_extract/FARManager/Plugins/jdflasher/2010_49/DB2010cid49Red.hdr, profile
  K510_Z530_Z550.ose, DCU-60. Then "jump down into a large rabbit hole", battery out/in,
  replug while holding C. Choose **bflash** (not oflash) — it writes a deliberately broken
  bootloader so the flasher can write into it. Reseat battery, replug holding C, and you
  land in a memory pane. F5 -> pick the .vkp -> Copy -> tick "as vkp patch" -> "yeah, flash
  it". Tick "remove patch" to undo a single one. Then go up two levels -> yes -> "restore
  firmware: YES" to put the real bootloader back. Battery out/in, power on.

  If you skip step 6's "restore firmware", the phone stays in break mode. Do not stop there.

simlock/Remove_SIM_lock_Z550_R6CA009_GENERIC.vkp
  Header `;Z550 SW-R6CA009-GENERIC`, IronMaster, built with SIMLock patch generator v2.2.
  Flashes as-is, no preparation. But it needs the quick-access patch first: drop
  tools/qamaker.exe on firmware/Z550_R6CA009_MAIN_GENERIC_RED49.mbn, it emits a .vkp,
  flash that in bflash, then flash this file.

wayback/
  Recovered from web.archive.org after the live se-zone.ru download handler turned out to
  302 everything to /. See wayback/README.txt for the mechanism and the exact timestamps,
  and ../INDEX.md §11 for the full recovery log.

  wayback/r6ca009/ used to hold 10 files. Five of them (0745, 0747, 0749, 1124, 1336)
  carried no new payload: they were the same patches already present here at the top level,
  wrapped in se-zone's longer disclaimer header, which is why they were bigger. Their
  offset/payload lines were verified identical before removal (0749 differs only in using
  +44140000 base-relative offsets where this copy has them expanded to absolute). One copy
  of each is kept here. The five genuinely new ones remain in wayback/r6ca009/.

NOT_Z550_do_not_flash/
  Equalizer_Patch_W810_R4EA031.vkp — header reads `;W810 SW-R4EA031`. Wrong offsets for
  the Z550i entirely. Kept only as an example of vkp structure.

farid1991_patch-se/
  Shallow clone of https://github.com/farid1991/patch-se — ~50 patch projects with full IAR
  sources, Target/, xcl/ and a README each. Verified against the full tree: ZERO Z550 or
  DB2010 content, no path matches `z550`. It is the best available reference for the vkp
  format and the elf2vkp toolchain, not a Z550i resource. The upstream .git/ directory was
  stripped before publication; see CLONE_METADATA.txt in that directory.