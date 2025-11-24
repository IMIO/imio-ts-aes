#! /usr/bin/env python
# -*- coding: utf-8 -*-

from setuptools import setup
from setuptools.command.install import install
from setuptools import setup, find_packages
import os


class inst(install):
    def run(self):
        install.run(self)
        path = (
            os.getcwd().replace(" ", r"\ ").replace("(", r"\(").replace(")", r"\)")
            + "/bin/"
        )
        os.system("sh " + path + "install_imio-ts-aes.sh")

version = "3.0.1"

setup(
    name="imio-ts-aes",
    author="iA.Téléservices",
    author_email="support-ts@imio.be",
    packages=find_packages(),
    include_package_data=True,
    url="https://github.com/IMIO/imio-ts-aes",
    classifiers=[
        "Development Status :: 2 - Pre-Alpha",
        "Environment :: Web Environment",
        "Framework :: Django",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: GNU Affero General Public License v3 or later (AGPLv3+)",
        "Operating System :: OS Independent",
        "Programming Language :: Python",
        "Programming Language :: Python :: 2",
        "Programming Language :: Python :: 3.5.3",
    ],
    zip_safe=False,
    cmdclass={
        "inst": inst,
    },
)

