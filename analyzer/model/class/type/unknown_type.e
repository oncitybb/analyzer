note
	description: "Summary description for {UNKNOWN_TYPE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	UNKNOWN_TYPE

inherit
	EXPRESSION_TYPE
	redefine
		default_create end

create
	default_create


feature

	default_create
	do
		create classs.make_empty
	end
end
