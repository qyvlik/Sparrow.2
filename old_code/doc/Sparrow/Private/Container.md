# Container

> Sparrow.Private 2.0

> Inherits: Item

> objectName: "Sparrow.Private.Container 2.0"

三明治结构的容器，支持阴影。

## 属性

+ `dpScale` : `real`

+ `dp` : `real` **readonly**

+ `data` : `list<Object>` **default**

+ `overlay` : `Item`

+ `content` : `Item` **readonly**

+ `background` : `Item`

+ `glow` : `group` **readonly**

    + `cached`:        `bool`

    + `color`:         `color`

    + `cornerRadius`:  `real`

    + `elevation`:     `real`

    + `glowRadius`:    `real`

    + `spread`:        `real`

    + `visible`:       `bool`

+ `__overlayParent` : `Item` **readonly**

+ `__backgroundParent` : `Item` **readonly**

+ `contentClip` : `bool`

+ `padding` : `group`

    ~~+ `padding.top` : `AnchorLine`~~

    ~~+ `padding.bottom` : `AnchorLine`~~

    ~~+ `padding.left`: `AnchorLine`~~

    ~~+ `padding.right` : `AnchorLine`~~

    ~~+ `padding.horizontalCenter` : `AnchorLine`~~

    ~~+ `padding.verticalCenter` : `AnchorLine`~~

    ~~+ `padding.baseline` : `AnchorLine`~~

    ~~+ `padding.centerIn` : `Item`~~

    + `padding.margins` : `real`

    + `padding.topMargin` : `real`

    + `padding.bottomMargin` : `real`

    + `padding.leftMargin` : `real`

    + `padding.rightMargin` : `real`

    + `padding.horizontalCenterOffset` : `real`

    + `padding.verticalCenterOffset` : `real`

    + `padding.baselineOffset` : `real`

    ~~+ `padding.alignWhenCentered` : `bool`~~

+ `window` : `Window` **readonly**

## 详细描述

Sparrow 框架中的容器，支持背景，浮动层，阴影（漫反射），使用过程中，不要直接设定 `width` 和 `height`。设置 `implicitWidth` 和 `implicitHeight`。参照 **Material Design 环境**，**Material Design 中文版 高度和阴影**设计的。

容器本身的层次类似于三明治，顶层的是覆盖层，中间是内容层，可以通过 `padding` 设置内边距，底层是背景层。还有一层阴影层。

## 属性文档

> ### `dpScale` : `real`

`dp` 的因子，默认是 1.5

> ### `dp` : `real` **readonly**

`dp` 值，在定义边距，高度，宽度，阴影长度上的基本单位。

> ### `data` : `list<Object>` **default**

默认属性，所有 `Container` 的孩子都会归属到这个属性中。

> ### `overlay` : `Item`

容器的覆盖层。

> ### `content` : `Item` **readonly**

容器的内容层。

> ### `background` : `Item`

容器的背景层。

> ### `glow` : `group` **readonly**

+ `glow` : `group` **readonly**

    + `cached`:        `bool`

    + `color`:         `color`

    + `cornerRadius`:  `real`

    + `elevation`:     `real`

    + `glowRadius`:    `real`

    + `spread`:        `real`

    + `visible`:       `bool`

阴影相关属性组，属性参照 `RectangularGlow`。

> ### `__overlayParent` : `Item` **readonly**

容器的覆盖层的父级控件。

> ### `__backgroundParent` : `Item` **readonly**

容器的背景层的父级控件。

> ### `contentClip` : `bool`

是否裁剪容器的内容层。

> ### `padding` : `group`

+ `padding` : `group`

    ~~+ `padding.top` : `AnchorLine`~~

    ~~+ `padding.bottom` : `AnchorLine`~~

    ~~+ `padding.left`: `AnchorLine`~~

    ~~+ `padding.right` : `AnchorLine`~~

    ~~+ `padding.horizontalCenter` : `AnchorLine`~~

    ~~+ `padding.verticalCenter` : `AnchorLine`~~

    ~~+ `padding.baseline` : `AnchorLine`~~

    ~~+ `padding.centerIn` : `Item`~~

    + `padding.margins` : `real`

    + `padding.topMargin` : `real`

    + `padding.bottomMargin` : `real`

    + `padding.leftMargin` : `real`

    + `padding.rightMargin` : `real`

    + `padding.horizontalCenterOffset` : `real`

    + `padding.verticalCenterOffset` : `real`

    + `padding.baselineOffset` : `real`

    ~~+ `padding.alignWhenCentered` : `bool`~~

设置内边距，仅使用 `*margin*` 属性，参照 `Item::anchors`。

> ### `window` : `Window` **readonly**

容器的 `Window` 对象。

---

[Material Design 中文版 环境](http://wiki.jikexueyuan.com/project/material-design/whatis-material-design/environment.html)

[Material Design 中文版 高度和阴影](http://wiki.jikexueyuan.com/project/material-design/whatis-material-design/elevation-shadows.html)
