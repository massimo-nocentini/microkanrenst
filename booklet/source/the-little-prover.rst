
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

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_16_byBlockClosure

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
  :pharo:mref:`TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_16_byBlockClosure`
  can also be written as

  .. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_16_byCompiledMethod

  where, on one hand, code as data is

  .. pharo:autocompiledmethod:: TheLittleProverTest>>#consª:isAtomª:

  on the other hand, the rewriting is 

  .. pharo:autocompiledmethod:: TheLittleProverTest>>#consº:isAtomº:

  Observe that the previous two messages allow us to establish a nomenclature
  for when we use a ``CompiledMethod`` both for its source code and for
  evaluating (a predicate ``BlockClosure`` in this case) by appending a ``ª``
  and ``º`` to each keyword in the selector, respectively. This scheme has the
  advantage to use the same words while being able to discriminate their usage.
  We mix the two approaches freely from now on.
 
As usual in logic, we can run a computation backward. The following test case
shows how to use ``#isAtomConsº`` to generate the receiver of ``#isAtom`` under
the constraint that the whole expression yields ``false`` when evaluated:

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_16_backward

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 19

We want to focus on ``(a cons: b) isAtom`` in the context of the outer ``=`` message send

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_19

  where

  .. pharo:autocompiledmethod:: TheLittleProverTest>>#flapjackEqualsConsª:isAtomª:

  and

  .. pharo:autocompiledmethod:: TheLittleProverTest>>#flapjackEqualsConsº:isAtomº:

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 21

Precisely. In that case, what value is ``#flapjack = false`` equal to?

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_21

  where

  .. pharo:autocompiledmethod:: TheLittleProverTest>>#flapjackNilFalseº

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 28

What value is the expression ``((p cons: q) car cons: nil) cdr isAtom`` equal to?

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_28

  where

  .. pharo:autocompiledmethod:: TheLittleProver>>#carConsº
  .. pharo:autocompiledmethod:: TheLittleProver>>#cdrConsº
  .. pharo:autocompiledmethod:: TheLittleProver>>#isAtomNilº

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 32

That took three steps. Can we do it in fewer?

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_32

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 44

What is the value of the context ``((x cons: y) = (x cons: y) cons: (#and cons:
(#crumpets cons: nil))) car`` with focus on ``(x cons: y) = (x cons: y)``?

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_44

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 46

And, of course, the second step is easy.

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_46

.. note::

  Please note that ``#equalSameº`` also binds variables during its evaluation

  .. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_46_variablesBindingByEqualSameº

  morever, variables binding can be performed manually as in

  .. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_46_variablesBindingManually

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 49

Does the order of the arguments to equal matter?

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_49

where

  .. pharo:autocompiledmethod:: TheLittleProver>>#equalSwapº

