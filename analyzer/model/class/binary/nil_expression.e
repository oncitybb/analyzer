note
	description: "Summary description for {NIL_EXPRESSION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NIL_EXPRESSION
inherit
	EXPRESSION
create
	make
feature
	make
	do
		lte := "nil"
	end

	output:STRING
	do
		Result := "nil"
	end

	feature
	accept ( v:VISITOR)
	do

	end
end
