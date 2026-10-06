se-zone.ru Z550i FIRMWARE — NOT RECOVERABLE
===========================================

This directory is intentionally empty of binaries.

The Wayback Machine has **zero captures** of any se-zone.ru Z550i firmware file. What
was searched, all against the CDX API with a complete (uncapped) result set:

  1. `se-zone.ru/flash/*`  — 96 captures, complete.
     `flash/z550i.htm` IS captured (20070714044357) and is mirrored at
     `../../tools/docs/sezone_z550i_flash_index.html`. Its three download rows point at:

         /flash/z550i/Z550_R6CA009_MAIN_GENERIC_RED49.zip.htm
         /flash/z550i/Z550_R6CA009_FS_RUSSIA_RED49.zip.htm
         /flash/z550i/Z550_CDA102577_8_RUSSIA.zip.htm

     None of those three `.zip.htm` pages has a capture. Neither does any URL under
     `/flash/files/z550i/`.

  2. `se-zone.ru/flash/files/*` — only nine files have ever been archived, and all of
     them belong to other phones: K750i x3, K800i x1, W800i x2, W810i x3. No z550i.

  3. `download.php` firmware IDs — same story as the patches: the handler is dead and no
     capture of the underlying `flash/files/…` path exists.

So the archive holds the se-zone.ru *catalogue* for Z550i firmware but none of the bytes.

Why it does not matter much
---------------------------
Everything se-zone.ru listed for Z550i firmware is already in `../`, from two independent
sources that were md5 cross-checked:

  MAIN GENERIC RED49  22 106 080 B  firmware.center  AND  archive.org se-z-550i,
                                byte-identical to each other (md5 c32b81b1…)
  FS RUSSIA RED49      8 663 008 B  firmware.center  AND  archive.org se-z-550i,
                                byte-identical to each other (md5 3e7a1949…)
  CDA102577_8 R2A         9 467 B  firmware.center — the same CDA/R2A pack se-zone listed

The se-zone R2A finalization zip is likewise a `Z550_CDA102577_8_RUSSIA.zip` equivalent,
already held at `../Z550_CDA102577_8_RUSSIA.zip`.

What is still genuinely absent, and not a se-zone problem
--------------------------------------------------------
  * R6GA004 MAIN + FS + CDA  — no live host anywhere, see INDEX.md §9
  * R6BA033 MAIN + FS + CDA  — same; its five REST files are in `../rest/`
  * Any CDA pack for R6GA004 or R6BA033 — does not exist on any reachable host

For the R6GA004 branch this repo now has the patch set and the library (see
`../../elfpack/wayback/` and `../../patches/wayback/r6ga004/`) but still no MAIN, no FS
and no customisation pack. That is the remaining hard blocker on an R6GA004 flash, and
no archive on earth appears to hold it.