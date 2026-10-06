rest/ — REST files for SETool2 Lite
===================================

11 files, 2 417 311 B. SETool2 Lite wants these next to its executable, which is why
readme.txt in this directory says nothing more than "place here rest files".

    Z550_R6CA009_MAIN_GENERIC_RED49.mbn.rest.mbn  263 410 B  built for this exact MAIN
    R6CA009_CXC1250583_GENERIC_ML                 263 076 B  generic
    R6CA009_CXC1250584_HONG_KONG_ML               263 076 B  Hong Kong
    R6CA009_CXC1250586_CHINA_ML                   263 076 B  China
    r6ba033_CXC1250583_GENERIC_ML                 263 076 B  R6BA033 generic
    r6ba033_CXC1250584_HONG_KONG_ML               263 076 B  R6BA033 Hong Kong
    r6ba033_CXC1250585_TAIWAN_ML                  263 076 B  R6BA033 Taiwan
    r6ba033_CXC1250586_CHINA_ML                   263 076 B  R6BA033 China
    r6ba033_CXC1250587_CMCC_ML                    263 076 B  R6BA033 China Mobile
    ssw2rest.exe                                    49 152 B  builds a .rest from any MAIN
    readme.txt                                         141 B

WHAT A REST FILE IS
  A firmware MAIN image reduced to a quick-access form — the patch-relevant parts only, a
  fraction of the size. That is what makes it possible to flash a small patch without
  rewriting 22 MB of MAIN. The Z550i-specific one here was made from the exact MAIN in
  ../Z550_R6CA009_MAIN_GENERIC_RED49.mbn.

THE R6BA033 FILES MATTER MORE THAN THEY LOOK
  R6BA033's MAIN and filesystem do not exist on any reachable host. These five REST files
  are the only physical evidence in this archive that the branch is real, and they give away
  its CDA/CXC ids: CXC1250583, CXC1250584, CXC1250585, CXC1250586, CXC1250587. Anyone who
  tracks down the R6BA033 binaries elsewhere has the matching customisation ids here.

SSW2REST.EXE — MAKING YOUR OWN
  This is the tool that generates a .rest from any MAIN .mbn. You need it for R6GA004, whose
  firmware nobody has obtained, or for any future MAIN build. It is the only practical route
  to a usable patch set on a firmware that is not otherwise supported.

DUPLICATION, DELIBERATE
  All nine of these REST files are byte-identical to the copies in
  ../../tools/far_A1_extract/FARManager/Plugins/jdflasher/rest/, which is the full 182-file
  superset shipped with jdflasher. Both locations are kept: this one is the curated,
  Z550-relevant subset that INDEX.md and the docs refer to; that one is what the tool looks
  in. Verified identical file-by-file at publication prep.

FLASH ORDER
  REST files are not flashed. They sit next to SETool2 Lite and describe the firmware you
  are about to patch. The flash sequence is in ../README.txt; patches are applied afterwards
  in bflash.