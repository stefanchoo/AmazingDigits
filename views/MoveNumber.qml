import QtQuick 2.8
import Material 0.2
import Material.ListItems 0.1 as ListItem

Item {
    width: 100
    height: 100
    property int number: 0
    Icon {
        anchors.centerIn: parent
        name: "number/c" + number
        size: 80
        color: "white"
    }
}
