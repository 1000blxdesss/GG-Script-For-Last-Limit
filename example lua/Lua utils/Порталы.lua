local com = findClass("Base.Com")
local controller = findClass("Base.GameMapObjectsController")

-- вход в портал с индексом 19 
invoke(controller, "actionMapObjectMapPortalUse", 19)