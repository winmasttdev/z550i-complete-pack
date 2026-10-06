_sources/ — the original archives, kept for re-verification
==========================================================

Every extracted file elsewhere in this repository came out of one of these three files.
They are kept so any claim in INDEX.md can be re-checked without re-downloading from a host
that may not exist next year.

  SE_Z550i_archive.org.zip    51 360 434 B   308 files
  SE-NSE.rar                 133 654 951 B   4 304 files
  svn.tar.gz                  22 923 028 B   17 630 entries

SE_Z550i_archive.org.zip — the single richest source in the whole archive
  https://archive.org/download/se-z-550i/SE%20Z550i.zip
  Contributed: the R6CA009 MAIN and FS, the CDA102577_8 customization pack, the Z520i
  finalization pack (as an example), all 18 patches, the SIM-unlock vkp, the main
  Z550_R6CA009.vkp ElfPack, a newer z550_r6ca009.lib.vkp, DYN_CONST.bin, LibraryDLL.dll,
  SETool2 Lite, the 182 REST files, the GDFS sample, the flash drivers, and ssw2rest.

SE-NSE.rar
  https://archive.org/download/se-nse-collection-of-sonyericsson-software/SE-NSE.rar
  Contributed: all 12 acoustic sets, the camera and display drivers, XS++ 3.1, jjPatcher,
  APAP, SEFP2, the FAR CXC Patcher, the FS-extraction tools, SELE, and the 14 .doc tutorials.
  Needs 7z to open — it is a RAR.

svn.tar.gz
  https://archive.perk11.info/svn.tar.gz
  The whole SE/ARM SVN tree. Contributed both .lib.vkp files and all ElfPack and dynconst
  build sources. This is where elfpack/sources_perk11/ and
  tools/elfpack_sources_perk11/ come from.

NOTE ON GITHUB
  SE-NSE.rar is over 90 MB, which is above GitHub's soft per-file limit for repository
  blobs. It is therefore attached to the repository's GitHub Release instead of being
  committed. See ../RELEASE_NOTES.md for exactly which files are release assets and how
  to fetch them.

WHAT IS NOT HERE
  Nothing in this directory came from a live host as of the publication date except
  archive.perk11.info, which still responds. archive.org is the durable one. If you are
  reading this in ten years and the archive.org items are gone, that is the end of the line
  for these files — which is the entire reason this repository exists.