note
	description: "Summary description for {CLASS_1}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CLASS_1

create
	make

feature
	make(n : STRING)
	do
		create aof.make_empty
		create aov.make_empty
		CREATE aoq.make_empty
		name := n
		create shunxu.make
	end

feature
	aof: ARRAY[FEATURE_NAME]
	aoq: ARRAY[QUERY_NAME]
	aov: ARRAY[VAR_NAME]
	name: STRING
	numattribu :  INTEGER
	numqueries : INTEGER
	numcommands: INTEGER
	shunxu : LINKED_LIST[INTEGER]

feature
	getname:STRING
		do
			Result := name

		end

	output: STRING
		do
			create Result.make_empty
			Result.append("%N" + "    " + name + "%N")

			Result.append("      Number of attributes: " + aov.count.out + "%N")
			across aov is att loop Result.append("        + "+ att.out + "%N") end

        	Result.append("      Number of queries: " + aoq.count.out + "%N")


        	across aoq is que loop
        	Result.append("        + "+ que.out)
        	if not que.aov.is_empty then
        		Result.append("(")
        		across que.aov is c loop Result.append( c.pt + ", ") end
        		Result.remove_tail (2)
        		Result.append(")")
        		Result.append (": " + que.rt)
        	else
        		result.append (": " + que.rt)
        	end
        	Result.append ("%N")
        	end


        	Result.append("      Number of commands: " + aof.count.out)


        	across aof is fea loop
        	Result.append("%N"+"        + "+ fea.getname)
        	if not fea.aov.is_empty then
        		Result.append("(")
        		across fea.aov is c loop Result.append( c.pt + ", ") end
        		Result.remove_tail (2)
        		Result.append(")")
        	end
        	end
		end
end
