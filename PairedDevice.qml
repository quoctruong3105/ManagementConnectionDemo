import QtQuick 2.15
import QtQuick.Controls 2.5

Item {
    width: parent.width
    height: pairedDeviceTextId.visible ? (pairedDeviceTextId.height + pairedDeviceId.height) : 0
    Text {
        id: pairedDeviceTextId
        text: "PAIRED DEVICE"
        font.pointSize: 10
        x: 20
        anchors.top: btnId.bottom
        anchors.topMargin: 5
        visible: pairedDeviceCount === 0 ? false : true
    }

    Rectangle {
        id: pairedDeviceId
        width: rootId.width
        height: pairedDeviceNameId.implicitHeight + 15
        anchors.topMargin: 5
        radius: 30
        color: "lightgrey"
        border.color: "white"
        visible: pairedDeviceTextId.visible
        anchors.top: pairedDeviceTextId.bottom
        Text {
            id: pairedDeviceNameId
            x: 20
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 15
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                bluetoothAvailableList.append({"name":pairedDeviceNameId.text})
                pairedDeviceNameId.text = ""
                pairedDeviceCount--
            }
        }
    }
}
