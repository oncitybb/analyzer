note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_TYPE_CHECK
inherit
	ETF_TYPE_CHECK_INTERFACE
create
	make
feature -- command
	type_check
    	do
			-- perform some update on the model state
			if model.in_assignment_instruction_specified then
				model.setuperror ("An assignment instruction is currently being specified for routine "+ model.current_fea +" in class "+ model.current_cla)
			else

				model.type_check

    		end
			model.default_update
			etf_cmd_container.on_change.notify ([Current])
    	end

end
