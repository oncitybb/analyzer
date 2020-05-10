note
	description: "Summary description for {SUBTRACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SUBTRACTION
inherit
	EXPRESSION



create
	make_subtraction
feature
	make_subtraction
	do
		lte := "-"
	end
	output : STRING
	do
		Result := lte
	end

	feature
	accept ( v:VISITOR)
	do
		v.visit_subtraction (current)
	end
end
