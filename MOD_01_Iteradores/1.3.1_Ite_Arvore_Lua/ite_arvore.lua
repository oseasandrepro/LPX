--[[
	Crie um iterador em Lua que receba uma arvore e
	retorne todas as folhas, da esquerda para a direita.
	Variante 1: transforme a árvore em um vetor
]]

function ArvToArray (a)
	local vetor = {}
	local index = 1
	for i, v in pairs(a) do
	    if ( type(v) ~= "table") then
	      vetor[index] = v
	      index = index+1
	    else
	      local auxv = ArvToArray(v)
	      for i=1,#auxv do
	      	vetor[#vetor+1] = auxv[i]
	      end
	      index = #vetor+1
	    end
	  end
	return vetor
end

function Arvore (a)
   local Vetor = ArvToArray(a)
   return pairs(Vetor)
end

a = {'aaa', {'xxx','yyy',}, 'bbb'}

for f,v in Arvore(a) do
	print(v)
end
