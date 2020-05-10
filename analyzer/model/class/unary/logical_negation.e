note
	description: "Summary description for {LOGICAL_NEGATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LOGICAL_NEGATION
inherit
	EXPRESSION
create
	make
feature
	make
	do
		lte := "!"

	end
feature
	output: STRING
	do
		Result := "!"
	end
	feature
	accept ( v:VISITOR)
	do
		v.visit_logical_negation (current)
	end
end
