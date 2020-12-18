
Goals
=====

In this chapter will introduce the basic classes that host behaviour of the logic system.

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
     disj: "|"
     unify: "="
     fresh: "fresh" [`var`] +  "." `goal`
     eta: "eta" "." `goal`
     var: "var" `Integer`
     predicate: `functor` [`var` | `value`] + "." `goal`
     functor: `String`
     value: `Object`
  
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

Succeed
-------

.. pharo:autoclass:: Succeed

  I am a goal that represent logical truth, in particular I encode the
  :token:`goalGrammar:succeed` production.

  When I am asked to extend a state to make it able to satisfy me, I just
  return as it is.

  .. pharo:autocompiledmethod:: GoalTest>>#testSucceed
    
    .. image:: _images/succeed.svg
      :align: center

Failed
------

.. pharo:autoclass:: Failed

  I am a goal that represent logical falsehood, in particular I encode the
  :token:`goalGrammar:failed` production.

  .. pharo:autocompiledmethod:: GoalTest>>#testFailed

    .. image:: _images/failed.svg
      :align: center

Unify
-----

.. pharo:autoclass:: Unify

  I am a goal that represent logical equality, in particular I encode the
  :token:`goalGrammar:unify` production.

  .. pharo:autocompiledmethod:: GoalTest>>#testUnifyThreeWithThree

    .. image:: _images/unify-three-with-three.svg
      :align: center

  .. pharo:autocompiledmethod:: GoalTest>>#testUnifyFourWithThree

    .. image:: _images/unify-four-with-three.svg
      :align: center

  .. pharo:autocompiledmethod:: GoalTest>>#testUnifySymmetry
  
    .. hlist::
      :columns: 3

      * .. image:: _images/unify-four-with-var.svg
          :align: left

      * .. image:: _images/unify-var-with-four.svg
          :align: left

      * .. image:: _images/unify-symmetry.svg
          :align: left

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
