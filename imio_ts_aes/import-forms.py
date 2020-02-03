import os
import sys

from wcs.formdef import FormDef

lst_formdef_ids = []
lst_formdef_names = []
conv = lambda x: int(x)
for formdef in FormDef.select():
    lst_formdef_names.append(formdef.name)
    lst_formdef_ids.append(formdef.id)
folder_path = "{0}/forms/".format(sys.argv[1])
for fichier in os.listdir(folder_path):
    if fichier[-4:] == ".wcs":
        fd = open("{}{}".format(folder_path, fichier))
        try:
            formdef = FormDef.import_from_xml(fd, charset="utf-8", include_id=False)
        except Exception:
            print "!!! ECHEC IMPORT FILE : {}".format(fichier)
            formdef = None
        if formdef is not None:
            if formdef.name not in lst_formdef_names:
                formdef.disabled = False
                try:
                    if len(lst_formdef_ids) < 1:
                        new_id = 1
                    else:
                        new_id = int(sorted(lst_formdef_ids, key=conv)[-1]) + 1
                    lst_formdef_ids.append(new_id)
                    formdef.id = new_id
                    formdef.store()
                except Exception:
                    print "import error : {}".format(formdef.id)
