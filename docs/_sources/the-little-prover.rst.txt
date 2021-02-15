
The Little Prover
=================

This is an annotated version of :cite:`10.5555:2815652`, with examples coded in
Smalltalk on top of the logic language *µKanren*. To drive the reader through
the text, please keep in mind that the *main flow* is taken from the original
text, the smallest amount of text to give it sense and I don't deserve any
merit for that.  My own notes and additions will be emphasized in *note boxes*.
Therefore, if you would like to stick to the book be free to skip notes,
otherwise dig into them to get a deeper understanding of what's new from our
side.

Old Games, New Rules
--------------------

| Salutations.  What are salutations? Salutations are a fancy way of saying
  hello or good morning. 
| *Thank you, D. Friedman and C. Eastlung.*

What is ``(#ham cons: (#eggs cons: nil))`` equal to?

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 06

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_06

What value is the expression ``nil isAtom`` equal to?

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 11

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_11

Can we find a value for the expression ``(#ham cons: (#eggs cons: nil)) isAtom``?

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 14

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_14

.. note::

  The selector ``#isAtom`` has two implementors, both

  .. pharo:autocompiledmethod:: Object>>#isAtom

  and

  .. pharo:autocompiledmethod:: Cons>>#isAtom

  respectively. The latter is implemented in

  .. pharo:autoclass:: Cons

  that can be instantiated with

  .. pharo:autocompiledmethod:: Object>>#cons:
  .. pharo:autocompiledmethod:: Object>>#consedObject:


No matter what values the variables ``a`` and ``b`` have, the expression ``a
cons: b`` cannot produce an object ``c`` such that ``c isAtom`` evaluates to
``true``,

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 16

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_16

  .. image:: _images/TheLittleProverTest-test_chapter_01_OldGamesNewRules_frame_16.svg
    :align: center

where 

  .. pharo:autocompiledmethod:: TheLittleProver>>#isAtomConsº

.. note::

  Wait. Many new things pop up here, so digest one at the time. In order of occurrence:

  - the message

    .. pharo:autocompiledmethod:: BlockClosure>>#asGoalWithUnaryASTof:contextVariables:

    forwards, after ensuring that ``aBlock`` has exactly one statement, to

    .. pharo:autocompiledmethod:: BlockClosure>>#asGoalWithASTof:contextVariables:select:

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

  - the message

    .. pharo:autocompiledmethod:: Object>>#asLiteralRBNode

    allows us to lift a literal *value* to a literal *node*.

  - the message

    .. pharo:autocompiledmethod:: BlockClosure>>#<~~>

    is syntactic sugar to define a rewriting rule upto α-conversion over names
    of variables of both blocks, implemented in
   
    .. pharo:autocompiledmethod:: BlockClosure>>#substituteVariablesUsingSequenceableCollection:

    Such conversion if helpful to be free to use arbitrary names during a rewriting, as in
    :pharo:mref:`TheLittleProver>>#carConsº` for example.
 
As usual in logic, we can run a computation backward. The following test case
shows how to use ``#isAtomConsº`` to generate the receiver of ``#isAtom`` under
the constraint that the whole expression yields ``false`` when evaluated:

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_16_backward

  .. image:: _images/TheLittleProverTest-test_chapter_01_OldGamesNewRules_frame_16_backward.svg
    :align: center


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

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 19

We want to focus on ``(a cons: b) isAtom`` in the context of the outer ``#=`` message send

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_19

  .. image:: _images/TheLittleProverTest-test_chapter_01_OldGamesNewRules_frame_19.svg
    :align: center

.. note::

  The message

  .. pharo:autocompiledmethod:: BlockClosure>>#unaryRBNode

  is helpful to use a ``BlockClosure`` object as a container of its own code. 

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

Does the order of the arguments to ``#=`` matter?

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_49

where

  .. pharo:autocompiledmethod:: TheLittleProver>>#equalSwapº

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 55

What else the context ``y cons: (x cdr cons: y car) car = (x isAtom = false)``
equal to with focus on ``(x cdr cons: y car) car`` according to ``#carConsº``?
Recall that “is equal to” works in both directions.

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_55

.. index::
   single: The Little Prover; 01. Old Games, New Rules: frame 56

Can we use :pharo:mref:`TheLittleProver>>#carConsº`, then
:pharo:mref:`TheLittleProver>>#isAtomConsº` and finally then
:pharo:mref:`TheLittleProver>>#cdrConsº`? And what value is the final expression equal to?

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_01_OldGamesNewRules_frame_56

That is a good question. We do not know, but we have had fun playing with it so far!

Even Older Games
----------------

.. index::
   single: The Little Prover; 02. Even Older Games: frame 05

What is this expression *obviously* equal to?

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_02_EvenOlderGames_frame_05

where

  .. pharo:autocompiledmethod:: TheLittleProver>>#ifSameº

.. index::
   single: The Little Prover; 02. Even Older Games: frame 07

If :pharo:mref:`TheLittleProver>>#ifSameº` can start with an if expression and
end with a variable, then it *must* also be able to start with a variable and
end with an if expression. So ... what else is ``c`` equal to, according to
:pharo:mref:`TheLittleProver>>#ifSameº`?

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_02_EvenOlderGames_frame_07

.. index::
   single: The Little Prover; 02. Even Older Games: frame 15

Does the question message ``a = true`` tell us anything about the focus ``nil = nil ifTrue: [ a ] ifFalse: [ b ]``?

.. pharo:autocompiledmethod:: TheLittleProverTest>>#test_chapter_02_EvenOlderGames_frame_15

where

  .. pharo:autocompiledmethod:: TheLittleProver>>#ifTrueº

and

  .. pharo:autocompiledmethod:: TheLittleProver>>#equalIfº

respectively.
