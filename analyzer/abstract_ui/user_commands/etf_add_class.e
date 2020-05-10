note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_CLASS
inherit
	ETF_ADD_CLASS_INTERFACE
create
	make
feature -- command
	add_class(cn: STRING)
		require else
			add_class_precond(cn)
    	do
    		if model.in_assignment_instruction_specified then
				model.setuperror ("An assignment instruction is currently being specified for routine "+ model.current_fea +" in class "+ model.current_cla)
			elseif
				model.existing_class (cn)
			then
				model.setuperror ( cn +" is already an existing class name")
			else
				model.add_class (cn)
    		end
			-- perform some update on the model state
			model.default_update
			etf_cmd_container.on_change.notify ([Current])
    	end

end
