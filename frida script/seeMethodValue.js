/*Java.perform(function () {
    var BaseCom = Java.use('Base.Com');
    BaseCom.drawLifeBar.overload('javax.microedition.lcdui.Graphics', 'int', 'int', 'int', 'int', 'long', 'long', 'boolean').implementation = function (g, x, y, w, h, c1, c2, b) {
        console.log('drawLifeBar called with parameters:', g, x, y, w, h, c1, c2, b);
        this.drawLifeBar(g, x, y, w, h, c1, c2, b); 
    };
});
*/
/*Java.perform(function () {
  var BaseCom = Java.use('Base.Com');
  var drawLifeBarCallCount = 0;

  BaseCom.drawLifeBar.overload('javax.microedition.lcdui.Graphics', 'int', 'int', 'int', 'int', 'long', 'long', 'boolean').implementation = function (g, x, y, width, height, currentHp, maxHp, showBackground) {
    if (drawLifeBarCallCount === 0) {
      console.log('drawLifeBar called with parameters: ', x, y, width, height, currentHp, maxHp, showBackground);
    }

    
    var newX = x + 140;
    var newY = y + 205;

    this.drawLifeBar(g, newX, newY, width, height, currentHp, maxHp, showBackground);

    if (drawLifeBarCallCount === 0) {
      console.log('drawLifeBar called with new parameters: ', newX, newY, width, height, currentHp, maxHp, showBackground);
    }

    drawLifeBarCallCount++;
  };
});
*/


