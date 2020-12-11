.. microkanrenst documentation master file, created by
   sphinx-quickstart on Fri Dec  4 16:32:28 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


Welcome to microkanrenst's documentation!
=========================================

This booklet is an extended description of :math:`\mu`-Kanren, a relational
interpreter formerly implemented in Scheme and ported in Smalltalk for the sake
of understanding and, of course, fun. It enjoys simplicity and elegance despite
the complex nature of logic systems; moreover, using an uniform but powerful
language such as Smalltalk it is possible to appreciate and benefit from both
properties.

.. toctree::
   :maxdepth: 2

   overview.rst
   goals.rst
   messages.rst

Observations
------------

Some observations follow about how this manual has been compiled. We
experimented with some approaches for documenting (possibly tricky) stuff about
programming. In particular, we feel the need to describe a framework that
allows us to do relational programming walking on a parallel track of the
Prolog's one. Such a system is implemented in Smalltalk, and we feel the
necessity to collect three main points into a single whole, namely source code,
visualizations, and documentation.


We take the opportunity to experiment with three diverse approaches:

- using a ``pragma``-oriented style that marks the messages we want to talk
  about to export their bare bone source code into markup files.
- Using a mixin-oriented style that writes the documenting comments typical of
  Smalltalk in *reStructuredText* format to fetch all the contents from within
  the image. This implies an extension of the Sphinx documenting system to
  interpret the content.
- Using GToolkit to render the documentation directly within the environment.
  In this case, there is no necessity to leave the working image and every
  content can be readily expressed as a comment of either a class or a method.


 
Indices and tables
==================

* :ref:`genindex`
* :ref:`search`
