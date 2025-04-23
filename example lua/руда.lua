--руда
local objM = findClass("MenuPck.ListTypes.OtherMenuList")
local obj = findClass("Base.GameMapObjectsController")
for j=0,500 do
sleep(250)

invoke(obj,"actionMapObjectMapPortalUse",1)
sleep(150)
for i=1,8 do 
    if i==6 then
    invoke(objM,"executeDelegated",3)
end
invoke(obj,"actionMapObjectDirectPortal",i,true) end
invoke(obj,"actionMapObjectMapPortalUse",0)
end