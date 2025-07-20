# GG-Script-For-Last-Limit
Плавающее мод меню: https://github.com/1000blxdesss/GG-Script-For-Last-Limit/releases/download/v1.0.4/Lua.apk
<img width="422" height="711" alt="image" src="https://github.com/user-attachments/assets/03c6b001-0581-48e0-9ca7-26b00f02093f" />

Старое меню: https://github.com/1000blxdesss/GG-Script-For-Last-Limit/releases/download/Last_Limitv101/Lua.apk

Поддержать разработку можете на: https://boosty.to/nxxvxxxrmxxdxx

Этот проект построен на основе luaj: https://github.com/luaj/luaj
Любые ошибки/выводы скрипта перенаправлены на игровой поток

API:

1) sleep  
   • Приостанавливает выполнение (текущего) потока на указанное число миллисекунд.  
   • Пример:  
     ```sleep(500)```  

2) findClass  
   • Ищет класс по имени (полное имя класса с package) и пытается получить его экземпляр.  
   • Принимает: имя класса в виде строки, например.  
   • Возвращает экземпляр найденного или созданного объекта.  
   • Пример:  
     ```findClass("Base.Com")```

3) invoke  
   • Вызывает метод объекта.  
   • Принимает:  
     – Первый аргумент – Java-объект;  
     – Второй аргумент – имя метода (строка);  
     – Остальные аргументы – параметры для метода (если они есть).  
   • Возвращает результат вызова метода в виде Lua-значения (число, булево или строка), либо Lua nil при ошибке.  
   • Пример:  
     ```
     obj = findClass("Base.Com")  
     invoke(obj, "tryMoveToNextMap", 3)
     ```
4) getField  
   • Получает значение указанного поля объекта.  
   • Принимает:  
     – Первый аргумент – объект Java;  
     – Второй аргумент – имя поля (строка);  
     – Третий аргумент (опционально) – индекс, если поле является массивом.  
   • Возвращает значение поля.  
   • Пример:
   ```
     local com = findClass("Base.Com")  
     local Strategist = findClass("Moduls.Strategist")  
     local ensMap = getField(com, "EnsMap") -- либо ensMap = getField(com, "EnsMap", 1)
   ```

6) setField  
   • Устанавливает новое значение для поля объекта.  
   • Принимает:  
     – Режим для обычного поля: объект, имя поля (строка), новое значение;  
     – Режим для массива: объект, имя поля (строка), индекс, новое значение.  
   • Возвращает nil (в случае ошибки выбрасывается Lua error с описанием).  
   • Пример:  
     ```setField(enemy, "cx", getField(Strategist, "cx"))```

7) thread  
   • Создаёт новый поток для выполнения указанной Lua-функции.  
   • Функция будет вызвана в отдельном потоке.  
   • Принимает один аргумент – Lua-функцию.  
   • Возвращает nil.  
   • Пример:
   ``` 
     obj = findClass("something")  
     thread(function() invoke(obj, "somethingMethod") end)
   ```
Примеры скриптов брать в папке (example lua)
__________________________________________________________
Поддержка скриптов и апк для game guardian прекращена
