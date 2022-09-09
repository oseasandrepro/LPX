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
            return (Nnumber+1), primos[1]
        end

        local index = #primos+1
        while( true ) do
            local flag = false
            for i=1, #primos do
                if( Nnumber%primos[i] == 0) then
                    flag = true
                    break 
                end
            end
            if( not(flag) ) then
                primos[index] = Nnumber
                return (Nnumber+1), primos[index]
            end
            Nnumber = Nnumber + 1
        end
    end

    return f, {2} , 2
end

for n,v in Primos() do
   print(v)
   sleep(1)
end