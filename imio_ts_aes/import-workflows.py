import os
import sys
from wcs.workflows import Workflow

folder_path = '{0}/workflows/'.format(sys.argv[1])
for fichier in os.listdir(folder_path):
    if fichier[-4:] == ".wcs":
        fd = open("{}{}".format(folder_path, fichier))
        wf = Workflow.import_from_xml(fd)
        wf.store()
