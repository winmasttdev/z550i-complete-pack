SE_Layout_Editor/ — Sony Ericsson Layout Editor
================================================

6 files, 555 327 B. SELE is the editor for a phone's standby-screen layout: the icon
positions, the shortcut targets, which menu items appear where.

    SELE.exe          176 640 B   the application
    SELE_lib.dll      226 304 B   its library
    Layouts/          4 example layouts:
                        S500_W580_K790_K800_K810_K818.xml
                        T650_K770_W880.xml
                        W830_W850.xml
                        W888.xml

WHAT THE LAYOUTS SHOW YOU
  A layout is XML. It describes the standby screen declaratively: which icons, at which
  coordinates, bound to which application IDs. Reading one is the fastest way to understand
  how a SE standby screen is put together, and the four examples cover a phone family, a
  Walkman phone, an ultra-thin model and a featurephone.

NOTHING HERE IS Z550I-SPECIFIC
  No Z550i layout is in this archive — none was ever found, and building one from scratch
  means enumerating the Z550i's icon and shortcut ID tables, which needs a firmware dump.
  The Z550i's own standby layout is inside
  ../../firmware/Z550_R6CA009_FS_RUSSIA_RED49.fbn if you want to extract it; see
  ../Extract_FS_tools/ for how.

WHY IT IS HERE ANYWAY
  The format and the tool are the reusable parts. If you ever get a Z550i filesystem dump,
  this is the tool that turns the layout inside it into something readable and editable.

FLASH ORDER
  None. SELE reads and writes layout files on a PC. The result would eventually reach the
  phone through a firmware or filesystem write, but that step is separate, and it is a
  filesystem copy (FAR + SEFP2), not a flash.