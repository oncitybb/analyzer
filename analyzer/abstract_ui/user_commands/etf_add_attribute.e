note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_ATTRIBUTE
inherit
	ETF_ADD_ATTRIBUTE_INTERFACE
create
	make
feature -- command
	add_attribute(cn: STRING ; fn: STRING ; ft: STRING)
		require else
			add_attribute_precond(cn, fn, ft)
    	do
			-- perform some update on the model state
			if model.in_assignment_instruction_specified then
				model.setuperror ("An assignment instruction is currently being specified for routine "+ model.current_fea +" in class "+ model.current_cla)
			elseif
				not model.existing_class (cn)
			then
				model.setuperror (cn + " is not an existing class name")
			elseif
				model.existing_feature (cn,fn)
			then
				model.setuperror (fn + " is already an existing feature name in class " + cn)
			elseif
				not model.att_type_not_exist(ft).is_empty
			then
				model.setuperror ("Return type does not refer to a primitive type or an existing class: " + model.att_type_not_exist (ft))
			else
				model.add_attribute (cn, fn, ft)
    		end
			model.default_update
			etf_cmd_container.on_change.notify ([Current])
    	end

end
