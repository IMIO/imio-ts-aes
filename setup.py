#! /usr/bin/env python
# -*- coding: utf-8 -*-

import glob
import os
import re
import subprocess
import sys

from setuptools.command.install_lib import install_lib as _install_lib
from distutils.command.sdist import sdist
from distutils.cmd import Command
from setuptools import setup, find_packages

def get_version():
    if os.path.exists('VERSION'):
        version_file = open('VERSION', 'r')
        version = version_file.read()
        version_file.close()
        return version
    if os.path.exists('.git'):
        p = subprocess.Popen(['git', 'describe', '--dirty', '--match=v*'], stdout=subprocess.PIPE)
        result = p.communicate()[0]
        if p.returncode == 0:
            version = result.split()[0][1:]
            version = version.replace('-', '.')
            return version
    return '0'


class install_lib(_install_lib):
    def run(self):
        self.run_command('compile_translations')
        _install_lib.run(self)


setup(
    name='imio-ts-aes',
    version=get_version(),
    author='Christophe Boulanger',
    author_email='christophe.boulanger@imio.be',
    packages=find_packages(),
    include_package_data=True,
    url='https://github.com/IMIO/imio-ts-aes',
    classifiers=[
        'Development Status :: 2 - Pre-Alpha',
        'Environment :: Web Environment',
        'Framework :: Django',
        'Intended Audience :: Developers',
        'Programming Language :: Python :: 2',
    ],
    install_requires=['django>=1.7, <1.9',
        ],
    zip_safe=False
)
