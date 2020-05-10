note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_ASSIGNMENT_INSTRUCTION
inherit
	ETF_ADD_ASSIGNMENT_INSTRUCTION_INTERFACE
create
	make
feature -- command
	add_assignment_instruction(cn: STRING ; fn: STRING ; n: STRING)
		require else
			add_assignment_instruction_precond(cn, fn, n)
    	do
			-- perform some update on the model state
			if model.in_assignment_instruction_specified then
				model.setuperror ("An assignment instruction is currently being specified for routine "+ model.current_fea +" in class "+ model.current_cla)

			elseif
				not model.existing_class (cn)
			then
				model.setuperror (cn + " is not an existing class name")
			elseif
			    model.existing_var(fn, cn)
			then
				model.setuperror ("Attribute "+ fn + " in class " + cn+ " cannot be specified with an implementation")
			elseif
				not model.fea_type_not_exist(cn,fn).is_empty
			then
				model.setuperror (fn+" is not an existing feature name in class "+cn)
			else
				model.add_assignment_instruction (cn, fn, n)
    		end
			model.default_update
			etf_cmd_container.on_change.notify ([Current])
    	end

end
