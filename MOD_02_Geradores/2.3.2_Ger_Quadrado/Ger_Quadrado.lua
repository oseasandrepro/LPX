--[[
	Refaça 1.2.2 usando Gerador em Lua
	-Considere um personagem que se move em um mapa nas 4 direções: “dir”, “esq”, “cima”, “baixo”.
	-Crie um gerador em Lua em que o personagem faz um movimento contínuo “em quadrado”, com 10 passos seguidos em cada direção.
]]--
function Ger_Quadrado()
	while(true) do
		for i = 1,10 do
			coroutine.yield("cima")
		end
		
		for i = 1,10 do
			coroutine.yield("direita")
		end
		
		for i = 1,10 do
			coroutine.yield("baixo")
		end
		
		for i = 1,10 do
			coroutine.yield("esquerda")
		end
	end
end

for c in coroutine.wrap(Ger_Quadrado) do
    print(c)
end
