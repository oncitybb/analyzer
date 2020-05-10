note
	description: "Summary description for {CLASS_TYPE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CLASS_TYPE

inherit
	EXPRESSION_TYPE
	redefine
		default_create,replace end

create
	default_create,make


feature

	default_create
	do
		create classs.make_empty
	end

	make(v : STRING)
	do
		create classs.make_empty
		classs := v
	end
	replace(n : STRING)
	do
		classs := n
	end

end
