
Messages
========

This page will describe some messages that are at the heart of the logic system.

To check the representation of the content, we also use this simple Python function:

:Date: 2001-08-16
:Version: 1
:Authors: - Me
          - Myself
          - I
:Indentation: Since the field marker may be quite long, the second
   and subsequent lines of the field body do not have to line up
   with the first line, but they must be indented relative to the
   field name marker, and they must line up with each other.
:Parameter i: integer



.. py:function:: a(v)
  
  This is the fist line.

  :param State aState: a state containing the substitution to refine.
  :return: a stream of states with (possibly) extended substitutions.
  :rtype: Srfi41Stream

  return 4



