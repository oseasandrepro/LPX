--[[
- Crie um gerador em Lua que recebe o nome de um arquivo e retorna
todos os seus tokens, um a um.
- O gerador deve receber como argumento o nome do arquivo e também os geradores dos exercícios T.1 e T.2.
- O novo gerador deve usar os geradores recebidos como base para ler os caracteres do arquivo ignorando espaços e comentários.

- Arcabouço da co-rotina:

local co3 = coroutine.create(function (filename, co1, co2)
    local ok, c = coroutine.resume(co1, filename)
    ... -- loop com yield(c), chama co2 para próximos caracteres
end)

- Arcabouço da função principal para testar a co-rotina:

local ok, c = coroutine.resume(co3, "teste.txt", co1, co2)  -- primeiro resume
...
   ok,c = coroutine.resume(co3) -- outros resumes em um loop
...
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


local co2 = coroutine.create(
	function (filename, co1)
		local ok, c = coroutine.resume(co1, filename)
		while( not (c==nil) ) do
			if( c=='#') then
				while c~='\n' do
					ok, c = coroutine.resume(co1)
				end
			elseif( c == ' ') then
				while c== ' ' do
					ok, c = coroutine.resume(co1)
				end
			elseif(c == '\n' or c=='\t') then
				ok, c = coroutine.resume(co1)
			else
				coroutine.yield(c)
				ok, c = coroutine.resume(co1)
			end
			
		end
	end
)

function isDigit(ch)
	local buff = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'}
	for i=1,#buff do
		if( buff[i] == ch ) then return true end
	end
	
	return false
end

function isOperator(ch)
	local buff = {'+', '-', '*', '/'}
	for i=1,#buff do
		if( buff[i] == ch ) then return true end
	end
	
	return false
end


local co3 = coroutine.create(
	function (filename, co1, co2)
		local state = 0
		local token = ''
		local ok, c = coroutine.resume(co2, filename, co1) 
		while( c ~= nil ) do
		if( state==0 and c  == '=') then
			coroutine.yield(token)
			coroutine.yield(c)
			state = 1
			token = ''
		elseif (state == 1 and isDigit(c)) then
			if token == '' then token = c else token = token..c end
		elseif(state == 1 and isOperator(c) ) then
			coroutine.yield(token)
			coroutine.yield(c)
			token = ''
		elseif( state == 1 and (not isDigit(c)) and (not isOperator(ch)) ) then
			coroutine.yield(token)
			token = c
			state = 0
		else
			if token == '' then token = c else token = token..c end
		end
		ok, c = coroutine.resume(co2)
			
			
		end
		coroutine.yield(token)
	end
)

local ok, c = coroutine.resume(co3, "teste.txt", co1, co2)  -- primeiro resume
print('.....')
while( not (c==nil) ) do
    print(c)
    ok, c = coroutine.resume(co3)
end
print('.....')
