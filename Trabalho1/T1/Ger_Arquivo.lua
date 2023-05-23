--[[
    Adapte o 2.3.1 da seguinte forma:
    - Crie um gerador em Lua que recebe o nome de um arquivo e retorna todos os seus caracteres, um a um.
    - Use as seguintes funções:
    - io.open, f:read(1), f:close

    - Em vez de usar wrap, agora será necessário usar as funções de co-rotinas create/resume:
    - O primeiro resume deve passar o nome do arquivo.
    - Os outros resume não devem passar nada.
    - Os yield devem retornar os caracteres do arquivo.
]]--

local co1 = coroutine.create(
	function (filename)
	    local f = io.open(filename)
	    while(true) do
			local ch = f:read(1)
			if( ch == nil) then break end 
			coroutine.yield(ch)
		end
		f:close()
	end
)


local ok, c = coroutine.resume(co1, "teste.txt")

while( not (c==nil) ) do
    print(ok,c)
    ok, c = coroutine.resume(co1)
end


