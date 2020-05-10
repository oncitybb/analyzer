note
	description: "Summary description for {ANDAND_EXPRESSION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ANDAND_EXPRESSION
inherit
--	EXPRESSION_TREE
	EXPRESSION


create
--	make_andand
	make
feature
--	make_andand
--	do
--		make_expression_tree(CURRENT)
--	end
	make
	do
		lte := "&&"
	end
	output : STRING
	do
		Result := lte
	end


feature
	accept ( v:VISITOR)
	do
		v.visit_conjunction (current)
	end
end
