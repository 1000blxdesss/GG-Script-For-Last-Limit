local com = findClass("Base.Com")
local ensMap = getField(com, "EnsMap")
local enemies = getField(ensMap, "Enemys")
local count = #enemies

-- обязательно ищем поля Enable и level, чтобы не трогать нпс и неактивных существ
for i = 0, count - 1 do
    local enemy = enemies[i]
    if enemy ~= nil then
        local enabled = getField(enemy, "Enable")
        if enabled then
            local level = getField(enemy, "level")
            if level > 0 then
                setField(enemy, "cx", 100)
                setField(enemy, "cy", 200)
            end
        end
    end
end
