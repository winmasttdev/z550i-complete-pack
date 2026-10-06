Theme_FlashMenu_Connector/ — TinyFlashMenu and the flash-menu connector
=======================================================================

2 files, 809 692 B, in two subdirectories.

    TinyFlashMenu/TinyFlashMenu.exe                    172 032 B
    Flash Menu + Theme Connector/setup.exe            637 660 B

WHAT THIS IS FOR
  A "flash menu" is the boot-time menu on a patched Sony Ericsson: the list that appears when
  the phone starts after a permanent patch, from which you pick what to apply. TinyFlashMenu
  builds that menu. The connector is the bridge that lets a theme and a flash menu be
  packaged together rather than fighting over the same resource slots.

  This is the permanent-patching workflow, which is how the whole 2006-2008 modding scene
  worked on these phones: patch once, and the phone carries the choices at every boot.

THE SECURITY ANGLE, BECAUSE IT COMES UP
  A password-protected flash menu is a real technique from this era — the menu refuses to
  apply anything until a PIN is entered, so a borrowed or resold phone does not hand over a
  modded configuration to whoever plugs in a cable. If that is what you are after,
  ../docs_tutorials/Tutorial How To Make a Flash Menu Password Protected In 5 Steps! is the
  walkthrough, and it is in this archive.

RELATIONSHIP TO THE OTHER TOOLS HERE
  Flash menus are not the same thing as ElfPack. ElfPack patches the running system and takes
  effect on the next boot; a flash menu is a bootloader-stage chooser. They solve different
  problems and you do not need both. For running ELF binaries on this phone, use ElfPack —
  see ../../elfpack/README.txt.

FLASH ORDER
  Neither file is flashed. Both run on a PC and produce content that is then installed.

  1. Run TinyFlashMenu, build the menu, and password-protect it if you want.
  2. Package it with the theme using the connector's setup.
  3. Install the result to the phone via a filesystem write (FAR + SEFP2) or as part of a
     firmware flash, depending on where the menu lives.

  Follow ../docs_tutorials/Tutorial A2 Permanent Patching for the permanent-patching
  mechanics. Note it is written for A2 phones; the Z550i is A1, so check the tool choice
  against ../README.txt before assuming any step transfers.