wayback/ — se-zone.ru binaries recovered from web.archive.org
=============================================================

Everything here came out of the Wayback Machine, not off the live site. Every file was
verified by content, never by HTTP status alone:

  * `.vkp`  -> starts with 0x3B, carries a `;Z550 SW-R6xx…` header
  * `.elf`  -> `ELF 32-bit LSB executable, ARM` per `file(1)`
  * `.zip`/`.pkg` -> passes `unzip -t`, contents listed and inspected individually

Exact Wayback timestamps, original URLs and md5s for every file are in
../../../patches/wayback/WAYBACK_MANIFEST.tsv.

HOW THEY WERE FOUND
  The live `download.php?mode=…&id=NN` endpoints all 302 to `/`. But download.php is a thin
  wrapper — se-zone.ru serves the real bytes from flat, unlinked, guessable paths:

      .../elfs/download.php?mode=elf&ext=zip&id=86  ->  elfs/files/elfs/86.zip
      .../elfs/download.php?mode=elfpack&id=5       ->  elfs/files/elfpacks/5.zip
      .../elfs/download.php?mode=lib&id=52          ->  elfs/files/libs/52.vkp
      .../elfs/download.php?mode=lib&id=53          ->  elfs/files/libs/53.vkp

  The numeric ID in the dead URL IS the real filename. Querying the CDX API for the flat paths
  directly found all four; querying the dead endpoints found nothing. A CDX query over the
  whole `se-zone.ru/elfs/*` prefix returned 514 captures, under the 4 000 result cap, so the
  result set is complete and can be relied on as evidence of absence where it shows absence.

  Downloads used the raw-bytes `id_` modifier — `https://web.archive.org/web/<ts>id_/<url>` —
  so nothing came back HTML-rewritten. That detail is the whole trick: without `id_` you get
  a Wayback interstitial instead of a usable binary.

WHAT IS HERE
  libraries/     123 389 B, 2 files  two more Library .vkp builds, one per firmware
  elfpack_id5/    71 305 B, 3 files  a second independent build of the same ElfPack, plus a
                                  DYN_CONST variant and the zip it came in
  elfs/          628 126 B, 29 files 15 verified ARM 32-bit Z550i .elf binaries
                                  (see elfs/README.txt for the full id/name/author table)

Each of the three directories has its own README with the detail.

LIBRARIES — WHY ALL FOUR BUILDS EXIST
  Three different R6CA009 library builds are now in this archive (60 979 / 61 699 / 63 051 B)
  and two R6GA004 ones (60 971 / 61 690 B). None is a redundant copy. The newer builds resolve
  more function addresses, and the classic symptom of too old a build is elves that start and
  then fail with missing calls. If that happens, try a different one.

ELFPACK_ID5 — A SECOND BUILD OF THE SAME ELFPACK
  Verified to patch the same four offsets (4418449C, 44558AF0, 44B9A204, 4510D974) with
  different replacement bytes, and to carry an identical header. So it is a build variant, not
  a different target. A fallback, not an addition — do not flash both.

ELFS — 15 BINARIES, FIRST COPIES OBTAINABLE FROM ANYWHERE
  INDEX.md previously said no reachable copy of a single Z550i `.elf` existed. Ids 86-100 are
  listed on both the R6CA009 and the R6GA004 elf pages, so these apply to either firmware.
  Each folder keeps the original `pkg.zip` as served, alongside the extracted `.elf`.

REJECTED — id 99 IS NOT A REAL PACKAGE
  `elfs/files/elfs/99.zip` was captured (20130915205626) and is a structurally valid zip, but
  its only payload, `quick-access-menu_v3.0.pkg`, is not a package. It is se-zone.ru's own
  redirect stub page saved under a `.pkg` extension — UTF-16 HTML with
  `<title>Состояние перенаправления</title>`, "redirect state". Not installed.

  It is worth keeping as evidence rather than discarding, which is why it is recorded here:
  it proves the download handler was ALREADY redirecting in 2013, when that capture was
  taken. The gating is not a recent misconfiguration, and it means the Wayback copies of the
  affected files are the only good copies rather than a fresh loss.

STILL MISSING
  elf id 88                    no capture of elfs/files/elfs/88.zip
  elf ids 71-85 (15 files)     no captures at all

  Ids 71-85 are the R6GA004-only elves, confirmed from the archived listing at
  elfs/z550i-r6ga004-2.htm, which links info-71 through info-85. Neither 71-85 nor 88 appears
  anywhere in the complete CDX result set, while 86, 87 and 89-100 around them are all
  captured. So 14 of the 30 catalogued Z550i elves are recovered here and 16 are permanently
  lost.

  There is still no main ElfPack .vkp for R6GA004 anywhere — not on a live host, not in the
  Wayback Machine. Only its .lib.vkp (two builds), its build sources, and the 12 recovered
  R6GA004 patches. See ../../sources_perk11/ for the sources you would build it from.

FLASH ORDER — UNCHANGED FROM ../../README.md
  Main ElfPack vkp first, library vkp second, never reversed. Then on the phone:
  ZBin/Config/DYN_CONST.bin, ZBin/DLL/LibraryDLL.dll, and the .elf files into
  ZBin/Daemons/. The full procedure is in ../../README.md and at
  https://operationse.github.io/elfpack.html