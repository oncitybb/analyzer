note
	description: "Summary description for {INPUTING_EXPRESSION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	INPUTING_EXPRESSION
inherit
	EXPRESSION
create
	make
feature
	make
	do
		lte := "?"
	end

	output:STRING
	do
		Result := lte
	end
	feature
	accept ( v:VISITOR)
	do
	end
end
