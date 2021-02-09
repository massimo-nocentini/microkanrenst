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
# sys.path.insert(0, os.path.abspath('.'))

# -- Project information -----------------------------------------------------

project = 'µkanrenst'
copyright = '2020, Massimo Nocentini'
author = 'Massimo Nocentini'


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
        'sphinx.ext.mathjax',
        'sphinx.ext.githubpages',
        'sphinxcontrib.pharodomain',
        #'sphinx_rtd_theme',
]

# The following configuation values concerns the Pharo domain.
pharo_json_export_filenames = [
        'source/microkanren-core-messages.json',
        'source/microkanren-core-tests.json',
        'source/microkanren-sexp-tests.json',
        'source/microkanren-RBNodes-theory.json',
        'source/microkanren-the-little-prover-predicates.json',
        'source/microkanren-the-little-prover-chapter-01.json',
        'source/microkanren-the-little-prover-chapter-02.json',
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = []


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinxdoc'
html_theme = 'classic'
#html_theme = 'python_docs_theme'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

html_theme_options = {
    "sidebarwidth": "20%",
    "body_max_width": "80%",
    "globaltoc_collapse": False,
    "stickysidebar": True,
}

