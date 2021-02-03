

``RBNode`` theory
=================

``sendso`` predicate
--------------------

Consider the message

.. pharo:autocompiledmethod:: RBProgramNodeSendsoVisitor>>#visitMessageNode:

We list the selectors that it sends with

.. pharo:autocompiledmethod:: RBNodePredicatesTest>>#testSenderoForCompiledMethod

where

.. pharo:autocompiledmethod:: CompiledMethod>>#sendso

delegates to

.. pharo:autocompiledmethod:: RBNode>>#sendso

``BlockClosure`` objects also allow us to retrieve their own representation in
terms of ``RBNode`` objects, therefore they respond to

.. pharo:autocompiledmethod:: BlockClosure>>#sendso

as ``CompiledMethod`` objects do, so the initial test can be rephrased for them as

.. pharo:autocompiledmethod:: RBNodePredicatesTest>>#testSenderoForBlockClosure

Observe that ``aBlock`` sends ``#visitMessageNode:`` to ``super`` even though
``RBNodePredicatesTest superclass`` doesn't implement ``#visitMessageNode:``,
as the last ``#deny:`` checks. This shows that we use the block ``aBlock`` just
for its own AST discarding its computation.

As corner cases, both for the empty block

.. pharo:autocompiledmethod:: RBNodePredicatesTest>>#testSenderoForEmptyBlockClosure

and for the identity block

.. pharo:autocompiledmethod:: RBNodePredicatesTest>>#testSenderoForIdentityBlockClosure

``sendso`` yields no solutions at all.

Because we are training on a logic engine, it makes sense to use ``#sendso``
backwards, as the following test shows

.. pharo:autocompiledmethod:: RBNodePredicatesTest>>#testSenderoBackwards


This should be a link :ref:`Succeed <pharo-class-succeed>`. and :ref:`onState: <pharo-compiledMethod-Goal-onState->`.

