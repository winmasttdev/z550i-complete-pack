r6ca009/ — 5 patches recovered from the Wayback Machine
======================================================

All five declare `;Z550 SW-R6CA009`. They apply to R6CA009 only — not to R6GA004, whose
binary is different. The sibling directory ../r6ga004/ holds the R6GA004 set; keep the two
strictly apart, cross-flashing corrupts the phone.

    0987  improved player                        IronMaster
    0988  black song colour in the list          IronMaster
    0999  privacy 2.5 fix                        14 010 B — the big
                                                   password-on-file-manager / phonebook /
                                                   messages / call-lists patch
    1024  win-1251 encoding support              Hussein / IronMaster
    1113  move tpa/preset/system/language         tpa/preset/system/language ->
          -> tpa/user/other/{set,modding}/lng

FIVE FILES WERE REMOVED FROM THIS DIRECTORY DURING PUBLICATION PREP
  This directory held ten files. Five of them were not new payloads:

    0745 vibration_on_start_of_conversation   same payload as ../vibration_on_start_of_conversation.vkp
    0747 remove_bluetooth_prompts            same payload as ../remove_bluetooth_prompts.vkp
    0749 heap_shift                          same payload as ../heap_shift.vkp
    1124 remove_voicerecorder_beeps           same payload as ../remove_voicerecorder_beeps.vkp
    1336 radio_without_headset               same payload as ../radio_without_headset.vkp

  Each was the same patch already present one directory up, wrapped in se-zone's longer
  disclaimer header, which is why the wayback copies were the larger files. The
  offset/payload lines were compared line by line before removal and are identical; 0749
  differs only in using `+44140000` base-relative offsets where the copy kept here has them
  expanded to absolute, which resolves to the same addresses.

  Only the top-level copy is kept now. Flash that one. Do not flash both.

  If you want the se-zone originals with their full disclaimers back, their exact Wayback
  timestamps and md5s are recorded in ../WAYBACK_MANIFEST.tsv, so they can be re-fetched.

The five files still here are genuinely new — no equivalent existed in this archive before
the Wayback recovery.

FLASH ORDER
  Same as any other .vkp: FAR Manager -> F11 -> jdflasher -> bflash -> pick the file ->
  Copy -> tick "as vkp patch" -> flash -> restore firmware -> reboot. Full procedure in
  ../../../INDEX.md §8.B. Flash ../../../patches/heap_shift.vkp first if you are stacking
  several patches.