local com = findClass("Base.Com")
local controller = findClass("Base.GameMapObjectsController")
local menu = findClass("MenuPck.ListTypes.OtherMenuList")

-- получаем вектор квестов и выбираем квест с id = 2 
-- id - номер печати, считая сверху
invoke(menu, "onGenerateItemsAndSkipsEvent", 196)
invoke(menu, "onListClickEvent", 196, 2)
invoke(menu, "onYesNoEnterEvent", 197, true)

