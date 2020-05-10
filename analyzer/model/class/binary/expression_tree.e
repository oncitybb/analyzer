note
	description: "Summary description for {EXPRESSION_TREE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EXPRESSION_TREE

inherit
	EXPRESSION

create
	make_expression_tree, make, make_unary

feature
	make(input : EXPRESSION)
	do
		item := input
		lte := ""

	end

feature
	make_unary(input : EXPRESSION)
	local
		ques: INPUTING_EXPRESSION
		a : EXPRESSION_TREE
	do
		item := input
		create ques.make
		create a.make(ques)
		right := a
		lte := ""
	end


feature
	accept ( v:VISITOR)
	do
		v.replacetree (current)
--		check attached {TYPE_EVALUATOR} v as cccc then cccc.replacetree(current) end
		item.accept (v)
	end



feature
	make_expression_tree(input : EXPRESSION)
	local
		a : EXPRESSION_TREE
		b : EXPRESSION_TREE
		ques: INPUTING_EXPRESSION
		nil : NIL_EXPRESSION
	do
		create ques.make
		create nil.make
		create a.make(ques)
		create b.make(nil)
		item := input
		left := a
		right := b
		lte := ""
	end

feature
	item : EXPRESSION
	left : detachable like current
	right : detachable like current

feature

	subtree_left_has (v: EXPRESSION_TREE): BOOLEAN
			-- Does subtree contain `v'?
		local
			c: EXPRESSION_TREE
		do
			c := left
			if c /= Void then
				Result := c.has (v)
			end
		end

	subtree_right_has(v : EXPRESSION_TREE) : BOOLEAN
		local
			c : EXPRESSION_TREE
		do
			c := right
			if c /= Void then
				Result := c.has(v)

			end
		end

	has (v: EXPRESSION_TREE): BOOLEAN
			-- Does subtree include `v'?
 			-- (Reference or object equality,
			-- based on `object_comparison'.)
		do
			Result := v.item.output ~ item.output or subtree_right_has(v) or subtree_left_has(v)
		end


	changeleft(n: EXPRESSION_TREE)
		do
			left := n
		ensure
			leftsame:
				current.left ~ n
		end

	changeright(n: EXPRESSION_TREE)
		do
			right := n
		ensure
			rightsame:
				current.right ~ n
		end


	does_right_child_have_children : BOOLEAN

		do
			result := false
			if has_right and (righttree.has_left or righttree.has_right) then
				result := true
			end
		end

	does_left_child_have_children : BOOLEAN
		do
			result := false
			if has_left and (lefttree.has_left or lefttree.has_right) then
				result := true
			end
		end



	has_left:BOOLEAN
		do
			result := left /~ void and attached {EXPRESSION_TREE} left
		end

	has_right:BOOLEAN
		do
			result := right /~ void and attached {EXPRESSION_TREE} right
		end

	lefttree : EXPRESSION_TREE
	require
		hasleft:
			left /~ void
	do
		check attached {EXPRESSION_TREE} left as b then result := b end
	end

	righttree : EXPRESSION_TREE
	require
		hasleft:
			right /~ void

	do
		check attached {EXPRESSION_TREE} right as b then result := b end
	end

	replace(v : EXPRESSION)
	do
		item := v
	end

	replaceb(b : EXPRESSION_TREE; a : EXPRESSION_TREE) : BOOLEAN
	-- replace b
		require
			notempty:
				item /~ void
		do
			result := false
			if current.item.output ~ b.item.output then
				current.replace (a.item)
				item := a.item
				if a.has_left then
					current.changeleft (a.lefttree)
				end
				if a.has_right then
					current.changeright (a.righttree)
				end
				result := true
			end
			if current.has_left and current.subtree_left_has (b) and not result then
				check attached {EXPRESSION_TREE} left as l then result := l.replaceb(b,a) end
			end

			if current.has_right and current.subtree_right_has (b) and not result then
				check attached {EXPRESSION_TREE} right as r then result := r.replaceb(b,a) end
			end
		end


	output : STRING
	do
	 if left /~ void then
	 	check attached {EXPRESSION_TREE} left as l then
	 	check attached {EXPRESSION_TREE} right as r then
	 	Result := "(" + l.output  + " "+ current.item.output +" "+ r.output + ")"
	 	end
	 	end
	 elseif right /~ void then
	 	check attached {EXPRESSION_TREE} right as r then
	 	Result := "(" + current.item.output +" "+ r.output + ")"
	 	end
	 else
	 	Result := current.item.output
	 end

	end
end
