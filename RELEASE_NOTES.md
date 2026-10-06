# Release Notes — v1.0.0

**Date:** 2026-10-06
**Tag:** v1.0.0

## What's in this release

The complete Sony Ericsson Z550i preservation archive, organized and
verified from live sources and the Wayback Machine.

### Highlights

- **Fully flashable R6CA009 CID49 RED stack** — MAIN (.mbn), FS (.fbn),
  CDA customization pack, and 182 REST files
- **19 flashable .vkp patches** for R6CA009 + 1 SIM-unlock patch
- **12 R6GA004 patches** recovered from the Wayback Machine — the only
  ones obtainable from any host
- **15 ARM .elf binaries** recovered from the Wayback Machine
- **ElfPack v1.999** main + Library for R6CA009, Library for R6GA004
- **All major flashing tools** — XS++ 3.1, SETool2 Lite, FAR/jdflasher,
  SEFP2, GordonsGate drivers
- **Loudest obtainable acoustic packs** — ToShaRa Mega Acoustic v1.6
- **Complete documentation** — INDEX.md with flash orders, verification
  notes, and a detailed Wayback recovery log

### Files over 90 MB

`_sources/SE-NSE.rar` (128 MB) is attached as a **release asset** rather
than a git blob, to keep the repository clone manageable.

### Verification

- Every download preceded by HTTP HEAD check
- MD5 cross-checks between independent sources for R6CA009 MAIN and FS
- All .vkp files have parseable headers decoded in `patches/PATCH_HEADERS.txt`
- All .elf binaries verified as ARM 32-bit ELF
- Zero-byte sweep run; only known upstream placeholders found
- SHA256 checksums for all files in `SHA256SUMS.txt`

### Known gaps

- R6GA004 and R6BA033 MAIN/FS firmware binaries — not on any live host
- 16 of 30 catalogued Z550i .elf binaries — never archived
- 6 se-zone R6GA004 folder-redirect patches — never archived
- ToShaRa v1.8 / 1.6.8_B1 — hosts dead

See INDEX.md §9 and §11 for full details.
