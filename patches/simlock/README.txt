simlock/ — carrier-lock removal
=================================

    Remove_SIM_lock_Z550_R6CA009_GENERIC.vkp   188 B

Header `;Z550 SW-R6CA009-GENERIC`. Built by IronMaster with SIMLock patch generator v2.2.
This one needs no preparation or editing — it flashes as-is.

FLASH ORDER — TWO STEPS, IN THIS ORDER
  1. Drop tools/qamaker.exe on firmware/Z550_R6CA009_MAIN_GENERIC_RED49.mbn. It emits a
     quick-access .vkp for that MAIN. Flash THAT first, in bflash.
  2. Flash Remove_SIM_lock_Z550_R6CA009_GENERIC.vkp.

  You cannot skip step 1. The patch generator needs the MAIN image as input, and the
  resulting quick-access patch is what makes the lock patch apply.

  bflash mechanism: FAR Manager -> F11 -> jdflasher -> header 2010_49/DB2010cid49Red.hdr,
  profile K510_Z530_Z550.ose, DCU-60 -> "jump down into a large rabbit hole" -> battery out/in
  -> replug holding C -> choose **bflash**, not oflash -> reseat battery, replug holding C ->
  F5, pick the .vkp, Copy, tick "as vkp patch", "yeah, flash it". Then go up two levels ->
  yes -> **"restore firmware: YES"**. Battery out/in, power on.

  Leaving "restore firmware" undone leaves the phone in break mode. Do not stop there.

WHAT THIS ACTUALLY DOES
  It removes the carrier lock imposed by the network operator. It does not touch IMEI,
  warranty status stored in the phone, or anything on the network side. Whether a phone is
  carrier-locked varies by country and by era; in most markets in 2006-2007 retail handsets
  were sold unlocked and this patch is unnecessary.

SEE ALSO
  ../README.txt for the other 18 patches.
  ../../tools/SIMLockPatchGen.exe if you want to generate a lock patch for a different MAIN.