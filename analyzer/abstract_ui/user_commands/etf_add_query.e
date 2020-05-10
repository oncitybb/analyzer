note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_QUERY
inherit
	ETF_ADD_QUERY_INTERFACE
create
	make
feature -- command
	add_query(cn: STRING ; fn: STRING ; ps: ARRAY[TUPLE[pn: STRING; pt: STRING]] ; rt: STRING)
		require else
			add_query_precond(cn, fn, ps, rt)
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
				not model.conflict_cpn(ps).is_empty
			then
				model.setuperror ("Parameter names clash with existing classes: " + model.conflict_cpn(ps))
			elseif
				not model.duplicatecheck(ps).is_empty
			then
				model.setuperror ("Duplicated parameter names: " + model.duplicatecheck(ps))
			elseif
				not model.para_type_not_exist(ps).is_empty
			then
				model.setuperror ("Parameter types do not refer to primitive types or existing classes: " + model.para_type_not_exist (ps) )
			elseif
				not model.att_type_not_exist(rt).is_empty
			then
				model.setuperror ("Return type does not refer to a primitive type or an existing class: " + model.att_type_not_exist (rt))
			else
				model.add_query (cn, fn, ps, rt)
    		end
			model.default_update
			etf_cmd_container.on_change.notify ([Current])
    	end

end
