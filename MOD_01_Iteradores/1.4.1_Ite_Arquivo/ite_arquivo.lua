--[[ 
    - Crie um iterador em Lua que receba o nome de um arquivo e retorne todas as suas palavras.
    - Assuma que o arquivo só contém letras, espaços, ou linhas.
--]]

function Split (inputstr, sep)
   local t={}
   for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(t, str)
   end
   return t
end

function Arquivo(filename)
    local current_line = {}
    local file = assert(io.open(filename, "r"))
    return function(fhandle, index)
    	
    	if( index <= #current_line) then
    		return index+1, current_line[index]
    	else
    		local index = 1
    		local aux = fhandle:read("*line")
    		if( aux == nil) then
    			fhandle:close()
    			return nil, nil
    		else
    			current_line = Split(aux, " ")
    			return index+1, current_line[index]
    		end
    			
    	end
    end, file, 1
end


for w,v in Arquivo("x.txt") do
    print(v)
end

