testing
satisfiedSafe
	"Answer true if the condition for a safe prime is satisfied."
	satisfied ifFalse: [^ false].
	1 to: primes size do: [:i |
		((residues at: i) * 2 + 1 \\ (primes at: i)) isZero ifTrue: [^ false]].
	^ true 