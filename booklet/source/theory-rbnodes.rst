

``RBNode`` theory
=================

Consider the message

.. pharo:autocompiledmethod:: RBProgramNodeSendsoVisitor>>#visitMessageNode:

We list the selectors that it sends with

.. pharo:autocompiledmethod:: RBNodePredicatesTest>>#testSenderoForCompiledMethod

where

.. pharo:autocompiledmethod:: CompiledMethod>>#sendso

delegates to

.. pharo:autocompiledmethod:: RBNode>>#sendso

``BlockClosure`` objects also allow us to retrieve their own representation in terms of ``RBNode`` objects, 
therefore they respond to

.. pharo:autocompiledmethod:: BlockClosure>>#sendso

as ``CompiledMethod`` objects do, so the initial test can be rephrased for them as

.. pharo:autocompiledmethod:: RBNodePredicatesTest>>#testSenderoForBlockClosure

Observe that ``aBlock`` sends ``#visitMessageNode:`` to ``super`` even though
``RBNodePredicatesTest superclass`` doesn't implement ``#visitMessageNode:``,
as the last ``#deny:`` checks. This shows that we use the block ``aBlock`` just
for its own AST discarding its computation.
