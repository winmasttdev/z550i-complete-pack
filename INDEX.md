# Sony Ericsson Z550i (DB2010 / A100-A1 platform, CID 49 RED) — download manifest

Everything here was fetched and byte-verified on 2026-10-06 on this Arch Linux box.
**Total 461 MB across 3 372 files.** Nothing exceeds 2 GB. By section:
`_sources/` 199 MB · `tools/` 172 MB (85 MB of that is the unzipped jdflasher/FAR plugin
tree) · `firmware/` 53 MB · `patches/` 26 MB · `acoustic/` 9.1 MB · `plugins/` 2.6 MB ·
`elfpack/` 1.1 MB. The two archive.org source dumps are the bulk of the weight.

Layout: `firmware/` `patches/` `elfpack/` `tools/` `plugins/` `acoustic/` `_sources/`.

> **Updated later the same day — see §11.** The Wayback recovery added 863 KB across 60
> files under `patches/wayback/`, `elfpack/wayback/` and `firmware/wayback/`. Two of the
> old "not obtainable anywhere" claims in §4 and §9 are now wrong in the good way:
> **there are now 12 R6GA004 patches and 15 real Z550i `.elf` binaries.**
> `firmware/wayback/` is a documented dead end — it contains no binaries, only a
> README recording that se-zone.ru's Z550i firmware was never archived.

---

## 1. Quick facts you need before flashing

- **Platform A100 / A1.** Z550i is DB2010. A100 firmwares are always **three** files: MAIN
  (`.mbn`), filesystem (`.fbn`), and a customization/finalization pack. Flash all three or
  you brick. Flashing FS forces a CDA/customization flash too.
- **CID 49 RED** is a normal retail phone. Pick that in every tool; do not use the
  DB2010 CID49 **Brown** header, that is the developer unit.
- **Two usable firmware branches:** R6CA009 (2006, fully re-modded here) and R6GA004 (2008,
  patch set exists but is gated, see §6). R6BA033 is real and its REST files ship, but the
  MAIN/FS pair is not on any live host.
- MAIN/FS files carry the `babe 0003` header — that magic is confirmed on every `.mbn`/`.fbn`
  below.

---

## 2. `firmware/` — MAIN + FS + custom packs  (53 MB, 25 files)

### R6CA009 CID 49 RED — the complete, flashable set

| File | Bytes | Source |
|---|---|---|
| `Z550_R6CA009_MAIN_GENERIC_RED49.mbn` | 22 106 080 | https://firmware.center/firmware/Sony-Ericsson/Z550/CID%2049%20RED/Z550_R6CA009_MAIN_GENERIC_RED49.mbn |
| `Z550_R6CA009_MAIN_GENERIC_ML_RED49.mbn` | 22 106 080 | https://archive.org/download/se-z-550i/SE%20Z550i.zip → `firmware R6CA009/` |
| `Z550_R6CA009_FS_RUSSIA_RED49.fbn` | 8 663 008 | https://firmware.center/firmware/Sony-Ericsson/Z550/CID%2049%20RED/Z550_R6CA009_FS_RUSSIA_RED49.fbn (identical copy in the archive.org zip, same MD5) |
| `Z550_CDA102577_8_RUSSIA.zip` | 9 467 | https://firmware.center/firmware/Sony-Ericsson/Z550/Z550_CDA102577_8_RUSSIA.zip |
| `custpacks/Z550_CDA102577_8_RUSSIA_extracted/` | — | the above, unzipped. Already in XS++ shape: contains exactly one child folder `tpa/`, ready to drop into `own_custpack/` next to XS++.exe |
| `Z550_GDFS.bin` | 60 610 | https://firmware.center/firmware/Sony-Ericsson/Z550/Z550_GDFS.bin — **reference only.** It is a GDFS from someone else's phone. Never write it into yours. |

The two `.mbn` files are byte-identical to each other (MD5 `c32b81b1…`); they differ only in
the filename the two hosts use. Keep one, or both for provenance. The `.fbn` MD5 is
`3e7a1949…` from both sources, which cross-confirms them.

