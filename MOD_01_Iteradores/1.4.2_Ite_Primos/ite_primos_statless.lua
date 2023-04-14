--[[ 
    - Crie um iterador em Lua que retorne todos os números primos.
--]]

local clock = os.clock
function sleep(n)
    local t0 = clock()
    while clock() - t0 <= n do end
end

function Primos()
    local f = function(primos, Nnumber)

        if( Nnumber == 2) then
            primos[1] = Nnumber
            return (Nnumber+1), primos[1]
        end

        local index = #primos+1
        local heprimo = false
        while( not(heprimo) ) do
            local flag = false
            for i=1, #primos do
                if( Nnumber%primos[i] == 0) then
                    flag = true
                    break 
                end
            end
            if( not(flag) ) then
                heprimo = true
                primos[index] = Nnumber
            end
            Nnumber = Nnumber + 1
        end
        return (Nnumber+1), primos[index]
    end

    return f, {} , 2
end

for n in Primos() do
   print(n)
   sleep(1)
end