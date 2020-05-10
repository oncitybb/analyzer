note
	description: "Summary description for {OROR_EXPRESSION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OROR_EXPRESSION
inherit
	EXPRESSION

create
	make_oror
feature
	make_oror
	do
		lte := "||"
	end
	output : STRING
	do
		Result := lte
	end
	feature
	accept ( v:VISITOR)
	do
		v.visit_disjunction (current)
	end
end
