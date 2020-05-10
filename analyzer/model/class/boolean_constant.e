note
	description: "Summary description for {BOOLEAN_CONSTANT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOOLEAN_CONSTANT
inherit
	EXPRESSION
create
	make
feature
	bool : BOOLEAN
feature
	make(c:BOOLEAN)
	do
		lte := c.out
		bool := c
	end

	output : STRING
	do
		Result := bool.out
	end

feature
	item(b : BOOLEAN)
	do
		bool := b
		lte := b.out
	end


	feature
	accept ( v:VISITOR)
	do
		v.visit_boolean_constant (current)
	end
end
