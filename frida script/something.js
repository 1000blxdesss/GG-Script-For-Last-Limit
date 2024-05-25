/*Java.perform(function () {
    Java.enumerateLoadedClasses({
        onMatch: function (className) {
            if (className.indexOf('Moduls.quests.QuestStrateg') !== -1) {
                var QuestStrateg = Java.use(className);
                var questStrateg = QuestStrateg.$new();

                var method = QuestStrateg.tryAddKilledMonster;
                method.implementation = function (str, str2) {
                    console.log("tryAddKilledMonster called with parameters: " + str + ", " + str2);
                    this.tryAddKilledMonster(str, str2);
                    console.log("tryAddKilledMonster finished");
                };
            }
        },
        onComplete: function () {
            console.log("Class search complete");
        }
    });
});*/
// Java.perform(function() {
//     var HeroesOnMapManager = Java.use("Moduls.otherheroes.HeroesOnMapManager");
//     var previousForMapInd = -1;

//     HeroesOnMapManager.applyHeroes.implementation = function() {
//         var currentForMapInd = this.forMapInd.value;
//         var currentIncomeForMapInd = this.incomeForMapInd.value;

//         if (currentForMapInd !== previousForMapInd && currentIncomeForMapInd !== previousForMapInd) {
//             console.log("Change Location ID: " + currentForMapInd);
//             previousForMapInd = currentForMapInd;
//         }

//         return this.applyHeroes();
//     };
// });


// BattleManager.createFightWithPlayer.implementation = function(i) {
//     if (i != 0) {
//         
//         this.createFightWithPlayer(0);
//         console.log("hook with: " + i);
//     } else {
//         
//         this.createFightWithPlayer(0);
//         console.log("orig: " + i);
//     }
// };
Java.perform(function() {
    var BattleManager = Java.use("battlepck.BattleManager");

     BattleManager.createFightJoinToPlayer.implementation = function(i) {
        console.log("Вызов метода createFightJoinToPlayer() отменен");
        return;
    };

    BattleManager.createFightWithPlayer.implementation = function(i) {
        console.log("Вызов метода createFightWithPlayer() отменен");
        return;
    };
    BattleManager.appearBattle.implementation = function() {

        console.log("Метод appearBattle() вызван, но бой не будет создан");
        return;
    };
});



Java.perform(
    function() {
        let BattleManager = Java.use("battlepck.BattleManager");
        let NetRequest = Java.use("Base.NetRequest");
        let DataInputStream = Java.use('java.io.DataInputStream');
        BattleManager.appearBattle.overload().implementation = function() {
            var socket = new Socket('localhost', 1234); 
            var inputStream = socket.getInputStream(); 
            var dis = new DataInputStream(inputStream);
            var request = new NetRequest();
            this.appearBattle.overload().call();
            console.log("request.dis.readInt()="+request.dis.readInt());
        }
});
//
Java.perform(function() {
    var EnemysMap = Java.use("Moduls.EnemysMap");
    var Camera = Java.use("Engine.Camera");
    var Strategist = Java.use("Moduls.Strategist");
    var TileMap = Java.use("Moduls.TileMap");
    var DrawOrderList = Java.use("Moduls.DrawOrderList");
    var EnemysMapListener = Java.use("Moduls.EnemysMapListener");
    var Enemy = Java.use("Moduls.Enemy");

    var camera = Camera.$new();
    var strategist = Strategist.$new();
    var tileMap = TileMap.$new();
    var drawOrderList = DrawOrderList.$new();
    var enemysMapListener = EnemysMapListener.$new();
    //var Enemys[] = Enemy.$new();
    var closeEnsPhase;
    var Width;
    var SlotW;
    var Height;
    EnemysMap.iterateCloseEnemys.overload('Engine.Camera','Moduls.Strategist','Moduls.TileMap','Moduls.DrawOrderList','Moduls.EnemysMapListener').implementation = function(camera,strategist,tileMap,drawOrderList,enemysMapListener) {
        var sX;
        var eX;
        var sY;
        var eY;
        closeEnsPhase = 10000;
        var res = -1;
        if (this.Width==1){
            closeEnsPhase = 10100;
            sX = 0;
            eX = 0;
        }
        else{
            closeEnsPhase = 10200;
            if (strategist.cx % this.SlotW < this.SlotW / 2) {
                closeEnsPhase = 10300;
                sX = (strategist.cx / this.SlotW) - 1;
                if (sX < 0) {
                    sX += this.Width;
                }
                eX = sX + 1;
            } else {
                closeEnsPhase = 10400;
                sX = strategist.cx / this.SlotW;
                eX = sX + 1;
            }
        }
        closeEnsPhase = 10500;
        if (this.Height == 1) {
            closeEnsPhase = 10600;
            sY = 0;
            eY = 0;
        } else {
            if (strategist.cy % this.SlotH < this.SlotH / 2) {
                closeEnsPhase = 10700;
                sY = (strategist.cy / this.SlotH) - 1;
                if (sY < 0) {
                    sY += this.Height;
                }
                eY = sY + 1;
            } else {
                closeEnsPhase = 10800;
                sY = strategist.cy / this.SlotH;
                eY = sY + 1;
            }
        }
        closeEnsPhase = 10900;
        for (int k1 = sX; k1 <= eX; k1++) {
            closeEnsPhase = k1 + 11000;
            int i = k1;
            if (i >= this.Width) {
                i %= this.Width;
            }
            for (int i2 = sY; i2 <= eY; i2++) {
                closeEnsPhase = i2 + 12000;
                int i3 = i2;
                if (i3 >= this.Height) {
                    i3 %= this.Height;
                }
                closeEnsPhase = i2 + 13000;
                for (int size = this.Map[i][i3].size() - 1; size >= 0; size--) {
                    closeEnsPhase = i2 + 14000;
                    int intValue = ((Integer) this.Map[i][i3].elementAt(size)).intValue();
                    closeEnsPhase = i2 + 15000;
                    Enemy enemy = this.Enemys[intValue];
                if (enemy.Enable) {
                        closeEnsPhase = i2 + 16000;
                        if (camera.isPointVisible(enemy.cx, enemy.cy, 11, 36)) {
                            closeEnsPhase = i2 + 18000;
                            drawOrderList.addAndSortFromEnd(DrawOrderElementEnemy.getInstance(enemy.cx, enemy.cy, enemy.cy, (short) intValue));
                            enemy.Drawed = true;
                        } else {
                            enemy.Drawed = false;
                        }
                        closeEnsPhase = i2 + 19000;
                        if (enemy.iteration(camera, strategist, tileMap)) {
                            closeEnsPhase = i2 + 20000;
                            if (ClientState.instance.get() == 4) {
                                res = intValue;
                            }
                        }
                        closeEnsPhase = i2 + 21000;
                        int i4 = enemy.cx / this.SlotW;
                        int i5 = enemy.cy / this.SlotH;
                        closeEnsPhase = i2 + 22000;
                        if (!(i4 == enemy.CurMapSlotX && i5 == enemy.CurMapSlotY)) {
                            closeEnsPhase = i2 + 23000;
                            AssociateEnemy(intValue);
                            this.Map[i][i3].removeElementAt(size);
                        }
                        enemysMapListener.processEnemy(intValue, enemy);
                    }
                }
            }
        }
        return res;
    }
});


