# Ticker

> Sparrow.Utility 2.0

> Inherits: Timer

> objectName: "Sparrow.Utility.Ticker 2.0"

定时执行某个函数。

```
    Ticker {
        id: ticker
        Component.onCompleted: {
            lazyer.tick(1000, function(){
                console.log("tick....");
            });
        }
    }
```