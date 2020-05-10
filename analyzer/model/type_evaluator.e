note
	description: "Summary description for {TYPE_EVALUATOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TYPE_EVALUATOR

inherit
	VISITOR

create
	make

feature
	type: EXPRESSION_TYPE

feature
	make
		do
			create {UNKNOWN_TYPE} type
			create tree.make(create {NIL_EXPRESSION}.make)
			create aoc.make_empty
		end
feature
	tree : EXPRESSION_TREE


feature
	replacetree(v : EXPRESSION_TREE)
	do
		tree := v.deep_twin
	end

	replaceaoc(v : ARRAY[CLASS_1])
	do
		aoc := v
	end


feature -- To Do: Implement Commands for visiting composite structure
	visit_integer_constant (e: INTEGER_CONSTANT)
		do
			type:= create {INTEGER_TYPE}.default_create
		end

	visit_boolean_constant (e: BOOLEAN_CONSTANT)
		do
			type:= create {BOOLEAN_TYPE}.default_create
		end
	visit_class_expression( e : CLASS_EXPRESSION)
		do
			type := create {CLASS_TYPE}.make (e.getclass)

		end


	visit_addition (e: ADDITION)
		local
			cal_left, cal_right: TYPE_EVALUATOR
		do
			create cal_left.make
			create cal_right.make
			tree.lefttree.accept (cal_left)
			tree.righttree.accept (cal_right)
			if
				attached {INTEGER_TYPE} cal_left.type and attached {INTEGER_TYPE} cal_right.type
			then
				type:= create {INTEGER_TYPE}.default_create
			else
				type:= create {UNKNOWN_TYPE}.default_create
			end
		end


	visit_subtraction (e: SUBTRACTION)
		local
			cal_left, cal_right: TYPE_EVALUATOR
		do
			create cal_left.make
			create cal_right.make
			tree.lefttree.accept (cal_left)
			tree.righttree.accept (cal_right)
			if
				attached {INTEGER_TYPE} cal_left.type and attached {INTEGER_TYPE} cal_right.type
			then
				type:= create {INTEGER_TYPE}.default_create
			else
				type:= create {UNKNOWN_TYPE}.default_create
			end
		end

	visit_multiplication (e: MULTIPLICATION)
		local
			cal_left, cal_right: TYPE_EVALUATOR
		do
			create cal_left.make
			create cal_right.make
			tree.lefttree.accept (cal_left)
			tree.righttree.accept (cal_right)
			if
				attached {INTEGER_TYPE} cal_left.type and attached {INTEGER_TYPE} cal_right.type
			then
				type:= create {INTEGER_TYPE}.default_create
			else
				type:= create {UNKNOWN_TYPE}.default_create
			end
		end

	visit_division (e: DIVISION)
		local
			cal_left, cal_right: TYPE_EVALUATOR
		do
			create cal_left.make
			create cal_right.make
			tree.lefttree.accept (cal_left)
			tree.righttree.accept (cal_right)
			if
				attached {INTEGER_TYPE} cal_left.type and attached {INTEGER_TYPE} cal_right.type
			then
				type:= create {INTEGER_TYPE}.default_create
			else
				type:= create {UNKNOWN_TYPE}.default_create
			end
		end

	visit_modulo (e: MODULO)
		local
			cal_left, cal_right: TYPE_EVALUATOR
		do
			create cal_left.make
			create cal_right.make
			tree.lefttree.accept (cal_left)
			tree.righttree.accept (cal_right)
			if
				attached {INTEGER_TYPE} cal_left.type and attached {INTEGER_TYPE} cal_right.type
			then
				type:= create {INTEGER_TYPE}.default_create
			else
				type:= create {UNKNOWN_TYPE}.default_create
			end
		end

	visit_equals (e: EQUALS)
		local
			cal_left, cal_right: TYPE_EVALUATOR
		do
			create cal_left.make
			create cal_right.make
			tree.lefttree.accept (cal_left)
			tree.righttree.accept (cal_right)
			if
				attached {INTEGER_TYPE} cal_left.type and attached {INTEGER_TYPE} cal_right.type
			then
				type:= create {INTEGER_TYPE}.default_create
			elseif
				attached {BOOLEAN_TYPE} cal_left.type and attached {BOOLEAN_TYPE} cal_right.type
			then
				type:= create {BOOLEAN_TYPE}.default_create
			elseif
				attached {CLASS_TYPE} cal_left.type and attached {CLASS_TYPE} cal_right.type
			then
				if cal_left.type.classs.out ~ cal_right.type.classs.out  then
					type:= create {CLASS_TYPE}.make (cal_left.type.classs.out)
				else
					type:= create {UNKNOWN_TYPE}.default_create
				end
			else
				type:= create {UNKNOWN_TYPE}.default_create
			end
		end

	visit_negation (e: NEGATION_EXPRESSION)
		local
			calculator: TYPE_EVALUATOR
		do
			create calculator.make
			tree.righttree.accept (calculator)
			if
				attached {BOOLEAN_TYPE} calculator.type
			then
				type:= create {BOOLEAN_TYPE}.default_create
			else
				type:= create {UNKNOWN_TYPE}.default_create
			end
		end


	visit_greater_than (e: GREATERTHAN)
		local
			cal_left, cal_right: TYPE_EVALUATOR
		do
			create cal_left.make
			create cal_right.make
			tree.lefttree.accept (cal_left)
			tree.righttree.accept (cal_right)
			if
				attached {INTEGER_TYPE} cal_left.type and attached {INTEGER_TYPE} cal_right.type
			then
				type:= create {BOOLEAN_TYPE}.default_create
			else
				type:= create {UNKNOWN_TYPE}.default_create
			end
		end


	visit_less_than (e: LESSTHAN)
		local
			cal_left, cal_right: TYPE_EVALUATOR
		do
			create cal_left.make
			create cal_right.make
			tree.lefttree.accept (cal_left)
			tree.righttree.accept (cal_right)
			if
				attached {INTEGER_TYPE} cal_left.type and attached {INTEGER_TYPE} cal_right.type
			then
				type:= create {BOOLEAN_TYPE}.default_create
			else
				type:= create {UNKNOWN_TYPE}.default_create
			end
		end


	visit_conjunction (e: ANDAND_EXPRESSION)
		local
			cal_left, cal_right: TYPE_EVALUATOR
		do
			create cal_left.make
			create cal_right.make
			tree.lefttree.accept (cal_left)
			tree.righttree.accept (cal_right)
			if
				attached {BOOLEAN_TYPE} cal_left.type and attached {BOOLEAN_TYPE} cal_right.type
			then
				type:= create {BOOLEAN_TYPE}.default_create
			else
				type:= create {UNKNOWN_TYPE}.default_create
			end
		end

	visit_disjunction (e: OROR_EXPRESSION)
		local
			cal_left, cal_right: TYPE_EVALUATOR
		do
			create cal_left.make
			create cal_right.make
			tree.lefttree.accept (cal_left)
			tree.righttree.accept (cal_right)
			if
				attached {BOOLEAN_TYPE} cal_left.type and attached {BOOLEAN_TYPE} cal_right.type
			then
				type:= create {BOOLEAN_TYPE}.default_create
			else
				type:= create {UNKNOWN_TYPE}.default_create
			end
		end


	visit_logical_negation (e: LOGICAL_NEGATION)
		local
			calculator: TYPE_EVALUATOR
		do
			create calculator.make
			tree.righttree.accept (calculator)
			if
				attached {BOOLEAN_TYPE} calculator.type
			then
				type := create {BOOLEAN_TYPE}.default_create
			else
				type := create {UNKNOWN_TYPE}.default_create
			end
		end

	visit_call_chain(e : CALLCHAIN)
		local
			m : ETF_MODEL_ACCESS
			mao : ETF_MODEL
			aocopy : ARRAY[CLASS_1]
			chain : ARRAY[STRING]
			currentclass : STRING
			currentclassindex : INTEGER
			currentfq : INTEGER
			currentfqweizhi : INTEGER
			failed    : BOOLEAN
			ii : INTEGER
			currenttype : STRING
			kk : INTEGER
		do
			mao := m.m
			aocopy := mao.aoc.deep_twin
			chain := e.list.deep_twin
			currentclass := e.quanjia.c
			from
				ii := 1
			until
				ii > aocopy.count
			loop
				if aocopy[ii].getname.out ~ currentclass then
					currentclassindex := ii
				end
				ii := ii + 1
			end
			currentfq := e.quanjia.fq
			currentfqweizhi := e.quanjia.fqweizhi
			failed := False
			type := create {UNKNOWN_TYPE}.default_create
			create currenttype.make_empty
			if currentfq = 1 and chain[1] ~ "Result" then

				if aocopy[currentclassindex].aoq[currentfqweizhi].rt.out ~ "INTEGER" then
					type := create {INTEGER_TYPE}.default_create
					currenttype  := "INTEGER"

				elseif aocopy[currentclassindex].aoq[currentfqweizhi].rt.out ~ "BOOLEAN" then
					 type := create {BOOLEAN_TYPE}.default_create
					 currenttype  := "BOOLEAN"
				elseif across aocopy is b some b.getname.out ~ aocopy[currentclassindex].aoq[currentfqweizhi].rt.out  end then
					across aocopy is b loop
					if
						b.getname.out ~ aocopy[currentclassindex].aoq[currentfqweizhi].rt.out
					then
						type := create {CLASS_TYPE}.make (aocopy[currentclassindex].aoq[currentfqweizhi].rt.out)
					end
					end
				end
				currenttype := "Result"
			elseif currentfq = 1 then
				across aocopy[currentclassindex].aoq[currentfqweizhi].aov is c loop
				if c.pn.out ~ chain[1].out then
					if c.pt.out ~ "BOOLEAN" then
						type := create {BOOLEAN_TYPE}.default_create
						currenttype  := "BOOLEAN"
					elseif c.pt.out ~ "INTEGER" then
						 type := create {INTEGER_TYPE}.default_create
						  currenttype  := "INTEGER"

					elseif across aocopy is b some b.getname.out ~ c.pt.out end then
						across aocopy is b loop
						if
							b.getname.out ~ c.pt.out
						then
							type := create {CLASS_TYPE}.make (b.getname.out)
						end
						end
					end
				end
				end
				across aocopy[currentclassindex].aov is c loop
				if c.pn.out ~ chain[1].out then
					if c.pt.out ~ "BOOLEAN" then
						type := create {BOOLEAN_TYPE}.default_create
						 currenttype  := "BOOLEAN"
					elseif c.pt.out ~ "INTEGER" then
						 type := create {INTEGER_TYPE}.default_create
						 currenttype  := "INTEGER"

					elseif across aocopy is b some b.getname.out ~ c.pt.out end then
						across aocopy is b loop
						if
							b.getname.out ~ c.pt.out
						then
							type := create {CLASS_TYPE}.make (b.getname.out)
						end
						end
					end
				end
				end
			else
				across aocopy[currentclassindex].aov is c loop
				if c.pn.out ~ chain[1].out then
					if c.pt.out ~ "BOOLEAN" then
						type := create {BOOLEAN_TYPE}.default_create
						currenttype  := "BOOLEAN"

					elseif c.pt.out ~ "INTEGER" then
						 type := create {INTEGER_TYPE}.default_create
						 currenttype  := "INTEGER"
					elseif across aocopy is b some b.getname.out ~ c.pt.out end then
						across aocopy is b loop
						if
							b.getname.out ~ c.pt.out
						then
							type := create {CLASS_TYPE}.make (b.getname.out)
						end
						end
					end
				end
				end
				across aocopy[currentclassindex].aof[currentfqweizhi].aov is c loop
				if c.pn.out ~ chain[1].out then
					if c.pt.out ~ "BOOLEAN" then
						type := create {BOOLEAN_TYPE}.default_create
						currenttype  := "BOOLEAN"
					elseif c.pt.out ~ "INTEGER" then
						 type := create {INTEGER_TYPE}.default_create
						  currenttype  := "INTEGER"
					elseif across aocopy is b some b.getname.out ~ c.pt.out end then
						across aocopy is b loop
						if
							b.getname.out ~ c.pt.out
						then
							type := create {CLASS_TYPE}.make (b.getname.out)
						end
						end
					end
				end
				end
			end




			from
				ii := 2
			until
				ii > chain.count or failed
			loop
				if not attached {CLASS_TYPE} type then
					failed := true
				else
					currentclass := type.classs.out
					from
						kk := 1
					until
						kk > aocopy.count
					loop
						if aocopy[kk].getname.out ~ currentclass.out then
							currentclassindex := kk

						end
						kk := kk + 1
					end

					type := create {UNKNOWN_TYPE}.default_create
					across aocopy[currentclassindex].aov is k loop
						if k.pn.out ~ chain[ii] then
							if k.pt.out ~ "BOOLEAN" then
								type := create {BOOLEAN_TYPE}.default_create
							elseif k.pt.out ~ "INTEGER" then
								type := create {INTEGER_TYPE}.default_create
							elseif across aocopy is b some b.getname.out ~ k.pt.out end then
								type := create {CLASS_TYPE}.make (k.pt.out)


							end
						end
					end

				end
				ii := ii + 1
			end
			if failed then
				type := create {UNKNOWN_TYPE}.default_create
			end


		end


feature
	aoc : ARRAY[CLASS_1]

end
