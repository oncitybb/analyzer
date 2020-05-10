note
	description: "Summary description for {MODULO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MODULO
inherit
	EXPRESSION

create
	make_modulo
feature
	make_modulo
	do
		lte := "%""
	end
	output : STRING
	do
		Result := "%""
	end

feature
	accept ( v:VISITOR)
	do
		v.visit_modulo (current)
	end
end
