note
	description: "Summary description for {CLASS_EXPRESSION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CLASS_EXPRESSION
inherit
	EXPRESSION
create
	make

feature
	classs:  STRING
feature
	make(name : STRING)
	do
		lte := name
		create classs.make_empty
	end

	replace(k : STRING)
		do
			classs := k
		end

	getclass :STRING
	do
		result := classs
	end

	output : STRING
		do
			result := lte.out
		end

	accept(v : VISITOR)
	do
		v.visit_class_expression (current)
	end
end
