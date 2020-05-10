note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_NUMERICAL_NEGATION
inherit
	ETF_NUMERICAL_NEGATION_INTERFACE
create
	make
feature -- command
	numerical_negation
    	do
			-- perform some update on the model state
			if not model.in_assignment_instruction_specified then
				model.setuperror("An assignment instruction is not currently being specified")
			else
				model.numerical_negation
			end
			model.default_update
			etf_cmd_container.on_change.notify ([Current])
    	end

end
