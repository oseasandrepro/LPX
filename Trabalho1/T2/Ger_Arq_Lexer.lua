--[[
- Crie um gerador em Lua que recebe o nome de um arquivo e retorna todos os seus caracteres, um a um, ignorando espaços e comentários.
- Um comentário se inicia com o caractere `#` e termina com o fim da linha.
- O gerador deve receber como argumento o nome do arquivo e também o gerador do exercício T.1.
- O novo gerador deve usar o gerador recebido como base para ler os caracteres do arquivo, um a um.

- Arcabouço da co-rotina:

local co2 = coroutine.create(function (filename, co1)
    local ok, c = coroutine.resume(co1, filename)
    ... -- loop com yield(c)
end)

- Arcabouço da função principal para testar a co-rotina:

local ok, c = coroutine.resume(co2, "teste.txt", co1)  -- primeiro resume
...
   ok,c = coroutine.resume(co2) -- outros resumes em um loop
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

local ok, c = coroutine.resume(co2, "teste.txt", co1)  -- primeiro resume

print('.....')
while( not (c==nil) ) do
    print(c)
    ok, c = coroutine.resume(co2)
end
print('.....')
