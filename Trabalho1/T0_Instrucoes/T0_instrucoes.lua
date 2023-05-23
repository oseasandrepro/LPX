--[[
O objetivo do trabalho é criar um "lexer" para uma linguagem simples de expressões matemáticas.
A linguagem possui números inteiros, variáveis e operadores matemáticos, além de comandos de atribuição e exibição.
A linguagem também suporta comentários, que iniciam com o caractere `#` e terminam com o fim da linha.
Segue um exemplo de um programa:

x = 10 * 2    # um comentário que deve ser ignorado
y = 0 - 5       # outro comentário
print(x + y)

O lexer de um compilador é responsável por detectar as palavras ou "tokens", que formam o vocabulário da linguagem.

Para o exemplo acima, o lexer deve detectar os seguintes tokens:
x, =, 10, *, 2, y, =, 0, -, 5, print, (, x, +, y, ) 

Seguem a descrição dos tokens válidos:

- números
    - sequência de dígitos
    - 0,  10,  5
- variáveis
    - sequência de letras
    - a,  tmp,  soma
- operadores
    - +,  -,  *,  /
- símbolos
    - (,  ), 
]]--

local numeros = {'0', '1,', '2', '3', '4', '5', '6', '7', '8', '9'}
local operadores = {'+', '-', '*', '/'}
local simbolos = {'(', '(' }
local tokens = {}
local index = 1
local token = ''
local i = 1
local f = io.open("the_code.txt")
local state = 0;

function addToken(str)
	tokens[index] = str
	index = index + 1;
end



local l = f:read("*all")
f:close()

local c = string.sub(l,i,i) ; i=i+1
while c ~= '' do

	while c == ' ' do
                c = string.sub(l,i,i) ; i=i+1
        end
        
	if c == '#' then
		while c ~= '\n' do
                	c = string.sub(l,i,i) ; i=i+1
                	
        	end
        end
        
        if( state==0 and c  == '=') then
        	state = 1;
        	addToken(token)
        	addToken(c)
        	token = ''
        elseif(state == 1 and (c=='+' or c=='-' or c=='*' or c=='/')) then
      		state = 2
        	addToken(token)
        	addToken(c)
        	token = ''
        elseif( state==2 and c=='\n') then
        	state = 0
        	addToken(token)
        	token = ''
        else
        	if token=='' then token = c else token = token..c end
        end
        c = string.sub(l,i,i) ; i=i+1
end

for i=1,#tokens do
	print(tokens[i])
end
