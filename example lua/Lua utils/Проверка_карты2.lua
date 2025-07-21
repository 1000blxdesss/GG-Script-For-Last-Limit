local com = findClass("Base.Com")
local map = getField(com, "currentGameMap")

if map then
    local curmap = getField(map, "nameId")
    print("Текущая карта: " .. (curmap or "неизвестно"))
else
    print("Текущая карта не загружена")
end