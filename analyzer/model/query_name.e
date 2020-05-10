note
	description: "Summary description for {QUERY_NAME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	QUERY_NAME

inherit
	ANY
	redefine
		out
	end

create
	make

feature
	make(qn:STRING; return_type:STRING)
		do
			name := qn
			rt := return_type
			create aov.make_empty
			create expressions.make
		end

feature
	name: STRING
	rt: STRING
	aov: ARRAY[VAR_NAME]
	expressions : LINKED_LIST[TUPLE[name : STRING;  tree: EXPRESSION_TREE]]

feature
	getexp: LINKED_LIST[TUPLE[name : STRING;  tree: EXPRESSION_TREE]]
		do
			Result := expressions
--			tree.
		end


	add_variable(n:STRING; e:EXPRESSION)
		local
			a : EXPRESSION_TREE
		do
			create a.make (e)
			expressions.force ([n,a])
		end

	changelasttree(newtree : EXPRESSION_TREE)
		do
			expressions.go_i_th (expressions.count)
			expressions.replace ([expressions.item.name, newtree])

		end


	getname:STRING
		do
			result :=  name
		end

	inputpara(pn: STRING; pt : STRING)
		local
			a : VAR_NAME
		do
			create a.make (pn, pt)
			aov.force (a, aov.count + 1)
		end


	out: STRING
		do
			create Result.make_empty
			result.append ( name)
		end

end
