
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
     binary_goal: `goal` (`disj` | "&" | `unify` | "!" | "≠") `goal`
     disj: "|º"
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

    where

    .. pharo:autocompiledmethod:: False>>#asGoal

      and, in turn, where

      .. pharo:autocompiledmethod:: Goal_class>>#fail

  I am rendered as

  .. image:: _images/GoalTest-testFailed.svg
    :align: center

  in computation tree visualizations.

Succeed
-------

.. pharo:autoclass:: Succeed

  I am a goal that represent logical truth, in particular I encode the
  :token:`goalGrammar:succeed` production. The simpler way to create me
  is to send the adapting message `#asGoal` to `true`, as follows

  .. pharo:autocompiledmethod:: GoalTest>>#testSucceed
    
    where, on one hand,

    .. pharo:autocompiledmethod:: True>>#asGoal

      and, in turn, where

      .. pharo:autocompiledmethod:: Goal_class>>#succeed

    On the other hand,  

    .. pharo:autocompiledmethod:: Var_class>>#tautology

  I am rendered as

  .. image:: _images/GoalTest-testSucceed.svg
    :align: center

  in computation tree visualizations.

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

  .. pharo:autocompiledmethod:: GoalTest>>#testFreshMultipleVars

    .. image:: _images/GoalTest-testFreshMultipleVars.svg
      :align: center

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

  .. pharo:autocompiledmethod:: GoalTest>>#testUnifyFourWithThree

    .. image:: _images/GoalTest-testUnifyFourWithThree.svg
      :align: center

  .. pharo:autocompiledmethod:: GoalTest>>#testUnifySymmetryFourWithVar

    .. image:: _images/GoalTest-testUnifySymmetryFourWithVar.svg
      :align: center
      
  .. pharo:autocompiledmethod:: GoalTest>>#testUnifySymmetryVarWithFour

    .. image:: _images/GoalTest-testUnifySymmetryVarWithFour.svg
      :align: center
      
  .. pharo:autocompiledmethod:: GoalTest>>#testUnifyWithTopmostSharing

    .. image:: _images/GoalTest-testUnifyWithTopmostSharing.svg
      :align: center

  .. pharo:autocompiledmethod:: GoalTest>>#testUnifyWithTopmostSharingWithRepetition

    .. image:: _images/GoalTest-testUnifyWithTopmostSharingWithRepetition.svg
      :align: center

  .. pharo:autocompiledmethod:: GoalTest>>#testUnifyWithTopmostWithoutSharing

    .. image:: _images/GoalTest-testUnifyWithTopmostWithoutSharing.svg
      :align: center

  .. pharo:autocompiledmethod:: GoalTest>>#testUnifySharing

    .. image:: _images/GoalTest-testUnifySharing.svg
      :align: center


Disj
----

.. pharo:autoclass:: Disj

  I am a goal that represent logical union, in particular I encode the
  :token:`goalGrammar:disj` production.

  .. pharo:autocompiledmethod:: GoalTest>>#testDisj

Predicates
==========


.. pharo:autocompiledmethod:: GoalTest>>#testFivesByPredicate

  .. image:: _images/fives-by-predicate.svg
    :align: center
