note
	description: "Summary description for {VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	VISITOR
feature -- To Do: Declare Commands for visiting composite structure
	visit_integer_constant (e: INTEGER_CONSTANT)
		deferred
		end
	replacetree(v : EXPRESSION_TREE)
		deferred
		end

	visit_boolean_constant (e: BOOLEAN_CONSTANT)
		deferred
		end

	visit_addition (e: ADDITION)
		deferred
		end

	visit_subtraction (e: SUBTRACTION)
		deferred
		end

	visit_multiplication (e: MULTIPLICATION)
		deferred
		end

	visit_division (e: DIVISION)
		deferred
		end

	visit_equals (e: EQUALS)
		deferred
		end

	visit_negation (e: NEGATION_EXPRESSION)
		deferred
		end

	visit_greater_than (e: GREATERTHAN)
		deferred
		end

	visit_less_than (e: LESSTHAN)
		deferred
		end

	visit_conjunction (e: ANDAND_EXPRESSION)
		deferred
		end

	visit_disjunction (e: OROR_EXPRESSION)
		deferred
		end

	visit_modulo (e: MODULO)
		deferred
		end

	visit_logical_negation (e: LOGICAL_NEGATION)
		deferred
		end
	visit_call_chain(e : CALLCHAIN)
		deferred
		end
	visit_class_expression(e: CLASS_EXPRESSION)
		deferred
		end
end
