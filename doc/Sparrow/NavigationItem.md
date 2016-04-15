# NavigationItem

> Sparrow.Private 2.0

> Inherits: Item

> objectName: "Sparrow.NavigationItem 2.0"

页面管理类。

会设置其默认属性 `page` 的 `__navigation`，`implicitWidth`，`implicitHeight` 三个属性。

> **注意**：如果 `NavigationStack` 或者 `NavigationSwipe` 没有被 `NavigationItem` 包裹时，需要重新设定 `NavigationStack` 或者 `NavigationSwipe` 的 `__navigation`，`implicitWidth`，`implicitHeight` 三个属性。

## 属性

+ `title` : `string`

+ `icon` : `string`

+ `page` : `Container` **default**

## 详细描述

导航单元，配合 `Navigation` 使用。

```
Navigation {
   drawer: Drawer { }
   NavigationItem {
       Page { Tracker{ } }  // Page 的 parent 是 Navigation 的 content
   }
   NavigationItem {
       Page { Tracker{ } }  // Page 的 parent 是 Navigation 的 content
   }
}
```

## 属性文档

> ### `title` : `string`

导航单元的标题。

> ### `icon` : `string`

导航单元的图标。可以使用 `FontAwesome`。

> ### `page` : `Container` **default**

`NavigationItem` 的默认属性，但是值得注意，在完成初始化后，`page` 的所有权会移交给 `Navigation`。
