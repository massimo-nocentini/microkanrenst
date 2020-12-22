
Goals
=====

This chapter introduces the basic classes that host the behaviour of the logic system.
We proceed in increasing order of complexity for the concepts that will be introduced,
starting from a formal and abstract definition of a language that drives the companion
implementation.

Goal
----

.. pharo:autoclass:: Goal

  I and my subclasses represent a small language to construct logical relations. Formally, I adhere to
  the following abstract grammar:
  
  .. productionlist:: goalGrammar
     goal: `failed` | `succeed` | `binary_goal` |
         : `fresh` | `eta` | `predicate`
     failed: "Ø"
     succeed: "✓"
     binary_goal: `goal` (`disj` | `conj` | `unify` | "!" | "≠") `goal`
     disj: "|º"
     conj: "&º"
     unify: "=º"
     fresh: "fresh" [`var`] +  "." `goal`
     eta: "eta" "." `goal`
     var: "var" `Integer`
     predicate: `functor` [`value`] + "." `goal`
     functor: `String` "º"
     value: `var` | `Object`
  
  My subclasses have the responsibility to encode combinations of arbitrary
  goals and, consequently, shouldn't be stateful with respect to a logical
  computation. It follows that their sole instance variables have to related to
  goal construction.

  .. warning::
  
    Any reference to external objects beyond this scope should be prohibited.
  
  To be polymorphic with me, the :ref:`onState-message-label` has to be
  implemented, as my subclasses have to; as the reader will understand
  following the referenced doc, it is the main message to respond to in order
  to get into a logic computation.


Failed
------

.. pharo:autoclass:: Failed

  I am a goal that represent logical falsehood, in particular I encode the
  :token:`goalGrammar:failed` production. The simpler way to create me
  is to send the adapting message `#asGoal` to `false`, as follows

  .. pharo:autocompiledmethod:: GoalTest>>#testFailed

    .. image:: _images/GoalTest-testFailed.svg
      :align: center

Succeed
-------

.. pharo:autoclass:: Succeed

  I am a goal that represent logical truth, in particular I encode the
  :token:`goalGrammar:succeed` production. The simpler way to create me
  is to send the adapting message `#asGoal` to `true`, as follows

  .. pharo:autocompiledmethod:: GoalTest>>#testSucceed
    
    .. image:: _images/GoalTest-testSucceed.svg
      :align: center

    where

    .. pharo:autocompiledmethod:: Var_class>>#tautology


Fresh
-----

.. pharo:autoclass:: Fresh

  I am a goal that represent logical falsehood, in particular I encode the
  :token:`goalGrammar:fresh` production.

  .. pharo:autocompiledmethod:: GoalTest>>#testFreshFailed

    .. image:: _images/GoalTest-testFreshFailed.svg
      :align: center

  .. pharo:autocompiledmethod:: GoalTest>>#testFreshSucceed

    .. image:: _images/GoalTest-testFreshSucceed.svg
      :align: center

    where

      .. pharo:autocompiledmethod:: Integer>>#asReifiedVar

  .. pharo:autocompiledmethod:: GoalTest>>#testFreshMultipleVars

    .. image:: _images/GoalTest-testFreshMultipleVars.svg
      :align: center

  Moreover, we can also use a block without arguments in order to 
  postpone the computation, for instance to support recursive goals such as

  .. pharo:autocompiledmethod:: GoalTest>>#testEtaRaw

    where

    .. pharo:autocompiledmethod:: GoalTest>>#eternity:

Unify
-----

.. pharo:autoclass:: Unify

  I am a goal that represent logical equality, in particular I encode the
  :token:`goalGrammar:unify` production.

  .. pharo:autocompiledmethod:: GoalTest>>#testUnifyThreeWithThree

    .. image:: _images/GoalTest-testUnifyThreeWithThree.svg
      :align: center

    where

      .. pharo:autocompiledmethod:: Object>>#unifyo
      
      and

      .. pharo:autocompiledmethod:: Object>>#unifyWith:

  .. pharo:autocompiledmethod:: GoalTest>>#testUnifySymmetryFourWithVar

    .. image:: _images/GoalTest-testUnifySymmetryFourWithVar.svg
      :align: center
      
  .. pharo:autocompiledmethod:: GoalTest>>#testUnifySymmetryVarWithFour

    .. image:: _images/GoalTest-testUnifySymmetryVarWithFour.svg
      :align: center
      
  .. pharo:autocompiledmethod:: GoalTest>>#testUnifyWithTopmostSharing

    .. image:: _images/GoalTest-testUnifyWithTopmostSharing.svg
      :align: center

  .. pharo:autocompiledmethod:: GoalTest>>#testUnifyWithTopmostWithoutSharing

    .. image:: _images/GoalTest-testUnifyWithTopmostWithoutSharing.svg
      :align: center

  .. pharo:autocompiledmethod:: GoalTest>>#testUnifyWithTopmostSharingWithRepetition

    .. image:: _images/GoalTest-testUnifyWithTopmostSharingWithRepetition.svg
      :align: center

  .. pharo:autocompiledmethod:: GoalTest>>#testUnifySharing

    .. image:: _images/GoalTest-testUnifySharing.svg
      :align: center

  The previous examples show unifications that can be satisfied; on the 
  contrary, when two objects cannot be equal for any substitution we have
  a `Failed` goal holding the counterexample, such as

  .. pharo:autocompiledmethod:: GoalTest>>#testUnifyFourWithThree

    .. image:: _images/GoalTest-testUnifyFourWithThree.svg
      :align: center


