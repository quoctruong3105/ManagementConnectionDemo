import QtQuick 2.15
import QtQuick.Controls 2.5
import "function.js" as Functions

Item {
    width: btnId.width
    height: btnId.height
    y: 10
    anchors.horizontalCenter: parent.horizontalCenter
    Rectangle {
        id: btnId
        width: 50
        height: width
        radius: 10
        color: isOn ? colorOn : colorOff
        Image {
            width: parent.width
            height: width
            anchors.centerIn: parent
            source: "img/image/bluetooth.png"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                isOn = !isOn
                if(isOn) {
                    Functions.startScanning()
                } else {
                    bluetoothScannerId.disconnecToDevice()
                    pairedDeviceCount = 0
                    bluetoothAvailableList.clear()
                }
            }
        }
    }
}
