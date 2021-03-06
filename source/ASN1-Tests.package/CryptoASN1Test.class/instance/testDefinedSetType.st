tests - defined types
testDefinedSetType

	| bytes obj newBytes type |
	((ASN1Module name: #test) set: #TestSet mapping: ASN1TestModel)
		add: #testSlot1 type: #ASN1BooleanType;
		yourself.

	type := (ASN1Module name: #test) find: #TestSet.
	bytes := #(49 3 1 1 255).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = true).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).
