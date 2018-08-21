import os
import sys
from wcs.workflows import Workflow

folder_path = '/usr/share/imio-ts-aes/workflows/'
for fichier in os.listdir(folder_path):
    if fichier[-4:] == ".wcs":
        fd = open("{}{}".format(folder_path, fichier))
        wf = Workflow.import_from_xml(fd)
        wf.store()
