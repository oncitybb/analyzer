note
	description: "Summary description for {FEATURE_NAME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FEATURE_NAME

create
	make

feature
	make(n:STRING)
		do
			name:=n
			create aov.make_empty
			create expressions.make
		end

feature
	name:STRING
	aov: ARRAY[VAR_NAME]
	expressions : LINKED_LIST[TUPLE[name : STRING;  tree: EXPRESSION_TREE]]
--	vn: LINKED_LIST[STRING]
--	ve: LINKED_LIST[EXPRESSION]


feature
	getexp:LINKED_LIST[TUPLE[name : STRING;  tree: EXPRESSION_TREE]]
		do
			Result := expressions
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


	getname: STRING
		do
			result := name
		end


	inputpara(pn: STRING; pt : STRING)
		local
			a : VAR_NAME
		do
			create a.make (pn, pt)
			aov.force (a, aov.count + 1)
		end



end
