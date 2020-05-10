note
	description: "Summary description for {VAR_NAME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	VAR_NAME

inherit
	ANY
	redefine
		out end

create
	make

feature
	pn : STRING
	pt : STRING

feature
	make(n : STRING; t : STRING)
		do
			pn := n
			pt := t
		end

	getname: STRING
		do
			result:=pn
		end


feature
	out: STRING
		do
			create Result.make_empty
			result.append(pn + ": " + pt)
		end

end