**se-zone.ru lists this same set** as `Z550_R6CA009_MAIN_GENERIC_ML_RED49.zip` +
`Z550_R6CA009_FS_RUSSIA_RED49.zip` (table on https://se-zone.ru/flash/z550i.htm). Those two
zip wrappers and the R2A finalization zip are **not downloadable** — see §6.

### Customization / finalization packs

| File | Bytes | Notes |
|---|---|---|
| `custpacks/Z550_CDA102577_8_RUSSIA.zip` + `_extracted/` | 9 467 | **the correct one for R6CA009.** CDA102577_8, R2A. |
| `custpacks/Z520i_CDA102414_1_EMEA_1.zip` | 14 138 | **Z520i, not Z550i.** Shipped inside the archive.org dump as an example. Do not flash it to a Z550i. |

There is **no CDA pack for R6GA004 or R6BA033** anywhere reachable. Without one you cannot
complete an A100 flash of those firmwares through XS++/SEtool unless you build a custom pack.

### REST files (required by SETool2 Lite)

`firmware/rest/` — 182-file superset in the tree, but these are the Z550-relevant ones:

| File | Bytes | Notes |
|---|---|---|
| `Z550_R6CA009_MAIN_GENERIC_RED49.mbn.rest.mbn` | 263 410 | made for this exact MAIN |
| `R6CA009_CXC1250583_GENERIC_ML` | 263 076 | generic |
| `R6CA009_CXC1250584_HONG_KONG_ML` | 263 076 | HK |
| `R6CA009_CXC1250586_CHINA_ML` | 263 076 | China |
| `r6ba033_CXC1250583_GENERIC_ML` | 263 076 | **R6BA033** generic |
| `r6ba033_CXC1250584_HONG_KONG_ML` | 263 076 | R6BA033 HK |
| `r6ba033_CXC1250585_TAIWAN_ML` | 263 076 | R6BA033 Taiwan |
| `r6ba033_CXC1250586_CHINA_ML` | 263 076 | R6BA033 China |
| `r6ba033_CXC1250587_CMCC_ML` | 263 076 | R6BA033 China Mobile |
| `ssw2rest.exe` | 49 152 | builds a `.rest` from any MAIN `.mbn` — use this for R6GA004 or any other build |
| `readme.txt` | 141 | "place here rest files" |

The remaining ~170 files cover DB2000/DB2020/DB3150 and other models. Left in place; harmless.

---

## 3. `patches/` — .vkp patches  (26 MB, 1 482 files)

**19 flashable Z550i patches + 1 SIM-unlock + 1 quarantined**, **plus 22 more recovered from
the Wayback Machine in `wayback/`** (§11). Every one of the 18 general patches above
carries the header `;Z550 SW-R6CA009`, i.e. they are built for R6CA009 only. None of
them will apply to R6GA004 — the binary is different. Full decoded headers in
`PATCH_HEADERS.txt`.

`wayback/r6ga004/` holds **12 genuine R6CA009→R6GA004 patches** — the only R6GA004 patch
files for this phone obtainable from any host, and they do not apply to R6CA009 either.
Keep the two sets strictly apart; see `wayback/README.txt`.

### Flashable (all R6CA009)

| Patch | Bytes | Effect |
|---|---|---|
| `heap_shift.vkp` | 552 | **flash this one first.** Heap shift, moves the patch window — more stability for everything else. Its own comment says the address range is firmware-version dependent. |
| `system_fs_in_file_manager.vkp` | 4 574 | File manager: 4th tab exposing tpa/system/smsdata/card/usb/ifs, copy+move into tpa and ifs, protected files unlocked. v5 fix, IronMaster. The most useful one in the set. |
| `bluetooth_transfer_minimize.vkp` | 1 306 | minimize the BT file transfer window. Joker XT / r ZEN |
| `display_brightness_extended_range.vkp` | 1 047 | brightness 10–100 % instead of the narrower stock range. IronMaster |
| `vibration_on_start_of_conversation.vkp` | 766 | vibrate on incoming call (camera-safe). SiNgle; notes it wants heap_shift |
| `illumination_reduction.vkp` | 745 | keyboard illumination −20 %, off at 50 %. Mobilefree / Shadow |
| `radio_without_headset.vkp` | 120 | radio works with no headset. SiNgle / NuKEr2k |
| `change_java_folder.vkp` | 534 | java folder → usb/other/java. **delete all games/apps first.** Mobilefree / HierOS |
| `remove_voicerecorder_beeps.vkp` | 265 | drop the voice-recorder beep. SiNgle, v2.1 fixed by FearHQ |
| `vibration_on_menu_open.vkp` | 276 | vibrate entering the menu. GVELF / Hishchnik |
| `remove_bluetooth_prompts.vkp` | 241 | kill the "accept file? (yes/no)" BT prompt. the_laser / Shadow |
| `rename_file_extension.vkp` | 336 | rename shows the extension. IronMaster, v2 |
| `display_file_extension.vkp` | 183 | file list shows extensions. IronMaster / Absolutew800i |
| `photo_while_java_is_running.vkp` | 246 | camera works while Java is running in the background. SiNgle / Shadow |
| `time_and_data_instead_of_carrier_logo.vkp` | 271 | clock in the top bar instead of the carrier logo. supertrubka.org, v2.5 |
| `remove_camera_shutter_sound.vkp` | 181 | silent shutter. H3ct0R / Hishchnik |
| `disable_java_permissions.vkp` | 186 | ignore Java security prompts. the_laser / HierOS |
| `fix_activity_menu_bug.vkp` | 216 | fix the square artifact behind "New events" in the Activity menu. IronMaster |

### SIM unlock

`simlock/Remove_SIM_lock_Z550_R6CA009_GENERIC.vkp` (188 B) — header
`;Z550 SW-R6CA009-GENERIC`, IronMaster, generated with SIMLock patch generator v2.2. Ready
to flash as-is.

### Do not flash

`NOT_Z550_do_not_flash/Equalizer_Patch_W810_R4EA031.vkp` (235 B) — header is `;W810 SW-R4EA031`.
Wrong offsets for the Z550i. Kept only as an example of vkp structure. README inside explains.

### Patch sources (for writing your own)

`farid1991_patch-se/` — 25 MB shallow clone of https://github.com/farid1991/patch-se, ~50 patch
projects with full IAR sources, `Target/`, `xcl/` and README per patch. **Zero Z550 or DB2010
content** (verified against the full 1 410-file git tree: no path matches `z550`). It is the
best available reference for the vkp format and the elf2vkp toolchain, not a Z550i resource.

---

## 4. `elfpack/` — ElfPack, Library, DYN_CONST  (1.1 MB, 47 files)

| File | Bytes | Source / notes |
|---|---|---|
| `Z550_R6CA009.vkp` | 52 703 | **the main ElfPack.** Header: `;Z550_R6CA009 / ;ELFPack v1.999 (c) Hussein / SWI_Hook (c) Rst7/CBSIE / ElfLoader (c)2007 by Rst7/CBSIE, BoBa, Kren`. From archive.org `se-z-550i`. |
| `z550_r6ca009.lib.vkp` | 60 979 | Library patch, R6CA009. `;Z550 SW-R6CA009 ... (c) Hussein, IronMaster`. From https://archive.perk11.info/svn/SE/Library/z550_r6ca009.lib.vkp |
| `z550_r6ca009.lib.vkp.archiveorg-2024-02-22` | 63 051 | **a different, larger build of the same library** (newer revision from the archive.org dump). Kept side by side on purpose: the newer one resolves more function addresses. Try it if the older one leaves elves with missing calls. |
| `z550_r6ga004.lib.vkp` | 60 971 | Library patch, R6GA004. https://archive.perk11.info/svn/SE/Library/z550_r6ga004.lib.vkp |
| `ZBin_template/Config/DYN_CONST.bin` | 2 720 | go in `ZBin/Config/` |
| `ZBin_template/DLL/LibraryDLL.dll` | 5 392 | go in `ZBin/DLL/` |
| `ZBin_template/Daemons/` | — | empty, for startup ELF daemons |
| `sources_perk11/Z550_R6CA009.{h,xcl,asm}` | — | ElfPack build sources for R6CA009 |
| `sources_perk11/Z550_R6GA004.{h,xcl,asm}` | — | ElfPack build sources for **R6GA004** |

Full ElfPack + dynconst trees with `.svn` history stripped are in
`tools/elfpack_sources_perk11/` (4.8 MB) if you want to rebuild.

### Flash order for ElfPack — this matters

1. **Main ElfPack vkp** (`Z550_R6CA009.vkp`)
2. **Library vkp** (`z550_r6ca009.lib.vkp`) — second, never before the main one
3. Reboot / reseat battery
4. Create the tree on the phone: `ZBin/` under `Others/`, with `Config/`, `DLL/`, `Daemons/`
5. `DYN_CONST.bin` → `ZBin/Config/`, `LibraryDLL.dll` → `ZBin/DLL/`
6. `.elf` files → `ZBin/Daemons/` for auto-start, or run them from a file manager

This is the documented procedure at https://operationse.github.io/elfpack.html, mirrored in
`tools/docs/operationse_elfpack.html`. A phone with external storage needs `Daemons/` on the
card; the Z550i has none, so internal is correct here.

### ELF binaries — see `wayback/` first

se-zone.ru catalogues **162 Z550i elves** (names + per-elf pages in
`tools/docs/sezone_ELF_names_catalogue.txt`) and hosts them at
`/elfs/download.php?mode=elf&ext=zip&id=NN` — every one of those URLs returns 302 to `/`.
The same goes for `mode=elfpack&id=5`, `mode=lib&id=52`, `mode=lib&id=53`.

**Superseded by §11:** the Wayback Machine does hold the real bytes behind those dead
URLs. `wayback/elfs/` now has **15 verified ARM `.elf` binaries** for this phone (14
z550i elf ids plus 3 more unpacked from an Elf Installer `.pkg`), `wayback/libraries/`
has a second Library build for each firmware, and `wayback/elfpack_id5/` has a second,
independent ElfPack v1.999 build for R6CA009. 16 of the 30 catalogued Z550i elves have
zero captures anywhere and are permanently lost. There is still **no ElfPack main `.vkp`
for R6GA004** anywhere — only its `.lib.vkp`, its build sources, and the 12 recovered
R6GA004 patches.

---

## 5. `tools/` + `plugins/` — flashers, drivers, docs  (174 MB, 721 files)

### Flashers

| File | Bytes | Source / notes |
|---|---|---|
| `XS++_v3.1_operationse.exe` | 9 272 832 | XS++ 3.1, PE32 PECompact2. operationse.github.io/tools.html. Full notes incl. the XS++ 3.2 situation in `XSpp_NOTES.txt` |
| `XSpp_3.1_SE-NSE/XS++.exe` | 9 272 320 | second copy of the same build from SE-NSE.rar |
| `setool2lite.exe` | 4 273 664 | SEtool2 Lite, 2007-08-31. Notes in `SETOOL2_LITE_NOTES.txt` |
| `qamaker.exe` | 29 210 | MAIN `.mbn` → quick-access `.vkp` |
| `SIMLockPatchGen.exe` | 278 528 | carrier-lock removal patch generator |
| `a2uploader.exe` | 1 781 248 | A2-platform flasher. **Not for the Z550i** (A1). Included for completeness |
| `FARManager_A1_jdflFAR.7z` | 20 194 832 | FAR Manager 32-bit **with jdflasher and SEFP2 already bundled** |
| `FARManager_A2.7z` | 19 011 337 | FAR Manager for A2 phones. Not for the Z550i |
| `far_A1_extract/` | 85 MB | the Sony plugins from the A1 archive, unzipped for inspection — see below |

### jdflasher / FAR — the path you need for break mode

`tools/JDFLAR_PLUGIN_NOTES.txt` is the detailed writeup. The Z550i-specific files inside
`far_A1_extract/FARManager/Plugins/jdflasher/`:

- `2010_49/DB2010cid49Red.hdr` — **use this header** (DB2010 = Z550i/W810i chipset, CID49 RED = retail)
- `2010_49/K510_Z530_Z550.ose` — the flashing profile for the Z550i
- `bin/` — 62 loaders incl. `DB2010_FLASHLOADER_R2A003.2010_49_RED`
- `scripts/` — XML profiles: `db2012.xml`, `Pach_DB2012_CID52.xml`, `DB2012_Pach_CID53.xml`, `db2020.xml`…
- `rest/` — 182 rest files, same set as `firmware/rest/`
- `make_rest/` — ssw2rest

Plus `far_A1_extract/FARManager/Plugins/sefp2w/` (SEFP 2, filesystem read/write on A1) and
`make_rest/`. Standalone copies in `plugins/`:

- `plugins/sefp2w/` — `sefp2.dll`, `meflash.dll`, EN+RU help and language files
- `plugins/FAR_CXC_Patcher/` — `farcxcplugin.dll` x4 (x86/x64, wide/narrow FAR builds)

### Drivers

| Path | Bytes | Notes |
|---|---|---|
| `GordonsGateFlashDriver_ggsetup-3.0.0.7.exe` | 3 752 913 | the main link from both lpcwiki and operationse |
| `GordonGateDrivers/` | ~15 MB | unpacked `ggsemc`/`ggflt` `.sys` + `.inf` + `.cat` for x86/x64, from `USBFlashDriver-world66.spcs.bio`; plus `WdfCoInstaller01005.dll` for each |
| `GordonGateDrivers/gg-setup_2006.exe` | 300 456 | the 2006-era installer, from the SETool2 bundle |
| `GordonGateDrivers/` FTDI set | ~350 KB | `ftdibus.inf`, `ftser2k.sys`, `FTDIBUS.DLL` etc. — the "4-in-1 cable" driver. Only needed for the 4-in-1 cable, not for a normal DCU-60 |

jdflasher also ships its own copy under `jdflasher/drivers/` (ggsemc v2.0.0.1, epiusb v1.0.0.0).

### Patch / porting / FS tooling

| Path | Notes |
|---|---|
| `1-Patcher.jar`, `bpatch.exe`, `customize_upgrade.xml` | jjPatcher — GUI patch builder |
| `APAP/` | Advanced Patch Porting, `APAP_Beta.exe` + libs + langs |
| `Extract_FS_tools/` | `SEFStool4.exe`, `main2raw.exe`, CodeClaw DB3210 CID53 File Xtractor 2.0 |
| `SE_Layout_Editor/` | Sony Ericsson Layout Editor (SELE) + Layouts |
| `Theme_FlashMenu_Connector/` | TinyFlashMenu + flash-menu/theme connector |
| `BleEditor.exe` | BLE editor |
| `elfpack_sources_perk11/` | 4.8 MB ElfPack + dynconst source trees |
| `drivers_db2010_db2012/` | same-platform camera drivers (Clara v4.8, Sarmad 6.1, SUPER FUNCTION v6.2, SUPER Camera Driver) + 2 display packs |

### Docs (local mirrors, all live-verified)

| File | Notes |
|---|---|
| `docs/lpcwiki_Flashing_SonyEricsson.html` | the main toolchain article. **jdflasher's classic host `justdanpo.ru` is dead — DNS does not resolve.** Its Omnius and SETool2 links are MEGA/Google-Drive and were unreachable |
| `docs/operationse_db2010_cid49_patching.html` | the procedure that matters: FAR → F11 → jdflasher → bflash → copy `.vkp` → restore firmware. Screenshots, step by step |
| `docs/operationse_a1_flashing_xs.html` | XS++ flashing walkthrough |
| `docs/operationse_elfpack.html` | the 3-file ElfPack procedure |
| `docs/operationse_tools.html`, `docs/operationse_download_links.html` | source of every Operation SE binary here |
| `docs_tutorials/` | 14 `.doc` tutorials from SE-NSE: XS++ 3.1 usage, jjPatcher, Elfpack installation, FS/MAIN extraction, SE Image Tool, camdriver modding, A2 permanent patching, password-protecting a flash menu, and more. **The Elfpack-installation and XS++-3.1 ones are the relevant pair** |
| `docs/sezone_GATED_patches_catalogue.txt` | all 28 se-zone.ru Z550i patches by name + gated URL |
| `docs/sezone_GATED_elfs_catalogue.txt` | elf/ElfPack endpoints + what substitutes exist |
| `docs/sezone_ELF_names_catalogue.txt` | 162 Z550i elf names, by firmware |
| `docs/sezone_GATED_download_urls.txt` | the ElfPack/Library endpoint list |
| `docs/iprotebe_z550_r6ga004_patch_files_section576.html` | iProTebe.cz listing: 41 R6GA004 patch names, all downloads gated |
| `docs/sezone_*.html`, `docs/sezone_z550i_flash_index.html` | the original listing pages |

`XSpp_NOTES.txt` `SETOOL2_LITE_NOTES.txt` `OMNIUS_NOTES.txt` `JDFLAR_PLUGIN_NOTES.txt` cover
each tool's version, provenance and gotchas.

---

## 6. `acoustic/` — sound drivers  (9.1 MB, 1 088 files)

`acoustic/README.txt` has the full breakdown. Summary:

**The loudest ToShaRa packs** (in `tosharaloud/`):

| Set | Files | Notes |
|---|---|---|
| `ToShaRa_Mega_Acoustic_v1.6_HighQuality_And_Loudness/` | 91 `.apf`/`.aec` + `Readme.txt` | **the one you asked for.** ToShaRa's own readme: higher quality, stronger headphone bass, more loudspeaker bass/treble |
| `Mega_Acoustics_by_ToShaRa/` | 91 | the other ToShaRa set, file dates 2006–2007 |

Both are APF format (`.apf`/`.aec`) = correct platform for DB2010. Install to
`ifs/settings/acoustic` via XS++ FSX upload or FAR/SEFP2 copy.

`db2010_db2012_all/` holds the complete SE-NSE DB2010/DB2012 driver collection — 12 acoustic
sets (ToShaRa x2, Agrakesh, Bizzaro, Ex Audio 1.3, EXtreme Power, SmellULater Quality Pack,
Thunder, Ultra Acoustics, uLtRa BaSs V3.0, XSound CyberBass, XSound Nex) plus camdrivers and
display drivers.

ToShaRa **v1.8** (`ToShaRa_V1.8_Mega_Acoustic.rar`, reported as the very loudest) and the
**1.6.8_B1** build existed only on hosts that are gone (w200style.forumeiros.com attachment
list, iprotebe.cz file36). Names recorded, bytes unobtainable.

**6 zero-byte `.apf` files** (`bvhf_hcq-60_*`, `vhf_hca-60_*`, ×3 each) ship that way inside
SE-NSE.rar — placeholders for headset models the Z550i does not have. Not a bad download.

---

## 7. `_sources/` — the two big archives (199 MB)

Kept so every extracted file above can be re-verified without re-downloading.

| File | Bytes | URL |
|---|---|---|
| `SE_Z550i_archive.org.zip` | 51 360 434 | https://archive.org/download/se-z-550i/SE%20Z550i.zip — 308 files. **The single richest source.** Contributed R6CA009 MAIN+FS, the CDA custom pack, `Z520i` finalization, all 18 patches, SIM-unlock vkp, `Z550_R6CA009.vkp` ElfPack, a newer `z550_r6ca009.lib.vkp`, DYN_CONST.bin, LibraryDLL.dll, SETool2 Lite, 182 REST files, the GDFS sample, the drivers, and the `rest/` maker |
| `SE-NSE.rar` | 133 654 951 | https://archive.org/download/se-nse-collection-of-sonyericsson-software/SE-NSE.rar — 4 304 files. Contributed all 12 acoustic sets, the cam/display drivers, XS++ 3.1, jjPatcher, APAP, SEFP2, FAR CXC Patcher, the FS-extraction tools, SELE, and the 14 tutorials |
| `svn.tar.gz` | 22 923 028 | https://archive.perk11.info/svn.tar.gz — the whole SE/ARM SVN tree, 17 630 entries. Contributed both `.lib.vkp` files and all ElfPack/dynconst sources |

---

## 8. Flash order — the actual sequences

### A. Stock R6CA009 CID49 RED from scratch

1. Install `GordonsGateFlashDriver_ggsetup-3.0.0.7.exe` (or the unpacked `GordonGateDrivers/`)
2. Battery out → battery in → hold **C** → plug DCU-60 → XS++ 3.1 → Connect
3. MAIN = `firmware/Z550_R6CA009_MAIN_GENERIC_RED49.mbn`
4. FS = `firmware/Z550_R6CA009_FS_RUSSIA_RED49.fbn`
5. CUST = `firmware/custpacks/Z550_CDA102577_8_RUSSIA_extracted/` placed in `own_custpack/` next to XS++.exe, phone model set to `own_custpack`
6. Flash (5–10 min) → unplug → battery out → battery in → power on

### B. Patching an already-flashed R6CA009 (no firmware change)

1. Install drivers; run FAR Manager (32-bit — use a 32-bit VM on modern Windows)
2. F11 → jdflasher → header `2010_49/DB2010cid49Red.hdr`, profile `K510_Z530_Z550.ose`, DCU-60
3. "jump down into a large rabbit hole" → battery out/in → plug holding C
4. Choose **`bflash`** (not `oflash`) → it writes a broken bootloader → reseat battery → replug holding C
5. You land in a `memory` pane. F5 → pick the `.vkp` → Copy → tick "as vkp patch" → "yeah, flash it". To undo one, tick "remove patch"
6. Go up two levels → yes → **"restore firmware: YES"** to put the real bootloader back
7. Battery out/in, power on

`heap_shift.vkp` first if you are stacking several patches.

### C. ElfPack (elfs)

1. In `bflash`, flash **`Z550_R6CA009.vkp`** (main ElfPack) — then, separately, **`z550_r6ca009.lib.vkp`**. Main first, library second, never reversed
2. Reboot
3. On the phone: `Others/ZBin/{Config,DLL,Daemons}/`
4. `DYN_CONST.bin` → `Config/`, `LibraryDLL.dll` → `DLL/`
5. `.elf` → `Daemons/` (auto-start) or launch from a file manager

### D. Acoustics only (no flash, no patch)

1. Back up `ifs/settings/acoustic` first (FAR + SEFP2, `bfs` or `ofs` mode)
2. XS++ → FSX → "start FSX" → upload the `.apf`/`.aec` files to `ifs/settings/acoustic`
3. Or copy the whole folder to `usb/other/acoustic` via FAR (that path is what the R6GA004
   "move acoustic folder" patch creates), then swap folders freely over USB
4. Shut down FSX when prompted, unplug, power on

### E. SIM unlock

1. `qamaker.exe` + drop `Z550_R6CA009_MAIN_GENERIC_RED49.mbn` on it → quick-access `.vkp`
2. Flash that in `bflash` first
3. Then flash `patches/simlock/Remove_SIM_lock_Z550_R6CA009_GENERIC.vkp`

---

## 9. What is missing, and why

| Missing | Status |
|---|---|
| **R6GA004 MAIN + FS + CDA** | **Not obtainable — but less hopeless than it was.** The firmware is referenced across many forums but the only links were RapidShare (dead) and gsmforum.ru (unreachable). se-zone.ru hosts only R6CA009. firmware.center has only CID 49 RED = R6CA009. archive.org has no R6GA004 item (searched: `z550`, `z550i`, `R6GA004`, `R6BA033`, `elfpack` — zero hits). TopSony torrent files contain **no Z550 entries at all** (9 584 paths parsed). **Wayback has no Z550i firmware of any branch either (§11.5).** What §11 *did* add for this branch: 12 working R6GA004 patches, a second Library `.lib.vkp` build, and the build sources. The remaining blocker is purely the three firmware binaries. |
| **R6BA033 MAIN + FS + CDA** | Same. Its five REST files *are* here in `firmware/rest/`, which confirms the branch is real and gives you the CDA IDs (CXC1250583/84/85/86/87). |
| **R6CA009 CUST pack from se-zone** | we have the firmware.center copy (`Z550_CDA102577_8_RUSSIA.zip`), which is the same CDA102577_8/R2A pack. Equivalent. |
| ~~**All se-zone.ru downloads**~~ | **RESOLVED — see §11.** The handler *is* gated (every `download.php` and `.zip.htm` returns `HTTP/2 302 → /`, verified with curl, Referer, cookies, Chrome headers and a real browser session), but `download.php` was only a wrapper. The real bytes live at `patches/files/<id>.vkp` and `elfs/files/{elfs,elfpacks,libs}/<id>.*`, and web.archive.org captured 39 of them. **38 recovered and content-verified, 1 rejected as a redirect stub, 7 permanently uncaptured.** Still gated on the live site; the listing pages are recorded in `tools/docs/sezone_GATED_*.txt`. |
| **iProTebe.cz downloads** (41 R6GA004 patches, ToShaRa v1.2) | Site alive (HTTP 200) but `/patch_files-z550-section577.html` returns **401**, and every download page is behind a login form (`form.php?pid=…`, Czech "Přihlášení"). The section-576 listing was fetchable and is mirrored in `tools/docs/`. |
| **jdflasher from justdanpo.ru** | **Dead host.** `http://justdanpo.ru/data/projects/gsm/jdflasher.7z` — DNS: "Could not resolve host". Replaced with the operationse FAR build that bundles the same plugin. |
| **Omnius for SE** | All three sources fail: `kaijousuru.com` and `archives.kaijousuru.com` do not resolve; the MEGA/Google-Drive links in lpcwiki return API error −15. Documented in `tools/OMNIUS_NOTES.txt`. Not needed — XS++ + SETool2 Lite + FAR/jdflasher cover everything. |
| **XS++ 3.2** | Leaked dev builds only, every host dead (4shared link in the surviving blog post, various dead fileservers). 3.1 is what operationse and lpcwiki still ship and is correct for CID 49 DB2010. See `tools/XSpp_NOTES.txt`. |
| ~~**Any Z550i `.elf` binary**~~ | **RESOLVED — 15 recovered (§11.3).** `elfpack/wayback/elfs/` holds them, all verified ARM 32-bit ELF. se-zone had them all along, behind `elfs/download.php`; Wayback captured 14 of 30. The other **16 (ids 71-85 and 88) have zero captures anywhere** and are permanently lost. |
| **16 of 30 Z550i `.elf` binaries** (ids 71-85, 88) | Never archived under any URL form. Confirmed against a complete CDX result set. |
| **6 se-zone R6GA004 folder-redirect patches** (ids 931-936) | Never archived. They move the acoustic and camera folders, so §8.D's R6GA004 variant still can't be built from patches alone. |
| **All se-zone.ru Z550i firmware zips** | Never archived, though `flash/z550i.htm` itself is. Zero captures of any `/flash/files/z550i/*` or the three `.zip.htm` pages. Equivalents already in `firmware/` from firmware.center + archive.org, md5 cross-checked. Details in `firmware/wayback/README.txt`. |
| **ElfPack main `.vkp` for R6GA004** | Still missing. Only its `.lib.vkp` (two builds now), build sources, and 12 R6GA004 patches exist. Build it from `sources_perk11/Z550_R6GA004.{h,xcl,asm}` if needed. |
| **ToShaRa v1.8 / 1.6.8_B1** | Hosts dead (forumeiros attachment list, iprotebe.cz). v1.6 is present and is the loudest obtainable. |

**Dead/unreachable hosts, consolidated:** `justdanpo.ru` (DNS), `kaijousuru.com` +
`archives.kaijousuru.com` (DNS), `rapidshare.com` (links gone), `gsmforum.ru` (connection
fail), `patches.kibab.com` (reachable but Siemens-only, no SE content), MEGA.nz public
folders via API (error −15 on all the handles lpcwiki uses).

**Net effect:** a fully flashable R6CA009 CID49 RED stack (MAIN + FS + CUST + REST), 19
patches for it, the ElfPack trio for R6CA009 plus Library for R6GA004, every flashing tool
that still exists, and the loudest obtainable acoustic pack. R6GA004/R6BA033 are documented
and REST-equipped but their MAIN/FS binaries exist on no live host.

---

## 10. Verification performed

- every download preceded by a `curl -sIL` HEAD check; nothing fetched on a 404/302
- every `.mbn`/`.fbn` opens with `babe 0003`
- both custpack zips pass `unzip -t` with no errors
- all 21 `.vkp` files start with `;` (0x3B) and have a parseable comment header; every
  header decoded into `patches/PATCH_HEADERS.txt` and checked against the target firmware
- `.7z`/`.rar` archives verified with `7z t` / listing
- MD5 cross-check between the two independent sources for the R6CA009 MAIN and FS — match
- zero-byte sweep run; the only hits are the 6 known upstream acoustic placeholders and one
  genuinely empty `readme.md` in the patch-se clone

---

## 11. Wayback recovery log — se-zone.ru binaries pulled out of web.archive.org

**Date:** 2026-10-06, same box, immediately after the first pass hit the dead handler.
**Result: 57 files, 868 328 bytes recovered and content-verified.** Of those, 22 are
`.vkp` patches, 15 are real ARM `.elf` binaries, 2 are Library `.vkp`, 2 are ElfPack
payload files, and the rest are the original `.zip`/`.pkg` archives those came in.
Seven targets were searched for and are **permanently lost** — listed at the end.

### 11.1 The breakthrough: `download.php` was never the file

The live site is still up and every listing page still returns 200, but every
`download.php` and `.zip.htm` URL 302s to `/`. That is a *handler* problem, not a
storage problem. The archives show the site keeps its binaries in flat, unlinked,
guessable directories, and `download.php` is only a thin wrapper around them:

| dead live URL | real file behind it |
|---|---|
| `patches/download.php?id=1336` | `se-zone.ru/patches/files/1336.vkp` |
| `elfs/download.php?mode=elf&ext=zip&id=86` | `se-zone.ru/elfs/files/elfs/86.zip` |
| `elfs/download.php?mode=elfpack&id=5` | `se-zone.ru/elfs/files/elfpacks/5.zip` |
| `elfs/download.php?mode=lib&id=52` / `id=53` | `se-zone.ru/elfs/files/libs/52.vkp` / `53.vkp` |

The numeric ID in the dead URL *is* the filename. So the catalogue IDs already recorded
in `tools/docs/sezone_GATED_*.txt` were enough to construct every real path, and the CDX
API could be queried for those directly instead of for the dead endpoints. This is the
whole reason the recovery worked where curl, headers, cookies and a real browser did not.

### 11.2 CDX queries issued

All against `web.archive.org`, `fl=original,timestamp,statuscode,mimetype,length`,
`filter=statuscode:200`, `collapse=urlkey`:

| query | captures | complete? |
|---|---|---|
| `url=se-zone.ru/patches/*` | 1 244 | yes — under the 4 000 cap |
| `url=se-zone.ru/elfs/*` | 514 | yes — under the cap |
| `url=se-zone.ru/flash/*` | 96 | yes — under the cap |
| `url=se-zone.ru&matchType=domain` | 60 000 | **no — hit the cap, discarded as evidence** |

The last one was truncated at its cap, so it was *not* used to prove any absence; only
the three prefix queries, which all returned complete result sets, were. Where a "zero
captures" claim is made below, it is backed by one of those, plus the neighbourhood
sanity check in §11.5.

Downloads used the raw-bytes modifier — `https://web.archive.org/web/<ts>id_/<url>` —
so nothing came back Wayback-rewritten, and every file was then checked by content:

* `.vkp` → first byte is `0x3B`, header parses, header names the right firmware
* `.elf` → `file(1)` reports `ELF 32-bit LSB executable, ARM`
* `.zip`/`.pkg` → `unzip -t` clean, contents listed and inspected individually

39 files downloaded, 38 kept, 1 rejected (id 99, see §11.4). Timestamps for every single
one are in `patches/wayback/WAYBACK_MANIFEST.tsv` together with its md5 and installed path.

Note: CDX's `length` field is the *compressed WARC record* length, not the payload size —
e.g. patch 1336 reports 584 but the real file is 324 bytes. Sizes were always taken from
the downloaded bytes, never from the index.

### 11.3 What was recovered

**`patches/wayback/r6ca009/` — 10 patches, 6 841 B** (all capture 2009-10-02, one 2008)

| File | Bytes | Patch |
|---|---|---|
| `1336_radio_without_headset.siNgle.NuKEr2k.vkp` | 324 | radio with no headset |
| `1124_remove_voicerecorder_beeps…jasiek.Hishchnik.vkp` | 430 | drop the voice-recorder beep |
| `1113_change_language_folder.tpa_preset_system_language.vkp` | 895 | move `tpa/preset/system/language` → `tpa/user/other/{set,modding}/lng` |
| `1024_win1251_encoding_support.Hussein.IronMaster.vkp` | 823 | win-1251 encoding |
| `0999_privacy_2.5_fix.vkp` | 14 010 | password on file manager / phonebook / messages / call lists, v2.5 |
| `0988_black_song_color_in_list.IronMaster.vkp` | 283 | black song text in the list |
| `0987_improved_player.IronMaster.vkp` | 1 122 | up/down opens the song list like the W-series |
| `0749_heap_shift.den_po.Absolutew800i.v64k.vkp` | 561 | heap shift v.64k |
| `0747_remove_bluetooth_prompts.the_laser.Shadow.vkp` | 261 | kill the BT accept prompt |
| `0745_vibration_on_call_start.siNgle.Absolutew800i.v2.vkp` | 758 | vibrate on incoming call, v2 |

Five of these (1336, 1124, 0749, 0747, 0745) are **the same patch already in
`patches/`** — identical offset and payload lines, only se-zone's longer disclaimer
header added, hence the larger byte count. 0749 additionally uses `+44140000`
base-relative offsets where the repo copy has them expanded to absolute. Flash either
copy, never both. The other five are genuinely new.

**`patches/wayback/r6ga004/` — 12 patches, 5 202 B — the headline result**

INDEX.md previously stated no R6GA004 patch was obtainable from any host. These 12 are
the first R6GA004 `.vkp` files for the Z550i recovered from anywhere. All twelve declare
`;Z550 SW-R6GA004`: 0723 SMS melody duration · 0725 remove BT accept prompt · 0726 radio
with no headset · 0922 remove "silent mode ON" message · 0923 camera while Java runs ·
0924 headset control of the player · 0925 faster long-filename scrolling · 0926 fast
rewind of long mp3/video · 0927 no SIM wizard on SIM change · 0928 stock EQ → Mega Bass ·
0929 right softkey → Media Player · 0930 font 60 in sleep mode. Authors and per-patch
notes are in `patches/wayback/README.txt`.

**`elfpack/wayback/libraries/` — 2 files, 123 389 B** — Library `.vkp` for both firmwares,
both *new builds* distinct from the perk11 SVN copies: R6CA009 61 699 B
(md5 `d3810b64…`, vs 60 979 B existing), R6GA004 61 690 B (md5 `00647879…`, vs 60 971 B).
Keep all four; try the other build if one leaves elves with missing calls.

**`elfpack/wayback/elfpack_id5/` — 3 files, 71 305 B** — `elfpacks/5.zip` (capture
2014-09-15) unzipped to `Z550_R6CA009.sezone-build.vkp` (52 359 B) and
`DYN_CONST.sezone.bin` (2 716 B). The ElfPack vkp is a **second independent build of the
same ElfPack**: identical header, and the same four patch offsets (4418449C, 44558AF0,
44B9A204, 4510D974) carrying different replacement bytes — `04F01FE5 5C976B45` here vs
`04F01FE5 A0976B45` in the archive.org copy. Useful fallback. `LibraryDLL.dll` (5 392 B)
inside the same zip is byte-identical to `elfpack/ZBin_template/DLL/LibraryDLL.dll` and
was therefore *not* duplicated.

**`elfpack/wayback/elfs/` — 34 files, 673 126 B, incl. 15 real `.elf` binaries**

Also a first: §4 used to say no reachable Z550i `.elf` existed anywhere. Recovered, all
verified ARM 32-bit ELF: `fscaller.elf` (86) · `volumeplay.elf` (87) · `extopen_v3.elf`
(89) · `livebalancelite.elf` (90) · `callfiltre.elf` (91) · `dbs.elf` (92) ·
`layout_change.elf` (93) · `findfiles_v0.1fix3.elf` (94) · `grar_v1.1.elf` (95) ·
`smsview.elf` (96) · `registryeditor_v1.5.2.elf` (97) · `fontviewer.elf` (98), plus
`eventcontrol_993.pkg` (100) unpacked into `EventControl.elf` + `EvtDesk.elf` +
`EvtEdit.elf`. Ids 86-100 appear on both the R6CA009 and R6GA004 elf listing pages, so
these apply to either firmware. Each folder keeps the original `pkg.zip` as served.

**`firmware/wayback/` — 0 files, documented dead end.** See §11.5.

### 11.4 The one capture that was deliberately rejected

`elfs/files/elfs/99.zip` (capture 20130915205626) is a structurally valid zip, but its
only payload, `quick-access-menu_v3.0.pkg`, is **se-zone's own redirect stub page** saved
under a `.pkg` extension — UTF-16 HTML whose `<title>` is `Состояние перенаправления`
("redirect state"). It was not installed.

This is worth keeping as evidence: it proves the download handler was **already**
redirecting in 2013, when that capture was taken. The gating is not a recent
misconfiguration, and it means the Wayback copies are the only good copies of the
affected files rather than a fresh loss.

### 11.5 Zero captures anywhere — permanently missing

Searched via the complete prefix CDX queries, plus `wayback.archive-it.org` (returns 404
for these URLs; its CDX endpoint returns 403 Forbidden, so it holds no se-zone mirror),
plus nearby capture timestamps of the parent listing pages (irrelevant once a URL has no
capture at all), plus the archive.org item `se-z-550i` as fallback.

**6 patch IDs — never archived under any URL form:**

| ID | Patch |
|---|---|
| 0936 | move `tpa/system/mp` → `usb/others/mp` |
| 0935 | move `ifs/settings/camera` → `usb/other/c` |
| 0934 | move `ifs/settings/acoustic` → `usb/other/a` |
| 0933 | move `/tpa/system/layout` → `usb/other/layout` |
| 0932 | move `/tpa/preset/system/menu` → `/usb/other` |
| 0931 | move `tpa/preset/system/settings` → `usb/other` |

These 6 are precisely the R6GA004 folder-redirect patches, which is why the R6GA004
acoustic/camera folder workflow in §8.D still cannot be built from this set.

**16 elf IDs:** ids **71-85** (the 15 R6GA004-only elves, confirmed from the archived
`elfs/z550i-r6ga004-2.htm`, which links info-71 … info-85) and id **88**. So 14 of the 30
catalogued Z550i elves are recovered, 16 are lost.

**All se-zone.ru Z550i firmware.** `flash/z550i.htm` *is* captured (20070714044357,
mirrored at `tools/docs/sezone_z550i_flash_index.html`) and lists exactly three files —
`Z550_R6CA009_MAIN_GENERIC_RED49.zip.htm`, `Z550_R6CA009_FS_RUSSIA_RED49.zip.htm`,
`Z550_CDA102577_8_RUSSIA.zip.htm` — and **none of the three `.zip.htm` pages has a
capture**, nor does anything under `flash/files/z550i/`. Only nine files were ever
archived under `flash/files/` in total and all belong to other phones (K750i ×3, K800i
×1, W800i ×2, W810i ×3). Details and the "why it doesn't matter" argument are in
`firmware/wayback/README.txt`.

**Proof of absence, not a query artefact.** For the patch range the CDX prefix query
returned a complete set, and the neighbouring IDs *in the same numeric block* are
captured while these six are not:

    captured:  922 923 924 925 926 927 928 929 930  941 942  978 987 988  998 999
    absent:                    931 932 933 934 935 936

For elves the same holds: 86, 87, **89-100** all captured, 71-85 and 88 absent.

### 11.6 Still missing after this recovery

| Missing | Status |
|---|---|
| **R6GA004 MAIN + FS + CDA** | Unchanged. se-zone never archived them and no other host has them. **But the R6GA004 branch now has a real patch set (12 patches), its Library `.vkp`, and a second ElfPack build's worth of reference material.** The blocker is now purely the firmware binaries and the CDA pack. |
| **R6BA033 MAIN + FS + CDA** | Unchanged. Its five REST files are in `firmware/rest/`. |
| **R6CA009 CUST pack from se-zone** | No se-zone capture, but `firmware/Z550_CDA102577_8_RUSSIA.zip` from firmware.center is the same CDA102577_8 / R2A pack. Equivalent. |
| **iProTebe.cz 41 R6GA004 patches** | Still behind a login (`form.php?pid=…`, section 577 returns 401). Not attempted via Wayback; the se-zone R6GA004 set now covers the same ground partially. |
| **6 se-zone R6GA004 folder-redirect patches** | Zero captures anywhere. |
| **16 Z550i `.elf` binaries** | Zero captures anywhere (ids 71-85, 88). |
| **Any CDA pack for R6GA004 / R6BA033** | Does not exist on any reachable host. |
| **ToShaRa v1.8 / 1.6.8_B1, XS++ 3.2, Omnius, jdflasher from justdanpo.ru** | Unchanged, hosts dead. |

### 11.7 Reproducing this

    # what actually exists under the archive
    curl "http://web.archive.org/cdx/search/cdx?url=se-zone.ru/patches/*&output=text\
    &fl=original,timestamp,statuscode,mimetype,length&filter=statuscode:200&collapse=urlkey"

    # raw bytes, no Wayback rewriting — the id_ is what makes the vkp/elf usable
    curl -o out.vkp \
      "https://web.archive.org/web/20091002194644id_/http://se-zone.ru:80/patches/files/1336.vkp"

Every recovered file is listed with its exact timestamp and md5 in
`patches/wayback/WAYBACK_MANIFEST.tsv`. If you want to re-fetch a specific file, take
the `wayback_timestamp` and `original_url` columns from that file.

The archive.org item `se-z-550i` was **not** re-downloaded; it is already in
`_sources/SE_Z550i_archive.org.zip` and it remains the richest single source in the repo.
It was consulted here only as a fallback for the seven uncaptured targets, and it does not
contain any of them — it has no R6GA004 patches, no `.elf` binaries, and no R6GA004 or
R6BA033 firmware.
