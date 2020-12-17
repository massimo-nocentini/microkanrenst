
.. _onState-message-label:

``onState:`` message
====================

This is *the fundamental* message of the whole system because it allows us to explore
the search space of both succeeding and failing states.

.. pharo:autocompiledmethod:: Goal>>#onState:
.. pharo:autocompiledmethod:: Fresh>>#onState:
.. pharo:autocompiledmethod:: Fresh>>#onState:withVars:
.. pharo:autocompiledmethod:: Eta>>#onState:

``onState:afterPushingGoal:`` message
=====================================

.. pharo:autocompiledmethod:: Goal>>#onState:afterPushingGoal:
.. pharo:autocompiledmethod:: Succeed>>#onState:afterPushingGoal:

  :param State aState: a state containing a substitution that makes the top goal true.
  :return: a stream of exactly one state, namely ``aState``.
  :rtype: Srfi41Stream
  
  The invariant that governs me can be stated as follows:
  
  .. code-block:: smalltalk
  
    SBRAL new asState in: [:s | (true asGoal onState: s) car == s ] >>> true
  
  or even better with the test case
  
  .. pharo:autocompiledmethod:: GoalTest>>#testSucceedInvariant

.. pharo:autocompiledmethod:: Disj>>#onState:afterPushingGoal:
.. pharo:autocompiledmethod:: Conj>>#onState:afterPushingGoal:

  .. pharo:autocompiledmethod:: Goal>>#onState:forGoal:fromConj:
  
    .. pharo:autocompiledmethod:: Goal>>#popGoalFromPathOfState:forConj:
    .. pharo:autocompiledmethod:: Succeed>>#popGoalFromPathOfState:forConj:

  .. pharo:autocompiledmethod:: Failed>>#onState:forGoal:fromConj:

.. pharo:autocompiledmethod:: Unify>>#onState:afterPushingGoal:
.. pharo:autocompiledmethod:: Cond>>#onState:afterPushingGoal:
.. pharo:autocompiledmethod:: IfPure>>#onState:afterPushingGoal:
.. pharo:autocompiledmethod:: Suspended>>#onState:afterPushingGoal:



The following should be put in another file.

.. pharo:autocompiledmethod:: Goal_class>>#unify:with:

