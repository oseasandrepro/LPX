--[[
    - Crie um gerador em Lua que abre um arquivo "teste.txt" e retorna todos os seus caracteres, um a um.
    - Use as seguintes funções:
    - io.open, f:read(1), f:close
]]--
function Ger_Aquivo()
	local fhandle = io.open("teste.txt", "r")
	
	while(true) do
		local ch = fhandle:read(1)
		if( ch == nil) then 
			break 
		end 
		coroutine.yield(ch)
	end
	
	fhandle:close()
end

for c in coroutine.wrap(Ger_Aquivo) do
    print(c)
end
