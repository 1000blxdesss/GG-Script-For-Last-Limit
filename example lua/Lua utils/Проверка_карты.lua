local com = findClass("Base.Com")
local map = nil
local mapName = ""

-- пока текущая карта не станет "City_Alchemist"
repeat

    map = getField(com, "currentGameMap")
    if map ~= nil then
        mapName = getField(map, "nameId") or ""
    end
until mapName == "City_Alchemist"
