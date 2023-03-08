import QtQuick 2.15
import QtQuick.Controls 2.5
import "function.js" as Functions

Item {
    width: refreshBtnId.width
    height: refreshBtnId.height
    anchors.bottom: availableDeviceTextId.bottom
    anchors.left: availableDeviceTextId.right
    anchors.leftMargin: 10
    visible: availableDeviceTextId.visible
    Rectangle {
        id: refreshBtnId
        height: availableDeviceTextId.height
        width: height
        Image {
            anchors.fill: parent
            source: "img/image/refresh.png"
        }
        MouseArea {
            hoverEnabled: true
            onEntered: refreshBtnId.scale = 1.2
            onExited: refreshBtnId.scale = 1
            anchors.fill: parent
            onClicked: {
                bluetoothAvailableList.clear()
                var length = bluetoothScannerId.getListLength()
                for(var i = 0; i < length; i ++) {
                    if(bluetoothScannerId.getBluetoothDeviceName(i) !== pairedDeviceNameId.text) {
                        bluetoothAvailableList.append({"name" : bluetoothScannerId.getBluetoothDeviceName(i)})
                    }
                }
            }
        }
    }
}
