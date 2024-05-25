/*Java.perform(function() {
    var QuestInPlayer = Java.use('Moduls.quests.QuestInPlayer');

    QuestInPlayer.addKilledMonster.overload('java.lang.String').implementation = function(monsterName) {
        var result = this.addKilledMonster(monsterName);
        if (monsterName === 'Фреон Фаэрин') {
            console.log('Killed monster: ' + monsterName + ', count: ' + result);
        }
        return result;
    };
});
*/
/*Java.perform(function() {
    var Strategist = Java.use('Moduls.Strategist');
    Strategist.animate.implementation = function() {
        this.animate();
        console.log('GP_Name: ' + this.GP_Name.handle);
        console.log('GP_Name address: ' + Strategist.GP_Name.field.address);
        return;
    };
});*/

Java.perform(function () {
    var MenuPlayerDescription = Java.use('MenuPck.MenuPlayerDescription');
    if (!MenuPlayerDescription) {
        console.log('MenuPlayerDescription not found, trying to choose...');
        Java.choose('MenuPlayerDescription', {
            onMatch: function (instance) {
                console.log('Found MenuPlayerDescription: ' + instance);
                MenuPlayerDescription = instance.class;
            },
            onComplete: function () {
                if (!MenuPlayerDescription) {
                    console.log('MenuPlayerDescription not found');
                } else {
                    console.log('MenuPlayerDescription found');
                    MenuPlayerDescription.toLevelNameText.implementation = function () {
                        var result = this.toLevelNameText();
                        console.log('Player name and level: ' + result);
                        return result;
                    }
                }
            }
        });
    } else {
        console.log('MenuPlayerDescription found');
        MenuPlayerDescription.toLevelNameText.implementation = function () {
            var result = this.toLevelNameText();
            console.log('Player name and level: ' + result);
            return result;
        }
    }
});


//public boolean Moduls.quests.QuestSingle.isDone
//(Moduls.Strategist,Moduls.quests.QuestInPlayer)
