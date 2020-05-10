note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_CALL_CHAIN
inherit
	ETF_ADD_CALL_CHAIN_INTERFACE
create
	make
feature -- command
	add_call_chain(chain: ARRAY[STRING])
    	do
			-- perform some update on the model state
			if not model.in_assignment_instruction_specified then
				model.setuperror("An assignment instruction is not currently being specified")
			elseif
				chain.is_empty
			then
				model.setuperror ("Call chain is empty")
			else
				model.add_call_chain (chain)
			end
			model.default_update
			etf_cmd_container.on_change.notify ([Current])
    	end

end
