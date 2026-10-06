farid1991_patch-se/ — upstream patch-project clone (reference only)
==================================================================

1411 files, 16 041 329 B. A shallow clone of:

    https://github.com/farid1991/patch-se

~50 patch projects, each with full IAR sources, `Target/`, `xcl/`, `asm/`, `snapshots/` and a
README describing what the patch does and which models it was built against.

THIS CONTAINS NOTHING FOR THE Z550i
  Verified against the complete 1 410-file tree at publication prep: no path matches `z550`.
  There is no Z550 or DB2010 content here at all. The targets are DB3150, DB3210, DB3350,
  W580/W595/W980-class A2 phones, and similar.

  So treat this directory as what it is — the best available reference for the vkp file
  format and the elf2vkp build toolchain, which is why it is in this archive — not as a
  source of Z550i patches. If you are looking for patches that apply to this phone, they are
  all one directory up.

WHY IT IS HERE ANYWAY
  Because the vkp format is not documented anywhere that still exists, and these projects
  show real, working examples: how the comment header is laid out, how the optional `+base`
  line works, how offset/payload pairs are expressed, and what the `xcl` load map does. If
  you want to write a Z550i patch of your own, this is where you learn the shape of one.

  DYN_CONST, the ElfPack tables, are also here (`DBPlayer/DYN_CONST*` style assets in the
  per-project Targets), which is the same family of file as ../../elfpack/ZBin_template/Config/DYN_CONST.bin.

CLONE METADATA REMOVED
  The upstream `.git/` directory was stripped before publication. Its reflogs recorded the
  archiver's local git identity, which is not something to publish. The upstream project is
  still there, with full history:

      git clone https://github.com/farid1991/patch-se.git

  The commit this tree was cloned at is recorded in CLONE_METADATA.txt in this directory.