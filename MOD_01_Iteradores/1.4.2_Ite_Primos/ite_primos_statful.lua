--[[ 
    - Crie um iterador em Lua que retorne todos os números primos.
--]]

local clock = os.clock
function sleep(n)
    local t0 = clock()
    while clock() - t0 <= n do end
end

function Primos()
    local primos = {}
    local index = 1
    local current_natural_number = 2
    return function()
        if(index == 1) then
            primos[1] = current_natural_number
            current_natural_number = current_natural_number + 1
            index = index + 1
            return primos[index-1]
        else
            local heprimo = false
            while( not(heprimo) ) do
                local flag = false
                for i=1, #primos do
                    if( current_natural_number%primos[i] == 0) then
                        flag = true
                        break 
                    end
                end
                if( not(flag) ) then
                    heprimo = true
                    primos[index] = current_natural_number
                end
                current_natural_number = current_natural_number + 1
            end
            index = index + 1
            return primos[index-1]
        end
    end
end


for n in Primos() do
   print(n)
   sleep(1)
end