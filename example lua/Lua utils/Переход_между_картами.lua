--MOVE_UP    = 3
--MOVE_DOWN  = 1
--MOVE_LEFT  = 2
--MOVE_RIGHT = 0
--MOVE_NONE  = -1

local com = findClass("Base.Com")
-- движение вверх (MOVE_UP = 3)
invoke(com, "tryMoveToNextMap", 3)