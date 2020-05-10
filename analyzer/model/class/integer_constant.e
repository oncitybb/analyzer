note
	description: "Summary description for {INTEGER_CONSTANT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	INTEGER_CONSTANT
inherit
	EXPRESSION
create
	make
feature
	int : INTEGER
feature
	make(b : INTEGER)
	do
		lte := b.out
		int := b
	end

	output : STRING
	do
		Result := int.out
	end

feature
	item(b : INTEGER)
	do
		int := b
		lte := b.out
	end



	feature
	accept ( v:VISITOR)
	do
		v.visit_integer_constant (current)
	end
end
