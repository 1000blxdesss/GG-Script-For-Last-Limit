-- options
local scriptName = [=====[Script for Last Limit 1.190]=====]
local scriptVersion = '1.0.1'
local scriptAuthor = 'Vuelo'
local startToast = ''
-- 0 - no check; 1 - check package only, 2 - check package and build
local checkTarget = 0

local targetName = [=====[Last Limit]=====]
local targetPkg = 'com.strategicon.lastlimit'
local targetVersion = [=====[1.190]=====]
local targetBuild = 190
local packageCheck="com.VueloAPI"
-- functions

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
end
local revert = nil

-- main code

gg.clearResults()
kele0=0
Qjctx=1

function Hello()
Test1()
Qjctx=-1
end

if gg.PACKAGE~='com.VueloAPI' and gg.VERSION ~='228.0' then
script:unload()
end

if A ~= true and gg.PACKAGE~=packageCheck then script:unload() return end

local targetName = [=====[Last Limit]=====]
local targetPkg = 'com.strategicon.lastlimit'
local targetVersion = [=====[1.190]=====]
local targetBuild = 190


function Test1()
Mem = gg.choice({'Скорость','Невидимка','Дистанция','Стяг(бета)','Меню','Exit'},nil,'By Vuelo del acro')
if Mem == 1 then TP() end
if Mem == 2 then invis() end
if Mem == 3 then dist() end
if Mem == 4 then Mobs() end
if Mem == 5 then Menu() end
if Mem == 6 then Exit() end
if Mem == nil then end
end
function TP ()
local n = gg.prompt({'Выберите скорость: [0; 35]'}, {0}, {'number'})
if n == nil then os.exit() end
new_n=tonumber (n[1])
gg.searchNumber("001B000Dh", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(1)
w=gg.getResults(1)
local q={}
q[1]={}
q[1].address=w[1].address+0x8C + 0x68
q[1].flags=gg.TYPE_DOUBLE
if new_n==0 then
q[1].value=1,8036964e-310
gg.setValues(q)
end
if new_n>0 then
q[1].flags=gg.TYPE_DWORD
q[1].value=new_n
gg.setValues(q)
end
gg.toast('Vuelo крут')
gg.clearResults()
end

function invis()
gg.searchNumber("001B000Dh", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(1)
w=gg.getResults(1)
local q={}
q[1]={}
q[1].address=w[1].address + 0x8C + 0xB6
q[1]["freezeType"] = gg.FREEZE_MAY_INCREASE
q[1].flags=gg.TYPE_WORD
q[1]["freezeType"] = gg.FREEZE_MAY_INCREASE
q[1].value=25
q[1]["freezeType"] = gg.FREEZE_MAY_INCREAS
while x ~= (-2) do
gg.setValues(q)
q[1]["freezeType"] = gg.FREEZE_MAY_INCREASE
end
end

function dist()
gg.searchNumber("001B000Dh", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)

gg.getResults(1)
w=gg.getResults(1)
local q={}
local A={}
q[1]={}
A[1]={}
q[1].address=w[1].address + 0x8C + 0x40
q[1].flags=gg.TYPE_DWORD
q[1].value=9999
gg.setValues(q)
A[1].address=w[1].address + 0x68+0x8
A[1].flags=gg.TYPE_DWORD
A[1].value=12
gg.setValues(A)
end

function Mobs()
data = gg.prompt(
{'Локация','Количество','стянуть всех','собрать все золото', 'ask path', 'ask file','К порталу', 'Безопасный Выход','Бессмертие','ахуенчик'},
{ [12]=false,[2]="0"},
{[2]='0 ', [1]='text',[3]='checkbox',[4]='checkbox', [5]='path', [6]='file',[7]='checkbox', [8]='checkbox',[9]='checkbox',[10]='checkbox'})


-- рот ебал data[1]=tonumber(data[1],16)А13

if data[1]=='A13' then
gg.searchNumber("001B000Dh", gg.TYPE_DWORD,false, gg.SIGN_EQUAL, 0, -1, 0)

gg.getResults(1)
www=gg.getResults(1)
local zet={}
zet[1]={}
zet[1].address=www[1].address+0x8C-0x88
zet[1].flags=gg.TYPE_DWORD
zet[1].value=197054
gg.setValues(zet)
gg.clearResults()
gg.searchNumber(655365,gg.TYPE_DWORD)
local counts=gg.getResults(2)
gg.removeResults(counts)
data[2]=tonumber(data[2])
--
while data[2]>0 do
gg.searchNumber(655365,gg.TYPE_DWORD)
wi=gg.getResults(1)
local q={}
q[1]={}
q[1].address=wi[1].address + 0x4 
q[1].flags=gg.TYPE_DWORD
q[1].value=197054
gg.setValues(q)

local B=gg.getResults(1)    
gg.editAll('0',gg.TYPE_DWORD)
gg.removeResults(B)
data[2]=data[2]-1
gg.searchNumber(655365,gg.TYPE_DWORD)
gg.sleep(10)
end
if data[1]=='A13' and data[7] then
zet[1].value=31850946 
gg.setValues(zet)
end
end

--zxc
if data[10] then

gg.searchNumber("1769485", gg.TYPE_DWORD)
get_rs=gg.getResults(1)
local player={}
player[1]={}
player[1].address=get_rs[1].address+0x4
player[1].flags=gg.TYPE_DWORD
player=gg.getValues(player)
result=player[1].value
gg.clearResults()

gg.searchNumber(655365,gg.TYPE_DWORD)
cnta=gg.getResultsCount()
while cnta>0 do
gg.searchNumber(655365,gg.TYPE_DWORD)
gg.getResults(1)
wi=gg.getResults(1)
local q={}
q[1]={}
q[1].address=wi[1].address + 0x4
q[1].flags=gg.TYPE_DWORD
q[1].value=result
gg.setValues(q)

local B=gg.getResults(1)
gg.editAll('0',gg.TYPE_DWORD)
gg.removeResults(B)
cnta=cnta-1
gg.searchNumber(655365,gg.TYPE_DWORD)
gg.sleep(10)
end
end
-- player=gg.getValues(player)
-- result=player[1].value
if data[8] then
gg.searchNumber("001B000Dh", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(1)
zx=gg.getResults(1)
local nulls={}
nulls[1]={}
nulls[1].address=zx[1].address+0x8C-0x88
nulls[1].flags=gg.TYPE_DWORD
nulls[1].value=-100
gg.setValues(nulls)
end
--А13end

if data[1]=="Other" then
gg.clearResults()
gg.searchNumber("001B000Dh", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(1)
www=gg.getResults(1)
data[2]=tonumber(data[2])
local zet={}
zet[1]={}
zet[1].address=www[1].address+0x4
zet[1].flags=gg.TYPE_DWORD
zet[1].value=196622
gg.setValues(zet)
gg.clearResults()

while data[2]>0 do
gg.searchNumber(655365,gg.TYPE_DWORD)
gg.getResults(1)
wi=gg.getResults(1)
local q={}
q[1]={}
q[1].address=wi[1].address + 0x4
q[1].flags=gg.TYPE_DWORD
q[1].value=0
gg.setValues(q)

local B=gg.getResults(1)
gg.editAll('0',gg.TYPE_DWORD)
gg.removeResults(B)
data[2]=data[2]-1
gg.searchNumber(655365,gg.TYPE_DWORD)
gg.sleep(10)
end
end
--all
if data[1]=='Чертоги теней' and data[3] then
gg.searchNumber("001B000Dh", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(1)
www=gg.getResults(1)
data[2]=tonumber(data[2])
local zet={}
zet[1]={}
zet[1].address=www[1].address+0x8C-0x88
zet[1].flags=gg.TYPE_DWORD
zet[1].value=49283530
gg.setValues(zet)
gg.clearResults()
gg.searchNumber(655365,gg.TYPE_DWORD)
cnta=gg.getResultsCount()
while cnta>0 do
gg.searchNumber(655365,gg.TYPE_DWORD)
gg.getResults(1)
wi=gg.getResults(1)
local q={}
q[1]={}
q[1].address=wi[1].address + 0x4
q[1].flags=gg.TYPE_DWORD
q[1].value=49283530
gg.setValues(q)

local B=gg.getResults(1)
gg.editAll('0',gg.TYPE_DWORD)
gg.removeResults(B)
cnta=cnta-1
gg.searchNumber(655365,gg.TYPE_DWORD)
gg.sleep(10)
end
end
--immortal
if data[9] then
gg.searchNumber("000A0005h", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0,gg.REGION_JAVA_HEAP)
local Get=gg.getResults(gg.getResultsCount())
local iters=gg.getResultCount()
local N={}
for i=iters,1,-1 do
N[i]={}
N[i].address=Get[i].address+0x90+0x4
N[i].flags=gg.TYPE_WORD
N[i].value=257
gg.setValues(N)
end
end
--syka

function Exit()
os.exit()
end
end
--New menu --New menu
function Menu()
Mems = gg.choice({'A13','Чертоги','Exit'},nil,'By Vuelo del acro')
if Mems == 1 then A13() end
if Mems == 2 then chert() end
if Mems == 3 then Exit() end
if Mems == nil then end
end
function A13()
gg.searchNumber("001B000Dh", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)

gg.getResults(1)
www=gg.getResults(1)
local zet={}
zet[1]={}
zet[1].address=www[1].address+0x8C-0x88
zet[1].flags=gg.TYPE_DWORD
zet[1].value=197054
gg.setValues(zet)
gg.clearResults()
gg.searchNumber(655365,gg.TYPE_DWORD)
local counts=gg.getResults(2)
gg.removeResults(counts)
data=10
while data>0 do
--check

--endCheck
gg.searchNumber(655365,gg.TYPE_DWORD)
wi=gg.getResults(1)
local q={}
q[1]={}
q[1].address=wi[1].address + 0x4 
q[1].flags=gg.TYPE_DWORD
q[1].value=197054
gg.setValues(q)


local B=gg.getResults(1)    
gg.editAll('0',gg.TYPE_DWORD)
gg.removeResults(B)
data=data-1
gg.searchNumber(655365,gg.TYPE_DWORD)
gg.sleep(10)
end
end
while(true)
do
if gg.isVisible(true) then
Qjctx=1
gg.setVisible(false)
end
gg.clearResults()
if Qjctx==1 then Hello() end
end
-- main code

--[[gg.clearResults()
 --gg.searchNumber("000A0005h", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0,gg.REGION_JAVA_HEAP)
--local Get=gg.getResults(gg.getResultsCount())
--local iters=gg.getResultCount()
--local N={}
--for i=iters,1,-1 do
   

--N[i]={}
--N[i].address=Get[i].address+0x4
--N[i].flags=gg.TYPE_DWORD
--N[i].value=0
--gg.setValues(N)]]--
