Java.perform(function () {
    console.log("START ENUM");
    function describeJavaClass(className) {
        var jClass = Java.use(className);
        console.log(JSON.stringify({
            _name: className,
            _methods: jClass.class.getDeclaredMethods().map(m => m.toString()),
            _fields: jClass.class.getFields().map(f => f.toString())
        }, null, 2));
        console.log("END ENUM");
    }
    describeJavaClass("Moduls.EnemysMap");
});

