# PageManager

> Sparrow.Private 2.0

> Inherits: [Container](Container.md)

> objectName: "Sparrow.Private.PageManager 2.0"

页面管理类。

## 属性

+ `navigationBarEnabled` : `bool` **read-only**

+ `currentPage` : `Page` **read-only**

+ `pages` : `list<Page>` **read-only**

+ `navigation` : `Item` **read-only**

## 详细描述

管理 `Page` 的一个抽象类

## 属性文档

> ### `navigationBarEnabled` : `bool` **read-only**

页面管理中的，当前页面是否要显示导航栏。

> ### `currentPage` : `Page` **read-only**

页面管理中，当前页面 ，一般是页面管理中，用户可见的那个页面

> ### `pages` : `list<Page>` **read-only**

管理的所有页面

> ### `navigation` : `Item` **read-only**

页面管理的导航对象。
