import QtQuick 2.8
import QtQuick.Controls 2.2
import Material 0.2
import Material.ListItems 0.1 as ListItem

Rectangle {
    id: root
    property var gameData: Object
    property var targetPoints: gameData.target_point_list

    property var state: "waitAnswer"  // "onAnswer" "finished"

    width: 1200
    height: 800
    color: "#666666"

    MouseArea {
        anchors.fill: parent
        enabled: false
        cursorShape: screen.state === "running" ? Qt.BlankCursor : Qt.ArrowCursor
    }

    View {
        id: shapeUpView
        width: 750
        height: 180
        radius: 90
        anchors {
            top: parent.top
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        backgroundColor: "#444444"
        visible: gameData.answer_direction === 0
        Icon {
            name: "shape/dashedcircle"
            size: 120
            color: "white"
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 30
            visible: gameData.answer_position === 0
        }

        ChooseResult {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 100
            visible: gameData.answer_position === 0 && root.state === "finished"
        }

        Icon {
            name: "shape/dashedcircle"
            size: 120
            color: "white"
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.right: parent.right
            anchors.rightMargin: 30
            visible: gameData.answer_position === 1
        }

        ChooseResult {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.right: parent.right
            anchors.rightMargin: 30
            visible:  gameData.answer_position === 1 && root.state === "finished"
        }

        Flow {
            width: gameData.number >= 5 ? 400 : gameData.number * 64 + (gameData.number - 1) * 20
            anchors.centerIn: parent
            spacing: 20
            Repeater {
                model: gameData.number
                delegate: Icon {
                    name: "shape/pentagram"
                    size: 64
                    color: "orange"
                }
            }
        }
    }

    View {
        id: shapeLeftView
        width: 180
        height: 750
        radius: 90
        anchors {
            left: parent.left
            leftMargin: 150
            verticalCenter: parent.verticalCenter
        }
        backgroundColor: "#444444"
        visible: gameData.answer_direction === 1
        Icon {
            name: "shape/dashedcircle"
            size: 120
            color: "white"
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 30
            visible: gameData.answer_position === 0
        }

        ChooseResult {
            anchors.top: parent.top
            anchors.topMargin: 100
            anchors.right: parent.right
            anchors.rightMargin: 30
            visible: gameData.answer_position === 0 && root.state === "finished"
        }

        Icon {
            name: "shape/dashedcircle"
            size: 120
            color: "white"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 30
            visible: gameData.answer_position === 1
        }

        ChooseResult {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.right: parent.right
            anchors.rightMargin: 30
            visible:  gameData.answer_position === 1 && root.state === "finished"
        }

        Flow {
            flow: Flow.TopToBottom
            height: gameData.number >= 5 ? 400 : gameData.number * 64 + (gameData.number - 1) * 20
            anchors.centerIn: parent
            spacing: 20
            Repeater {
                model: gameData.number
                delegate: Icon {
                    name: "shape/pentagram"
                    size: 64
                    color: "orange"
                }
            }
        }
    }

    View {
        id: shapeRightView
        width: 180
        height: 750
        radius: 90
        anchors {
            right: parent.right
            rightMargin: 150
            verticalCenter: parent.verticalCenter
        }
        backgroundColor: "#444444"

        visible: gameData.answer_direction === 2

        Icon {
            name: "shape/dashedcircle"
            size: 120
            color: "white"
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 30
            visible: gameData.answer_position === 0
        }

        ChooseResult {
            anchors.top: parent.top
            anchors.topMargin: 100
            anchors.left: parent.left
            anchors.leftMargin: 100
            visible: gameData.answer_position === 0 && root.state === "finished"
        }

        Icon {
            name: "shape/dashedcircle"
            size: 120
            color: "white"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.right: parent.right
            anchors.rightMargin: 30
            visible: gameData.answer_position === 1
        }

        ChooseResult {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.right: parent.right
            anchors.rightMargin: 30
            visible:  gameData.answer_position === 1 && root.state === "finished"
        }

        Flow {
            height: gameData.number >= 5 ? 400 : gameData.number * 64 + (gameData.number - 1) * 20
            anchors.centerIn: parent
            flow: Flow.TopToBottom
            spacing: 20
            Repeater {
                model: gameData.number
                delegate: Icon {
                    name: "shape/pentagram"
                    size: 64
                    color: "orange"
                }
            }
        }
    }

    View {
        id: selectView
        width: 700
        height: 570
        anchors {
            top: shapeUpView.bottom
            topMargin: 30
            horizontalCenter: parent.horizontalCenter
        }
        Flow {
            id: flow
            anchors.horizontalCenter: parent.horizontalCenter
            width: 420
            height: 420
            spacing: 30

            Repeater {
                model: 9
                delegate: Rectangle {
                    width: 120
                    height: width
                    radius: 0.5 * width
                    color: "#555555"

                    Label {
                        anchors.centerIn: parent
                        text: Math.floor(
                                  index / 3) > 1 ? (index - 5) : Math.floor(
                                                       index / 3) > 0 ? (index + 1) : (index + 7)
                        color: "white"
                        style: "display3"
                    }
                }
            }
        }
        Rectangle {
            anchors.top: flow.bottom
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            width: 120
            height: width
            radius: 0.5 * width
            color: "#555555"

            Label {
                anchors.centerIn: parent
                text: "10"
                color: "white"
                style: "display3"
            }
        }
    }
}
