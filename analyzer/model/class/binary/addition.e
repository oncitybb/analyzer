note
	description: "Summary description for {ADDITION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ADDITION

inherit
--	EXPRESSION_TREE
	EXPRESSION


create
--	make_addition
	make
feature
--	make_addtion
--	do
--		make_expression_tree(CURRENT)
--	end
	make
	do
		lte := "+"
	end
	output : STRING
	do
		Result := "+"
	end

feature
	accept ( v:VISITOR)
	do
		v.visit_addition (Current)
	end
end
