note
	description: "Summary description for {CALLCHAIN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CALLCHAIN
inherit
	EXPRESSION
create
	make_callchain

feature
	hahahaha : STRING
	list : ARRAY[STRING]
	quanjia: TUPLE[c : STRING; fq: INTEGER; fqweizhi : INTEGER; daimahang: INTEGER]
feature
	make_callchain(list1 : ARRAY[STRING]; quan : TUPLE[c : STRING; fq: INTEGER; fqweizhi : INTEGER; daimahang: INTEGER])
	do
		quanjia := quan
		list := list1
		hahahaha := ""
		across list is a loop hahahaha := hahahaha + "." + a end
		hahahaha.remove (1)
		lte := hahahaha
	end
	output:STRING
	do
		Result := lte
	end

	feature
	accept ( v:VISITOR)
	do
		v.visit_call_chain(current)
	end
end
