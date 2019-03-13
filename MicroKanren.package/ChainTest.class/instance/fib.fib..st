helpers
fib: m fib: n 
	^ m cons: [self fib: n fib: m+n]