note
	description: "Summary description for {TYPE_CHECK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TYPE_CHECK

INHERIT
	VISITOR

create
	make

feature
		--status
	type_correct: BOOLEAN
	tree : EXPRESSION_TREE
	aoc : ARRAY[CLASS_1]

feature
	make
		do
			type_correct := FALSE
			create tree.make(create {NIL_EXPRESSION}.make)
			create aoc.make_empty
		end


	replacetree(v : EXPRESSION_TREE)
	do
		tree := v
	end

	replaceaoc(v : ARRAY[CLASS_1])
	do
		aoc := v
	end

feature -- To Do: Implement Commands for visiting composite structure
	visit_integer_constant (e: INTEGER_CONSTANT)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc.deep_twin)
			e.accept (type_cal)
			if
				attached {INTEGER_TYPE} type_cal.type
			then
				type_correct := true
			end
		end

	visit_class_expression( e : CLASS_EXPRESSION)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc.deep_twin)
			e.accept (type_cal)
			if
				attached {CLASS_TYPE} type_cal.type
			then
				type_correct := true
			end
		end

	visit_addition (e: ADDITION)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc.deep_twin)
			e.accept (type_cal)
			if
				attached {INTEGER_TYPE} type_cal.type
			then
				type_correct := true
			end
		end


	visit_subtraction (e: SUBTRACTION)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc.deep_twin)
			e.accept (type_cal)
			if
				attached {INTEGER_TYPE} type_cal.type
			then
				type_correct := true
			end
		end

	visit_multiplication (e: MULTIPLICATION)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc.deep_twin)
			e.accept (type_cal)
			if
				attached {INTEGER_TYPE} type_cal.type
			then
				type_correct := true
			end
		end

	visit_division (e: DIVISION)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc.deep_twin)
			e.accept (type_cal)
			if
				attached {INTEGER_TYPE} type_cal.type
			then
				type_correct := true
			end
		end

	visit_equals (e: EQUALS)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc.deep_twin)
			e.accept (type_cal)
			if
				attached {INTEGER_TYPE} type_cal.type
			then
				type_correct := true
			elseif
				attached {BOOLEAN_TYPE} type_cal.type
			then
				type_correct := true
			elseif
				attached {CLASS_TYPE} type_cal.type
			then
				type_correct := true
			end
		end

	visit_negation (e: NEGATION_EXPRESSION)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc.deep_twin)
			e.accept (type_cal)
			if
				attached {INTEGER_TYPE} type_cal.type
			then
				type_correct := true
			elseif
				attached {BOOLEAN_TYPE} type_cal.type
			then
				type_correct := true
			end
		end

	visit_greater_than (e: GREATERTHAN)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc.deep_twin)
			e.accept (type_cal)
			if
				attached {BOOLEAN_TYPE} type_cal.type
			then
				type_correct := true
			end
		end

	visit_less_than (e: LESSTHAN)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc.deep_twin)
			e.accept (type_cal)
			if
				attached {BOOLEAN_TYPE} type_cal.type
			then
				type_correct := true
			end
		end

	visit_modulo (e: MODULO)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc.deep_twin)
			e.accept (type_cal)
			if
				attached {INTEGER_TYPE} type_cal.type
			then
				type_correct := true
			end
		end

	visit_boolean_constant (e: BOOLEAN_CONSTANT)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc.deep_twin)
			e.accept (type_cal)
			if
				attached {BOOLEAN_TYPE} type_cal.type
			then
				type_correct := true
			end
		end


	visit_conjunction (e: ANDAND_EXPRESSION)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc.deep_twin)
			e.accept (type_cal)
			if
				attached {BOOLEAN_TYPE} type_cal.type
			then
				type_correct := true
			end
		end

	visit_disjunction (e: OROR_EXPRESSION)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc.deep_twin)
			e.accept (type_cal)
			if
				attached {BOOLEAN_TYPE} type_cal.type
			then
				type_correct := true
			end
		end

	visit_logical_negation (e: LOGICAL_NEGATION)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc.deep_twin)
			e.accept (type_cal)
			if
				attached {BOOLEAN_TYPE} type_cal.type
			then
				type_correct := true
			end
		end

	visit_call_chain(e : CALLCHAIN)
		local
			type_cal : TYPE_EVALUATOR
		do
			create type_cal.make
			type_cal.replacetree (tree)
			type_cal.replaceaoc(aoc)
			e.accept (type_cal)
			if
				attached {BOOLEAN_TYPE} type_cal.type
			then
				type_correct := true
			end
		end
end
