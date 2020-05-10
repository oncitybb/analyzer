note
	description: "Summary description for {LESSTHAN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LESSTHAN
inherit
	EXPRESSION


create
	make_lessthan
feature
	make_lessthan
	do
		lte := "<"

	end
	output : STRING
	do
		Result := "<"
	end

feature
	accept ( v:VISITOR)
	do
		v.visit_less_than (current)
	end
end
