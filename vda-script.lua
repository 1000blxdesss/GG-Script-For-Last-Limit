--как же ему похер на красивый код---
-- options
local scriptName = [=====[Script for Last Limit 1.190]=====]
local scriptVersion = '1.0.3'
local scriptAuthor = 'Vuelo'
local startToast = ''
-- 0 - no check; 1 - check package only, 2 - check package and build
local checkTarget = 0

local targetName = [=====[Last Limit]=====]
local targetPkg = 'com.strategicon.lastlimit'
local targetVersion = [=====[1.190]=====]
local targetBuild = 190
local packageCheck="com.VueloAPI"

-- init
gg.require('101.1', 16142)

if startToast ~= '' then startToast = '\n'..startToast end
gg.toast(scriptName..' v'..scriptVersion..' by '..scriptAuthor..startToast)

if checkTarget ~= 0 then
local info = gg.getTargetInfo()
local check = false
local current = false
if checkTarget >= 1 then
check = targetPkg
current = info.packageName
end
if checkTarget >= 2 then
check = check..' '..targetVersion..' ('..targetBuild..')'
current = current..' '..info.versionName..' ('..info.versionCode..')'
end
if check ~= current then
gg.alert('This script for "'..targetName..'" ['..check..'].\nYou select "'..info.label..'" ['..current..'].\nNow script exit.')
os.exit()

end
local revert = nil
end

gg.clearResults()
kele0=0
Qjctx=1

function Hello()
Test1()
Qjctx=-1
end

if gg.PACKAGE~='com.VueloAPI' and gg.VERSION ~='228.0' then
  gg.toast('Вы запускаете скрипт не на LastLimitGG')
  script:unload()
end

if A ~= true and gg.PACKAGE~=packageCheck then script:unload() return end

local targetName = [=====[Last Limit]=====]
local targetPkg = 'com.strategicon.lastlimit'
local targetVersion = [=====[1.190]=====]
local targetBuild = 190

----------HELP_SECTIONS------------
--offsets
local speed = 0x8C + 0x68
local invisible = 0x8C + 0xB6
local range = 0x8C + 0x40
local something = 0x68 + 0x8
local mobs = 0x8C - 0x88
local immortal = 0x90 + 0x4
local location = 0x8C + 0x78
local playerCount = 0xC0
--
function searchAddress(offsets, flags)
  gg.searchNumber("001B000Dh", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(1)
  local w = gg.getResults(1)
  local q = {}
  q[1] = {}
  q[1].address = w[1].address
  q[1].value = 0 -- Add the value field here

  local q = {}
  q[1] = {}
  q[1].address = w[1].address + offsets
  q[1].flags = flags

  return q[1]
end
-----------------------------------
--------------------------------------------
function Test1()
Mem = gg.choice({
	'Скорость',
	'Невидимка',
	'Дистанция',
	'Стяг(бета)',
	'Сведения',
	
	'Выход'
},nil,'By Vuelo del acro'.."(v:"..scriptVersion..")")


if Mem == 1 then TP() end
if Mem == 2 then invis() end
if Mem == 3 then dist() end
if Mem == 4 then Mobs() end
if Mem == 5 then info() end
if Mem == 6 then Exit() end
if Mem == nil then end
end
----------------------------------------
-----------SECTION_FUNCTIONS------------
	
----1)----
function TP()
  local n = gg.prompt({'Выберите скорость: [0; 35]'}, {0}, {'number'})
  if n == nil then os.exit() end
  local new_n = tonumber(n[1])
  local address = searchAddress(speed, gg.TYPE_FLOAT)
  if new_n == 0 then
    address.value = 1.8036964e-310
    gg.setValues({
    	{
    	address = address.address, 
    	flags = address.flags, 
    	value = address.value
    	}
    	})
  elseif new_n > 0 then
    address.flags = gg.TYPE_DWORD
    address.value = new_n
    gg.setValues({{address = address.address, flags = address.flags, value = address.value}})
  end
  gg.toast('Speed activated')
  gg.clearResults()
end
----•----

----2)----
function invis()
  local address = searchAddress()
  local q = {}
  q[1] = {}
  q[1].address = address + invisible
  q[1]["freezeType"] = gg.FREEZE_MAY_INCREASE
  q[1].flags = gg.TYPE_WORD
  q[1].value = 25
  while x ~= (-2) do
    gg.setValues(q)
    q[1]["freezeType"] = gg.FREEZE_MAY_INCREASE
  end
end
----•----
	
----3)----
function dist()
  local address = searchAddress(range, gg.TYPE_DWORD)
  address.value = 9999
  gg.setValues({
    {
      address = address.address,
      flags = address.flags,
      value = address.value
    }
  })

  local saddress = searchAddress(speed, gg.TYPE_DWORD)
  saddress.value = 12
  gg.setValues({
    {
      address = saddress.address,
      flags = saddress.flags,
      value = saddress.value
    }
  })
  gg.toast('Dist. activated')
end
----•----
	
----4)----
function Mobs()
mobs_menu = gg.prompt(
{
	'Локация',
	'Количество',
	'Координаты',
	'Притянуть всех',
	'Безопасный выход',
	'Отключить существ'
	},
{ 
	[12]=false,
	[2]="0"
},
{
	[1]='text',
	[2]='0 ',
	[3]='',
	[4]='checkbox',
	[5]='checkbox',
	[6]='checkbox'
})
--++--++--++--++(SECTION_MAGNET)
if mobs_menu[1] == 'O' then 
    gg.searchNumber("1769485", gg.TYPE_DWORD)
    local get_rs = gg.getResults(1)
    
    local player = {}
    player[1] = {}
    player[1].address = get_rs[1].address + 0x4
    player[1].flags = gg.TYPE_DWORD
    player[1].value = 196622
    gg.setValues(player)
    local result = player[1].value
    result = 196622
    gg.setValues(player)
    gg.clearResults()
    
    gg.searchNumber("000A0005h", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0, gg.REGION_JAVA_HEAP)
    local results = gg.getResultsCount()
    gg.toast(results)
    
    local addresses = gg.getResults(results) 
    local values = {}
    
    for i = 1, mobs_menu[2] do
        values[i] = {}
        values[i].address = addresses[i].address + 0x4
        values[i].flags = gg.TYPE_DWORD
        values[i].value = result
    end
    
    gg.setValues(values)
