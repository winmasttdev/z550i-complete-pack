Extract_FS_tools/ — filesystem extraction and dumping
=====================================================

13 files, 805 648 B. Tools for getting at what is inside a firmware filesystem image, and for
converting between the formats.

    SEFStool4.exe                4th-generation SE filesystem tool: browse and extract from a
                                 dumped .fbn/.mbn filesystem
    main2raw.exe                 converts a dumped filesystem to raw form
    CodeClaw_DB3210_CID53_File_Xtractor_2_0/
                                 CodeClaw's extractor, plus a shortcuts/ folder of 8 example
                                 path definitions (alarm, camdriver, cust_pack, layouts,
                                 lighteffects, menu.ml, startup-shutdown animations, acoustic)

WHY YOU WOULD NEED ANY OF THIS
  To see what a firmware actually contains without flashing it — which is the only way to
  answer questions about R6GA004 or R6BA033, whose binaries nobody has. If you ever obtain
  one of those firmware images by any route, this is how you find out whether it is real and
  what is inside it before risking the phone.

  It is also how you would recover an acoustic folder from a dump, or diff two filesystem
  versions of the same firmware to see what a patch changed.

THE SHORTCUTS/ FOLDER IS THE INTERESTING PART
  Those 8 .txt files are not documentation — they are working path definitions. Each names a
  filesystem location the extractor should pull out. They are for a DB3210 CID53 phone, so
  the paths will not match a Z550i, but the format is the point: a list of paths in, a set of
  extracted files out. That is a shortcut to building your own for DB2010.

CODE CLAW IS DB3210, NOT DB2010
  The extractor is from a different platform. It still reads SE filesystem containers, so it
  is worth trying on a Z550i dump, but it is not a tool written for this phone. SEFStool4
  is the safer first attempt.

SAFER ROUTE FOR JUST LOOKING
  If you only want to read a filesystem off a phone without flashing anything, do not extract
  from a firmware image at all — use FAR Manager + SEFP 2 (../../plugins/sefp2w/) and read
  the live filesystem in bfs or ofs mode. That is read-only with respect to firmware and much
  harder to get wrong.

FLASH ORDER
  Nothing here is flashed. All of it is read-and-analyse tooling.
  Back up the phone's filesystem before experimenting: FAR + SEFP2, copy ifs/ to usb/, done.