Disj
----

.. pharo:autoclass:: Disj

  I am a goal that represent logical union, in particular I encode the
  :token:`goalGrammar:disj` production. 
  
  On the one hand, `false asGoal` is the neutral element for disjunction, so
  that both

  .. pharo:autocompiledmethod:: GoalTest>>#testDisjFalseFalse

    .. image:: _images/GoalTest-testDisjFalseFalse.svg
      :align: center

  and

  .. pharo:autocompiledmethod:: GoalTest>>#testDisjTrueFalse

    .. image:: _images/GoalTest-testDisjTrueFalse.svg
      :align: center

  behave as usual in logic. On the other hand,

  .. pharo:autocompiledmethod:: GoalTest>>#testDisjTrueTrue

    .. image:: _images/GoalTest-testDisjTrueTrue.svg
      :align: center

  surprises with *two* solutions instead of one because `true asGoal |º b` doesn't bypass
  the exploration of the goal `b`. For the sake of clarity, two solutions are provided both by
  
  .. pharo:autocompiledmethod:: GoalTest>>#testDisjThreeWithVarOrThreeWithVar

    .. image:: _images/GoalTest-testDisjThreeWithVarOrThreeWithVar.svg
      :align: center

  and 

  .. pharo:autocompiledmethod:: GoalTest>>#testDisjThreeWithThreeOrFourWithVar

    .. image:: _images/GoalTest-testDisjThreeWithThreeOrFourWithVar.svg
      :align: center

  which leaves the variable unbound in the leftmost path.  Disjunction is
  *commutative*, so that both

  .. pharo:autocompiledmethod:: GoalTest>>#testDisjThreeWithVarOrFourWithVar

    .. image:: _images/GoalTest-testDisjThreeWithVarOrFourWithVar.svg
      :align: center

  and

  .. pharo:autocompiledmethod:: GoalTest>>#testDisjFourWithVarOrThreeWithVar

    .. image:: _images/GoalTest-testDisjFourWithVarOrThreeWithVar.svg
      :align: center

  are satisfied by the same set of substitutions or, in other words, have the
  same paths connecting the leaves to the roots.  Disjunction is *associative*,
  so that both trees

  .. pharo:autocompiledmethod:: GoalTest>>#testDisjThreeFourThenFive

    .. image:: _images/GoalTest-testDisjThreeFourThenFive.svg
      :align: center

  and

  .. pharo:autocompiledmethod:: GoalTest>>#testDisjThreeThenFourFive

    .. image:: _images/GoalTest-testDisjThreeThenFourFive.svg
      :align: center

  have the same set of leaves but different branching structures. 



Conj
----

.. pharo:autoclass:: Conj

  I am a goal that represent logical intersection, in particular I encode the
  :token:`goalGrammar:conj` production. 
  
  On the one hand, `true asGoal` is the neutral element for disjunction, so
  that both

  .. pharo:autocompiledmethod:: GoalTest>>#testConjTrueTrue

    .. image:: _images/GoalTest-testConjTrueTrue.svg
      :align: center

  and

  .. pharo:autocompiledmethod:: GoalTest>>#testConjTrueThreeWithThree

    .. image:: _images/GoalTest-testConjTrueThreeWithThree.svg
      :align: center

  are succeeding goals. On the other hand, `false asGoal` makes a conjunction
  `false asGoal &º b` failing for any goal `b`, as in

  .. pharo:autocompiledmethod:: GoalTest>>#testConjFalseThreeWithVar

    .. image:: _images/GoalTest-testConjFalseThreeWithVar.svg
      :align: center

  Conjunctions essentially propagates unified values by the left hand side
  subgoal into the right hand side one; for the sake of clarity, the following
  examples attempts to unify the same variable with two different values yielding
  no solution (but providing the corresponding counterexample)

  .. pharo:autocompiledmethod:: GoalTest>>#testConjThreeFour

    .. image:: _images/GoalTest-testConjThreeFour.svg
      :align: center

  while the following one succeeds and also shows the commutativity of the operator

  .. pharo:autocompiledmethod:: GoalTest>>#testConjSymmetry

    .. image:: _images/GoalTest-testConjSymmetry.svg
      :align: center

  In the same spirit, the following examples shows two succeeding conjunctions, the 
  former introduces a variable in a nested goal,

  .. pharo:autocompiledmethod:: GoalTest>>#testConjThreeFresh

    .. image:: _images/GoalTest-testConjThreeFresh.svg
      :align: center

  the latter, introduces both variables in the topmost goal

  .. pharo:autocompiledmethod:: GoalTest>>#testConjThreeFourWithTwoVars

    .. image:: _images/GoalTest-testConjThreeFourWithTwoVars.svg
      :align: center

  Sharing among variables can be shown with both a succeeding example

  .. pharo:autocompiledmethod:: GoalTest>>#testConjSucceedingSharing

    .. image:: _images/GoalTest-testConjSucceedingSharing.svg
      :align: center

  and a failing one

  .. pharo:autocompiledmethod:: GoalTest>>#testConjFailingSharing

    .. image:: _images/GoalTest-testConjFailingSharing.svg
      :align: center

  Finally, the combination of a failing conjunction with a succeeding
  disjunction produces the following computation

  .. pharo:autocompiledmethod:: GoalTest>>#testConjDisj

    .. image:: _images/GoalTest-testConjDisj.svg
      :align: center
