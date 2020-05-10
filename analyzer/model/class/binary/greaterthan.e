note
	description: "Summary description for {GREATERTHAN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GREATERTHAN

inherit
	EXPRESSION

create
	make_greaterthan
feature
	make_greaterthan
	do
		lte := ">"

	end
	output : STRING
	do
		Result := lte
	end


feature
	accept ( v:VISITOR)
	do
		v.visit_greater_than (current)
	end
end
