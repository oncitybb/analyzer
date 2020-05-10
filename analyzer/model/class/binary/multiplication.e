note
	description: "Summary description for {MULTIPLICATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MULTIPLICATION
inherit
	EXPRESSION



create
	make_multiplication
feature
	make_multiplication
	do
		lte := "*"
	end
	output : STRING
	do
		Result := "*"
	end

feature
	accept ( v:VISITOR)
	do
		v.visit_multiplication (current)
	end
end
