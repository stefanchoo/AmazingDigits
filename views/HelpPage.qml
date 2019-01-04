import QtQuick 2.8
import QtQuick.Controls 2.2
import Material 0.2
import Material.ListItems 0.1 as ListItem

Item {
    id: root
    width: 1200
    height: 800
    z: 200

    focus: screen.state !== "running"

    Keys.onReturnPressed: startBtn.click()

    property alias startButton: startBtn
    property alias finishButton: finishBtn

    Rectangle {
        anchors.centerIn: parent
        width: 1000
        height: 800
        color: "#444444"
        radius: 400
    }

    Label {
        anchors {
            top: parent.top
            topMargin: 50
            horizontalCenter: parent.horizontalCenter
        }
        text: "数字认知"
        color: "white"
        style: "display1"
    }

    Label {
        id: operationInfo
        anchors {
            top: parent.top
            topMargin: 130
            horizontalCenter: parent.horizontalCenter
        }
        text: "1. 观察目标图形数量" // 2. 选择对应数量的数字 // 3. 放置到虚线圆圈中 // 4.完成
        color: "white"
        style: "headline"
    }

    EndEffect {
        id: end
        size: 50
        bColor: "#03A9F4"
        x: 600
        y: 245
        //        x: 425
        //        y: 485
        //        x: 536
        //        y: 245
        state: x === 425 ? "graspState" : x === 536 ? "putState" : "moveState"
    }

    Icon {
        id: target
        size: 36
        name: "number/c2"
        color: "white"
        x: 431
        y: 490

        //        x: 542
        //        y: 250
        z: 100
        visible: false
    }

    View {
        id: shapeUpView
        width: 300
        height: 80
        radius: 50
        anchors {
            top: parent.top
            topMargin: 230
            left: parent.left
            leftMargin: 300
        }
        backgroundColor: "#555555"

        Icon {
            name: "shape/dashedcircle"
            size: 60
            color: "white"
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
        }

        ChooseResult {
            id: chooseResult
            size: 24
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            visible: false
        }

        Flow {
            width: 74
            anchors.centerIn: parent
            spacing: 10
            Repeater {
                model: 2
                delegate: Icon {
                    name: "shape/pentagram"
                    size: 32
                    color: "orange"
                }
            }
        }
    }

    View {
        id: selectView
        width: 300
        height: 300
        anchors {
            top: shapeUpView.bottom
            topMargin: 30
            left: shapeUpView.left
        }
        Flow {
            id: flow
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: 200
            spacing: 10

            Repeater {
                model: 9
                delegate: Rectangle {
                    width: 60
                    height: width
                    radius: 0.5 * width
                    color: "#555555"

                    Label {
                        anchors.centerIn: parent
                        text: Math.floor(
                                  index / 3) > 1 ? (index - 5) : Math.floor(
                                                       index / 3) > 0 ? (index + 1) : (index + 7)
                        color: "white"
                        style: "headline"
                    }
                }
            }
        }
        Rectangle {
            anchors.top: flow.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            width: 60
            height: width
            radius: 0.5 * width
            color: "#555555"

            Label {
                anchors.centerIn: parent
                text: "10"
                color: "white"
                style: "headline"
            }
        }
    }

    SequentialAnimation {
        running: true
        loops: Animation.Infinite

        NumberAnimation {
            // 暂停作用
            duration: 1000
        }
        PropertyAnimation {
            target: operationInfo
            property: "text"
            to: "2. 选择对应数量的数字"
        }
        ParallelAnimation {
            NumberAnimation {
                target: end
                property: "x"
                duration: 1000
                to: 425
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: end
                property: "y"
                duration: 1000
                to: 485
                easing.type: Easing.InOutQuad
            }
        }
        NumberAnimation {
            // 暂停作用
            duration: 2000
        }
        PropertyAnimation {
            target: end
            property: "visible"
            to: "false"
        }
        PropertyAnimation {
            target: target
            property: "visible"
            to: "true"
        }
        PropertyAnimation {
            target: operationInfo
            property: "text"
            to: "3. 放置到虚线圆圈中"
        }
        ParallelAnimation {
            NumberAnimation {
                target: end
                property: "x"
                duration: 1000
                to: 536
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: end
                property: "y"
                duration: 1000
                to: 245
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: target
                property: "x"
                duration: 1000
                to: 542
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: target
                property: "y"
                duration: 1000
                to: 250
                easing.type: Easing.InOutQuad
            }
        }
        PropertyAnimation {
            target: end
            property: "visible"
            to: "true"
        }
        NumberAnimation {
            // 暂停作用
            duration: 2000
        }
        PropertyAnimation {
            target: end
            property: "visible"
            to: "false"
        }
        PropertyAnimation {
            target: chooseResult
            property: "visible"
            to: "true"
        }
        PropertyAnimation {
            target: operationInfo
            property: "text"
            to: "4. 完成"
        }
        NumberAnimation {
            // 暂停作用
            duration: 2000
        }
        PropertyAnimation {
            target: target
            property: "visible"
            to: "false"
        }
        ParallelAnimation {
            PropertyAnimation {
                target: operationInfo
                property: "text"
                to: "1. 观察目标图形数量"
            }
            PropertyAnimation {
                target: chooseResult
                property: "visible"
                to: "false"
            }
            NumberAnimation {
                target: target
                property: "x"
                to: 431
            }
            NumberAnimation {
                target: target
                property: "y"
                to: 490
            }
            NumberAnimation {
                target: end
                property: "x"
                to: 600
            }
            NumberAnimation {
                target: end
                property: "y"
                to: 245
            }
        }
        PropertyAnimation {
            target: end
            property: "visible"
            to: "true"
        }
    }

    Item {
        width: parent.width * 0.4
        height: parent.height
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.15
        GameButton {
            id: startBtn
            text: "开始游戏"
            anchors {
                top: parent.top
                topMargin: 260
                horizontalCenter: parent.horizontalCenter
            }
            onClick: {
                if (screen.state == "pause")
                    screen.continued()
                else
                    screen.started()
            }
        }

        GameButton {
            id: finishBtn
            text: "结束游戏"
            enabled: screen.state === "pause"
            anchors {
                bottom: parent.bottom
                bottomMargin: 260
                horizontalCenter: parent.horizontalCenter
            }
            onClick: screen.finished()
        }
    }
}
