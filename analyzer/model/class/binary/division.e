note
	description: "Summary description for {DIVISION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DIVISION
inherit
--	EXPRESSION_TREE
	EXPRESSION


create
	make_division
feature
	make_division
	do
		lte := "/"
	end
	output : STRING
	do
		Result := lte
	end

feature
	accept ( v:VISITOR)
	do
		v.visit_division (current)
	end
end
