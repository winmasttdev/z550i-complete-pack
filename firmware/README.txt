firmware/ — MAIN + filesystem + customization packs for the Z550i (DB2010, CID 49 RED)
=========================================================================================

WHAT IS HERE
  Z550_R6CA009_MAIN_GENERIC_RED49.mbn   22 106 080 B  MAIN, R6CA009, CID 49 RED
  Z550_R6CA009_FS_RUSSIA_RED49.fbn      8 663 008 B  filesystem, R6CA009, CID 49 RED
  Z550_CDA102577_8_RUSSIA.zip              9 467 B  the matching CDA/customization pack
  Z550_GDFS.bin                           60 610 B  REFERENCE ONLY, see warning below
  custpacks/                             the CDA zips plus the extracted R6CA009 one
  rest/                                  11 REST files + ssw2rest.exe + readme.txt
  wayback/                               documented dead end, README inside

A100-platform firmwares are ALWAYS three files: MAIN (.mbn), filesystem (.fbn), and a
customization/finalization pack. Flashing MAIN and FS without a CDA pack leaves the phone
unconfigured. Flash all three, in that order, or you get a half-dead phone.

Both .mbn/.fbn files here open with the magic `babe 0003`, which is what confirms they are
genuine SE firmware images and not HTML error pages.

THE ONE COPY OF THE MAIN
  Z550_R6CA009_MAIN_GENERIC_ML_RED49.mbn was removed from this tree during publication
  prep: it was byte-identical to the copy above (sha256
  7cc60270abad0e3ce5d81023f1471dd98b81cec02b8449475793a6bd7e6e9bf4, md5
  c32b81b12fd9e1f020a5071eaf39c9d0 — the md5 quoted in INDEX.md), differing only in the
  filename firmware.center and archive.org happen to use for the same bytes. Kept one copy.
  The .fbn was independently confirmed identical from both hosts at download time (md5
  3e7a1949903a39ee44a4ef774b132c3e), which cross-validates the MAIN the same way.

WARNING — Z550_GDFS.bin
  This is a GDFS (device data) file pulled off somebody else's phone. It is here so you can
  see the format and diff your own dump against it. NEVER write it to your own phone: it
  carries the other unit's identity data.

FLASH ORDER (stock R6CA009 CID49 RED, from scratch)
  1. Install tools/GordonGateDrivers/ggsetup-3.0.0.7.exe (or the unpacked driver tree).
  2. Battery out, battery in, hold C, plug the DCU-60 cable.
  3. XS++ 3.1 -> Connect. Choose CID 49 RED. Never the DB2010 CID49 *Brown* header, that
     is the developer unit and is not what a retail Z550i presents as.
  4. MAIN = Z550_R6CA009_MAIN_GENERIC_RED49.mbn
  5. FS   = Z550_R6CA009_FS_RUSSIA_RED49.fbn
  6. CUST = custpacks/Z550_CDA102577_8_RUSSIA_extracted/ placed in an `own_custpack/`
     directory next to XS++.exe, with the phone model set to `own_custpack`.
  7. Flash (5-10 minutes), unplug, battery out, battery in, power on.

custpacks/Z520i_CDA102414_1_EMEA_1.zip is a Z520i finalization pack that shipped inside the
archive.org dump as an example. It is NOT for the Z550i. Do not flash it here.

rest/ — the files SETool2 Lite wants next to its executable
  Z550_R6CA009_MAIN_GENERIC_RED49.mbn.rest.mbn  built for this exact MAIN
  R6CA009_CXC125058{3,4,6}_ML                   generic / Hong Kong / China
  r6ba033_CXC125058{3,4,5,6,7}_ML               the R6BA033 branch, all five
  ssw2rest.exe                                  builds a .rest from any MAIN .mbn —
                                                use this for R6GA004 or anything else
  readme.txt                                    "place here rest files"

  The r6ba033_* files are the only physical evidence in this archive that R6BA033 is a real
  branch: its MAIN/FS binaries are not obtainable anywhere, but its REST files exist, and
  they give away the CDA/CXC ids (CXC1250583/84/85/86/87).

wayback/ — no binaries, on purpose
  The Wayback Machine has no capture of any se-zone.ru Z550i firmware under any URL form.
  See wayback/README.txt for the CDX evidence. The directory is kept because "we looked and
  it is not there" is worth recording once, instead of everyone re-running the search.