wayback/ — se-zone.ru Z550i .vkp patches recovered from web.archive.org
=======================================================================

17 patches came out of web.archive.org, not off the live site. Every file was byte-verified:
it starts with 0x3B (';'), carries a parseable comment header, and its header names the
correct target firmware (`;Z550 SW-R6CA009` or `;Z550 SW-R6GA004`).

    r6ca009/    5 files, 17 133 B    target R6CA009 only
    r6ga004/   12 files, 19 151 B    target R6GA004 only

WAYBACK_MANIFEST.tsv in this directory records, for every recovered file: the Wayback
timestamp used, the original se-zone.ru URL, the byte count and the md5. That is enough to
re-fetch any of them, including the five that were removed (below).

HOW THE FILES WERE FOUND
  The live `patches/download.php?id=NNNN` endpoints all 302 to `/`. But download.php is only a
  wrapper — the site serves the real bytes from a flat, unlinked directory:

      se-zone.ru/patches/download.php?id=1336   ->  se-zone.ru/patches/files/1336.vkp

  The ID in the dead download.php URL IS the filename in `patches/files/`. So the IDs already
  recorded in ../../tools/docs/sezone_GATED_patches_catalogue.txt were enough to construct every
  real path, and the CDX API could be queried for those directly instead of for the dead
  endpoint. A CDX query over the whole `se-zone.ru/patches/*` prefix returned 1 244 captures,
  well under the 4 000 result cap, so the result set is complete.

  Downloads used the raw-bytes `id_` modifier so nothing came back Wayback-rewrapped:

      https://web.archive.org/web/20091002194644id_/http://se-zone.ru:80/patches/files/1336.vkp

  The `id_` is the whole trick. Without it you get a Wayback interstitial, not a usable vkp.
  That is why curl, custom headers, cookies and a real browser session all failed against the
  live site while this worked.

  39 files were downloaded in total across patches and elves; 38 were kept, 1 was rejected —
  a redirect stub, see ../../elfpack/wayback/README.txt.

WHAT RECOVERED, IN BRIEF
  r6ga004/ — the headline result. INDEX.md previously stated that no R6GA004 patch was
  obtainable from any host. These 12 are the first R6GA004 .vkp files for the Z550i recovered
  from anywhere at all. See r6ga004/README.txt for the per-patch list.

  r6ca009/ — 5 genuinely new R6CA009 patches. This directory used to hold 10; see below.

FIVE FILES WERE REMOVED FROM r6ca009/ — THEY WERE NOT NEW PAYLOADS
  Five of the ten files were the same patches already present in ../../, wrapped in se-zone's
  longer disclaimer header, which is why they were the larger files. The offset/payload lines
  were compared line by line before removal:

    0745 vibration_on_start_of_conversation  identical payload, 11 offsets (766 B vs 758 B)
    0747 remove_bluetooth_prompts            identical payload,  1 offset  (241 B vs 261 B)
    0749 heap_shift                          identical payload,  4 offsets (552 B vs 561 B;
                                             se-zone uses +44140000 base-relative offsets
                                             where the kept copy has them expanded)
    1124 remove_voicerecorder_beeps           identical payload,  4 offsets (265 B vs 430 B)
    1336 radio_without_headset               identical payload,  1 offset  (120 B vs 324 B)

  One copy of each is kept, in ../../. Flash that one. Do not flash both — they are the same
  patch, and applying the same patch twice is at best pointless and at worst a corrupted
  filesystem.

  The five that remain here (0987, 0988, 0999, 1024, 1113) are genuinely new; no equivalent
  existed in this archive before the recovery.

THE FIVE THAT REMAIN
    0987  improved player                        IronMaster
    0988  black song colour in the list          IronMaster
    0999  privacy 2.5 fix — 14 010 B, the big password-on-file-manager patch
    1024  win-1251 encoding support              Hussein / IronMaster
    1113  move tpa/preset/system/language -> tpa/user/other/{set,modding}/lng

STILL MISSING — 6 PATCH IDs WITH ZERO CAPTURES ANYWHERE
  Never archived under any URL form, on any host:

    0936  move tpa/system/mp        -> usb/others/mp
    0935  move ifs/settings/camera  -> usb/other/c
    0934  move ifs/settings/acoustic-> usb/other/a
    0933  move /tpa/system/layout   -> usb/other/layout
    0932  move /tpa/preset/system/menu -> /usb/other
    0931  move tpa/preset/system/settings -> usb/other

  Proof they are genuinely absent rather than a query artefact: the CDX prefix query returned
  a complete result set, and neighbouring IDs in the same 920-940 block ARE captured —
  922, 923, 924, 925, 926, 927, 928, 929, 930, 941, 942 — while 931-936 have no capture under
  `patches/files/`, `patches//files/`, with or without `www.`

  Unfortunate detail: those 6 are exactly the R6GA004 folder-redirect patches that move the
  acoustic and camera folders, which is why the R6GA004 acoustics workflow described in
  ../../../INDEX.md §8.D still cannot be built from this set.

FLASH ORDER
  Same as any other .vkp: FAR Manager -> F11 -> jdflasher -> `bflash`, pick the file, Copy,
  tick "as vkp patch", flash, then restore the firmware. Full procedure in ../../../INDEX.md §8.B.

  Flash ../../heap_shift.vkp first if you are stacking several patches.

  The target firmware must match the header. `r6ca009/` patches apply to R6CA009 only;
  `r6ga004/` patches to R6GA004 only. They are not interchangeable and cross-flashing them
  will corrupt the phone.