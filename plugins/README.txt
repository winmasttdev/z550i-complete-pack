plugins/ — standalone FAR Manager plugins
==========================================

WHAT IS HERE
  sefp2w/            1 976 775 B  SEFP 2 — filesystem read/write for A1 phones
  FAR_CXC_Patcher/     677 657 B  the FAR CXC patcher, four builds

sefp2w/
  sefp2.dll, meflash.dll, English + Russian help and language files.
  This is the plugin that reads and writes the phone filesystem over USB, which is how you
  install acoustic packs, extract files, and back up before doing anything risky.
  Run it from inside FAR Manager (F11 -> sefp2w). Use `bfs` or `ofs` mode for normal file
  work; `efs` is for erase operations.

  meflash.dll here is byte-identical to the copy inside
  ../tools/far_A1_extract/FARManager/Plugins/sefp2w/. Kept in both places on purpose: the
  standalone copy is here so you can drop the plugin into your own FAR install, and the
  tree copy is what the bundled A1 archive ships. See changelog_en.txt / changelog_ru.txt for
  what changed between builds.

FAR_CXC_Patcher/
  farcxcplugin.dll x4 — x86 and x64, wide and narrow FAR builds, because FAR itself ships in
  four bitness/charset combinations and the plugin has to match. Pick the one matching the
  FAR Manager you are running. readme.txt in that directory is upstream's.

FLASH ORDER
  No flashing involved. Both are FAR plugins: install FAR Manager (see ../tools/), drop the
  matching .dll into its Plugins folder, restart FAR, then use F11 to reach them. Order in
  the folder does not matter.