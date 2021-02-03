
The Little Prover
=================

*Salutations. What are salutations? Salutations are a fancy way of saying hello
or good morning.* Thank you, D. Friedman and C. Eastlung.

Old Games, New Rules
--------------------

It is a known fact that

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 06

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_06

holds. On one hand,

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 11

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_11

  where 

  .. pharo:autocompiledmethod:: Object>>#isAtom

On the other hand,

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 14

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_14

  where 

  .. pharo:autocompiledmethod:: Cons>>#isAtom

  together with the corresponding class definition 

  .. pharo:autoclass:: Cons

Of course,

  "No matter what values the variables ``a`` and ``b`` have, ``#cons:`` cannot produce an atom."

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 16

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_16_byGoalWithBlock

Wait. Many new things pop up here, so digest one at the time. In order of occurrence:

- the message

  .. pharo:autocompiledmethod:: BlockClosure>>#asGoalWithUnaryASTof:

  forwards, after ensuring that ``aBlock`` has exactly one statement, to

  .. pharo:autocompiledmethod:: BlockClosure>>#asGoalWithASTof:select:

  in order to produce a ``FreshRB`` goal that, overriding the message 
  
  .. pharo:autocompiledmethod:: FreshRB>>#onState:withVars:

  has the responsibility to lift block's code variables 
   
  .. pharo:autocompiledmethod:: RBNode>>#substituteVariablesUsingDictionary:
  .. pharo:autocompiledmethod:: RBProgramNodeSubstitutionVisitor>>#visitTemporaryNode:
   
  to ``RBNode`` objects that support unification

  .. pharo:autoclass:: RBLogicVariableNode

  via

  .. pharo:autocompiledmethod:: Var>>#asRBNode

  lying on :pharo:cref:`Var` eventually.

- the predicate

  .. pharo:autocompiledmethod:: TheLittleProver>>#isAtomConsº

  allows us to perform the rewriting, where

  .. pharo:autocompiledmethod:: Object>>#asLiteralRBNode

- the message

  .. pharo:autocompiledmethod:: BlockClosure>>#unaryRBNode

  is helpful to use a ``BlockClosure`` object as a container of its own code. 

.. note::

  Since a ``CompiledMethod`` responds to

  .. pharo:autocompiledmethod:: CompiledMethod>>#sourceNode

  the initial test
  :pharo:mref:`TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_16_byGoalWithBlock`
  can also be written as

  .. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_16_byGoal

  where, on one hand, code as data is

  .. pharo:autocompiledmethod:: TheLittleProverTest>>#ª:consIsAtom:

  on the other hand, the rewriting is 

  .. pharo:autocompiledmethod:: TheLittleProverTest>>#ˆ:consIsAtom:
