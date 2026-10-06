docs/ — local mirrors of the pages this archive was built from
==============================================================

18 files, 518 773 B. Every one of these was fetched and verified live at download time
(2026-10-06) rather than taken on trust. Most of the primary sources for 2006-2008 Sony
Ericsson flashing are dead now, so these mirrors are the working documentation.

THE PROCEDURES YOU ACTUALLY NEED
  operationse_db2010_cid49_patching.html    the one that matters: FAR -> F11 -> jdflasher ->
                                            bflash -> copy the .vkp -> restore firmware.
                                            Screenshots, step by step, CID 49 DB2010.
  operationse_a1_flashing_xs.html           the XS++ flashing walkthrough
  operationse_elfpack.html                  the 3-file ElfPack procedure
  lpcwiki_Flashing_SonyEricsson.html        the main toolchain article. NOTE: jdflasher's
                                            classic host justdanpo.ru is DEAD, DNS does not
                                            resolve, and its Omnius and SETool2 links point
                                            at MEGA and Google Drive and return API error -15.
  operationse_tools.html                   source of every Operation SE binary in ..
  operationse_download_links.html          ditto
  operationse_a1_index.html                the A1 landing page

SE-ZONE.RU CATALOGUES — WHY THESE ARE HERE
  The live site still serves its listing pages (HTTP 200) but every download.php and .zip.htm
  URL 302s to /. These are the captures of the listings, plus transcripts of what was behind
  the dead endpoints:

  sezone_z550i_flash_index.html            the Z550i firmware listing. Its three download
                                            rows are the files recorded as permanently
                                            unrecoverable in ../../firmware/wayback/README.txt
  sezone_patches_z550i_R6CA009_p1.html     the R6CA009 patch catalogue
  sezone_patches_z550i_R6GA004_p1.html     the R6GA004 patch catalogue, page 1
  sezone_patches_z550i_R6GA004_p2.html     ditto, page 2
  sezone_elfs_z550i_R6CA009_p1.html        the R6CA009 elf catalogue
  sezone_elfs_z550i_R6GA004_p1.html        the R6GA004 elf catalogue — this is what proves
                                            elf ids 71-85 exist as R6GA004-only entries
  sezone_GATED_patches_catalogue.txt       all 28 Z550i patches by name + gated URL
  sezone_GATED_elfs_catalogue.txt          elf/ElfPack endpoints + what substitutes exist
  sezone_ELF_names_catalogue.txt           162 Z550i elf names, by firmware
  sezone_GATED_download_urls.txt           the ElfPack/Library endpoint list

  These catalogue .txt files are what made the Wayback recovery possible: the numeric IDs in
  the dead download.php URLs are the real filenames behind them, so a direct CDX query per ID
  finds captures that querying the dead endpoint never would.

IPROTEBE.CZ
  iprotebe_z550_r6ga004_patch_files_section576.html
    The section-576 listing: 41 R6GA004 patch names. Every download behind them is gated.
    Section 577 returns HTTP 401 and every download page needs a login form
    (`form.php?pid=...`, Czech "Příhlášení"). The listing was fetchable, hence the mirror.
    Note it contains one third party's public contact details as published on that page; left
    verbatim because it is a mirror, and it is a 20-year-old public listing address, not
    anything belonging to the archiver.

HOW THE WAYBACK RECOVERY USED THESE
  See ../../patches/wayback/README.txt for the mechanism, and ../../INDEX.md §11.7 for the
  exact CDX queries and the `id_` raw-bytes trick that avoids Wayback's HTML rewriting.