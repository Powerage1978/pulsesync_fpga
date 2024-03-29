# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import os
import sys

from distutils.util import convert_path

sys.path.insert(0, os.path.abspath('../src/'))


# -- Project information -----------------------------------------------------

project = 'Pulsesync FPGA'
copyright = '2023, Skytem Surveys Aps'
author = 'Skytem Surveys ApS'

# The full version, including alpha/beta/rc tags
main_ns = {}
ver_path = convert_path('../version.py')
with open(ver_path) as ver_file:
    exec(ver_file.read(), main_ns)
release = main_ns['__version__']

# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'sphinx.ext.napoleon',
    'sphinx.ext.autodoc',
    'myst_parser',
    'sphinxcontrib.plantuml',
    'sphinxcontrib.wavedrom',
    'sphinxcontrib.cairosvgconverter',
    'sphinx_rtd_theme',
    'sphinx.ext.graphviz'
]

# 'sphinxcontrib.rsvgconverter',

napoleon_google_docstring = True
napoleon_numpy_docstring = True

# Add any paths that contain templates here, relative to this directory.
#templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
html_theme = "sphinx_rtd_theme"

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
#html_static_path = ['_static']

html_show_sourcelink = False

source_suffix = {
    '.rst': 'restructuredtext',
    '.txt': 'markdown',
    '.md': 'markdown',
}

# Path to plantuml.jar file
plantuml = 'java -jar /opt/plantuml/plantuml.jar -tpng'

# Wavedrom -------------------------------------------------------------
wavedrom_html_jsinline = False
render_using_wavedrompy = True

# LaTeX ----------------------------------------------------------------
latex_elements = {
    'preamble': r'''
\newcolumntype{\Yl}[1]{>{\raggedright\arraybackslash}\Y{#1}}
\newcolumntype{\Yr}[1]{>{\raggedleft\arraybackslash}\Y{#1}}
\newcolumntype{\Yc}[1]{>{\centering\arraybackslash}\Y{#1}}
''',
}