end
gg.clearResults()
--
if (mobs_menu[1] == "" and mobs_menu[2] ~= nil) then
    gg.searchNumber("1769485", gg.TYPE_DWORD)
    local get_rs = gg.getResults(1)
    
    local player = {}
    player[1] = {}
    player[1].address = get_rs[1].address + 0x4
    player[1].flags = gg.TYPE_DWORD
    
    player = gg.getValues(player)
    local result = player[1].value
    
    gg.clearResults()
    
    gg.searchNumber("000A0005h", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0, gg.REGION_JAVA_HEAP)
    local results = gg.getResultsCount()
    gg.toast(results)
    
    local addresses = gg.getResults(results) 
    local values = {}
    
    for i = 1, mobs_menu[2] do
        values[i] = {}
        values[i].address = addresses[i].address + 0x4
        values[i].flags = gg.TYPE_DWORD
        values[i].value = player[1].value
    end
    
    gg.setValues(values)
 end
 gg.clearResults()


	--ALL_MAGNET
	if mobs_menu[4] then
    gg.searchNumber("1769485", gg.TYPE_DWORD)
    local get_rs = gg.getResults(1)
    
    local player = {}
    player[1] = {}
    player[1].address = get_rs[1].address + 0x4
    player[1].flags = gg.TYPE_DWORD
    
    player = gg.getValues(player)
    local result = player[1].value
    
    gg.clearResults()
    
    gg.searchNumber("000A0005h", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0, gg.REGION_JAVA_HEAP)
    local results = gg.getResultsCount()
    gg.toast(results)
    
    local addresses = gg.getResults(results) 
    local values = {}
    
    for i = 1, results do
        values[i] = {}
        values[i].address = addresses[i].address + 0x4
        values[i].flags = gg.TYPE_DWORD
        values[i].value = player[1].value
    end
    
    gg.setValues(values)
 end
 gg.clearResults()
	--    ALL    --
		
--------SAVE_LEAVE--------
if mobs_menu[5] then
 local address = searchAddress()
 local nulls = {}
 nulls[1] = {}
 nulls[1].address = address + mobs
 nulls[1].flags = gg.TYPE_DWORD
 nulls[1].value = -678
 gg.setValues(nulls)
end
--------------------------
		
--------MOBS_STATE--------
if mobs_menu[6] then
	gg.searchNumber("000A0005h", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0,gg.REGION_JAVA_HEAP)
	local Get=gg.getResults(gg.getResultsCount())
	local iters=gg.getResultCount()
	local N={}
	for i=iters,1,-1 do
		N[i]={}
		N[i].address=Get[i].address+immortal
		N[i].flags=gg.TYPE_WORD
		N[i].value=257
		gg.setValues(N)
	end
end
--------------------------
if mobs_menu[3] ~=nil then
	--	local notinput = gg.prompt({'Введите координаты:'}, {[1]='0'}, {[1]='number'})
  if mobs_menu[3]== nil or mobs_menu[3]== "" then
    return
  else
    local address = searchAddress()
    local nulls = {}
    nulls[1] = {}
    nulls[1].address = address + mobs
    nulls[1].flags = gg.TYPE_DWORD
    nulls[1].value = tonumber( mobs_menu[3])--already number -_-
    gg.setValues(nulls)
  end
end	

--++--++--++--++(SECTION_MAGNET)
end
--------

----5)----
function info()
  gg.clearResults()
  gg.searchNumber("0000EA600003D090h", gg.TYPE_QWORD)
  gg.getResults(1)
  w = gg.getResults(1)
  local q = {}
  q[1] = {}
  q[1].address = w[1].address + playerCount
  q[1].flags = gg.TYPE_WORD
  local pl = q[1].playerCount
  local valuess = gg.getValues(q)
  local players = valuess[1].value
  gg.clearResults()
  gg.searchNumber(655365, gg.TYPE_DWORD)
  local entityCount = gg.getResultsCount()
  gg.clearResults()
  gg.searchNumber("001B000Dh", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(1)
  w = gg.getResults(1)
  local q = {}
  q[1] = {}
  q[1].address = w[1].address + location
  q[1].flags = gg.TYPE_WORD
  local infLoc = q[1].location
  local values = gg.getValues(q)
  local value = values[1].value
  --------id location-----------------
  gg.alert("Квадрат id: " .. value .. "\nСущностей: " .. entityCount .. "\nИгроков: " .. players .. "\nРассчет может быть неверен из-за регионов Ca,A (отключите их на свое усмотрение)")
end
--------
	
----6)----


--------




--место для чилла






-------------------------------------

----------END_SECTIONS-------
	
----7)----
function Exit()
os.exit()
end
--------

while(true) do
if gg.isVisible(true) then
Qjctx=1
gg.setVisible(false)
end
gg.clearResults()
if Qjctx==1 then Hello() end
end
--function tp(address, flags)
    --local values = gg.getValues({{address = address, flags = flags}})
    --return values[1].value
--end

--local player_value_address = player[1].address + 0x4
--local player_value_flags = gg.TYPE_DWORD

--local current_player_value = tp(player_value_address, player_value_flags)
