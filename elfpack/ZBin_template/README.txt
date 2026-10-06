ZBin_template/ — the on-phone folder skeleton
=============================================

This is a REFERENCE skeleton, not something you flash. It is the shape `Others/ZBin/` needs
to have on the phone for ElfPack to work.

    Config/DYN_CONST.bin    2 720 B   the dynamic-constant table
    DLL/LibraryDLL.dll      5 392 B   the Library bridge
    Daemons/                 empty    for startup ELF daemons

INSTALL
  1. Flash the main ElfPack vkp first (../Z550_R6CA009.vkp), then a library vkp
     (../z550_r6ca009.lib.vkp). That order is not advisory — nothing works without the main
     one, and the library one must not go first.
  2. Reboot or reseat the battery.
  3. On the phone, under Others/, create a ZBin folder with these three subfolders:
     Config/, DLL/, Daemons/.
  4. Copy DYN_CONST.bin into Config/ and LibraryDLL.dll into DLL/.
  5. Put your .elf files in Daemons/ to have them auto-start, or run them from the file
     manager on demand.

  The Z550i has no memory card, so Daemons/ on internal storage is correct. Phones with
  external storage need Daemons/ on the card.

ALTERNATE DYN_CONST
  ../wayback/elfpack_id5/DYN_CONST.sezone.bin is a different build of the same table, meant
  to be paired with that directory's alternate ElfPack build. Swap, do not layer.

FULL PROCEDURE
  https://operationse.github.io/elfpack.html, mirrored at
  ../../tools/docs/operationse_elfpack.html