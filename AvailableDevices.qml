import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.0
import "function.js" as Functions

Item {
    width: parent.width
    height: availableDeviceTextId.visible ? availableDeviceTextId.height + bluetoothAvailableView.height : 0
    Text {
        id: availableDeviceTextId
        x: 20
        visible: isOn ? true : false
        text: "AVAILABLE DEVICES"
        anchors.top: pairedDeviceTextId.visible ? pairedDeviceId.bottom : btnId.bottom
        anchors.topMargin: pairedDeviceTextId.visible ? 5 : 10
        font.pointSize: 10
    }

    ListView {
        id: bluetoothAvailableView
        width: parent.width
        height: parent.height
        anchors.top: availableDeviceTextId.bottom
        anchors.topMargin: 5
        clip: true
        visible: availableDeviceTextId.visible
        model: bluetoothAvailableList
        delegate: RowLayout {
            spacing: 20
            Rectangle {
                width: rootId.width
                height: deviceNameId.implicitHeight + 15
                radius: 30
                color: "lightgrey"
                border.color: "white"
                Text {
                    id: deviceNameId
                    x: 20
                    anchors.verticalCenter: parent.verticalCenter
                    text: name
                    font.pointSize: 15
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(pairedDeviceCount === 0) {
                            bluetoothScannerId.disconnecToDevice()
                            pairedDeviceCount++
                            pairedDeviceNameId.text = name
                            Functions.removeDevice()
                            bluetoothScannerId.connectToDevice(pairedDeviceNameId.text)
                        } else {
                            bluetoothScannerId.disconnecToDevice()
                            bluetoothAvailableList.append({"name":pairedDeviceNameId.text})
                            pairedDeviceNameId.text = name
                            Functions.removeDevice()
                            bluetoothScannerId.connectToDevice(pairedDeviceNameId.text)
                        }
                    }
                }
            }
        }
    }

    ListModel {
        id: bluetoothAvailableList
    }
}
