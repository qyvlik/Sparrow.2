import QtQuick 2.5

import Sparrow 2.0
import Sparrow.Private 2.0

Item {
    id: navigationItem
    objectName: "Sparrow.NavigationItem 2.0"

    // parent == Sparrow.Navigation <Sparrow.Page$PageContent>

    property string title: "NavigationItem"
    property string icon:  "S"
    property color titleColor: "black"
    property color iconColor: "black"
    property color selectColor: "#3498db"

    default property Container page: null

    Binding {
        target: page
        property: "__navigation"
        value: navigationItem.parent
    }

    Binding {
        objectName: "Sparrow.NavigationItem$Binding:'navigationItem.page.parent bind navigationItem.parent' 2.0"
        target: page
        property: "parent"
        value: navigationItem.parent
    }

    Binding {
        objectName: "Sparrow.NavigationItem$Binding:'navigationItem.page.implicitWidth bind navigationItem.parent.width' 2.0"
        target: page
        property: "implicitWidth"
        value: navigationItem.parent.width
    }

    Binding {
        objectName: "Sparrow.NavigationItem$Binding:'navigationItem.page.implicitHeight bind navigationItem.parent.height' 2.0"
        target: page
        property: "implicitHeight"
        value: navigationItem.parent.height
    }

}

