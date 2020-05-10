note
	description: "Summary description for {EQUALS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EQUALS
inherit
	EXPRESSION

create
	make_equals
feature
	make_equals
	do

		lte := "=="
	end
	output : STRING
	do
		Result := lte
	end

feature
	accept ( v:VISITOR)
	do
		v.visit_equals (current)
	end
end
