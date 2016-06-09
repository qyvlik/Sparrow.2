# Lazyer

> Sparrow.Utility 2.0

> Inherits: Item

> objectName: "Sparrow.Utility.Lazyer 2.0"

延时执行。

```
Lazyer {
    id: lazyer
    Component.onCompleted: {
        lazyer.lazyDo(1000, function(){
            console.log("1000ms")
            lazyer.lazyDo(1000, function(){
                console.log("1000ms")
            });
        });
    }
}
```

代码会延时 1000 ms 执行。