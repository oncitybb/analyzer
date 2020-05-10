note
	description: "Summary description for {BOOLEAN_TYPE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOOLEAN_TYPE


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
