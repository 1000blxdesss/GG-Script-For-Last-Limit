local com = findClass("Base.Com")
local Strategist = findClass("Moduls.Strategist")
local ensMap = getField(com, "EnsMap")
local enemies = getField(ensMap, "Enemys")

for i = 0, 5 do
    local enemy = enemies[i]
    if enemy ~= nil then
        local level = getField(enemy, "level")
        
        if level > 0 then
            setField(enemy, "cx", getField(Strategist,"cx"))
            setField(enemy, "cy", getField(Strategist,"cy"))
          end
    end
end