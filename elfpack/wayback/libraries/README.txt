libraries/ — two more Library .vkp builds, one per firmware
==========================================================

    z550_r6ca009.lib.sezone-v2013.vkp   61 699 B   md5 d3810b645087dd425137cfb3514f0d01
    z550_r6ga004.lib.sezone-v2013.vkp   61 690 B   md5 0064787951f6d08f72d73a48ebfc77f5

Both start with a `;Z550 SW-R6CA009` / `;Z550 SW-R6GA004` header respectively, as expected.

These are DIFFERENT BUILDS from the copies already in ../..:

    file                                bytes    vs the existing copy
    z550_r6ca009.lib.vkp (perk11 SVN)   60 979    se-zone build is +720 B, different md5
    z550_r6ca009.lib.vkp (archive.org)  63 051    a third, even newer build
    z550_r6ga004.lib.vkp (perk11 SVN)   60 971    se-zone build is +719 B, different md5

So three R6CA009 library builds now exist in this archive (60 979 / 61 699 / 63 051) and two
R6GA004 ones (60 971 / 61 690). None is a redundant copy. The newer builds resolve more
function addresses; the classic symptom of using too old a one is elves that start and then
fail with missing calls. If that happens, try a different build.

Where they come from: the perk11 copies are the author's, from archive.perk11.info's SVN.
These two are the Russian-scene se-zone.ru builds, recovered from the Wayback Machine.

FLASH ORDER
  Library patch second, never first:
  1. Flash the main ElfPack vkp (../../../Z550_R6CA009.vkp for R6CA009).
  2. Flash ONE library .vkp, separately, after it.
  3. Reboot or reseat the battery.
  Never flash two library patches on top of each other — pick one, and if elves misbehave,
  remove it and try a different build.