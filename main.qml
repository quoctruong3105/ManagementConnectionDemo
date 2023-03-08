import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.0
import com.company.bluetoothscanner 1.0
import Qt.labs.settings 1.0
import "function.js" as Functions


Window {
    id: rootId
    width: 700
    height: 400
    visible: true
    title: qsTr("Hello World")

    //    property string colorOn: "#4361ee"
    //    property string colorOff: "grey"
    //    property bool isOn: false
    //    property int pairedDeviceCount: 0

    BluetoothUI {
        id: bluetoothId
    }

    //    BluetoothScanner {
    //        id: bluetoothScannerId
    //    }
    //    Loading {
    //        id: loadingDataId
    //    }

    //    RefreshButton {

    //    }

    //    EnableBluetoothButton {
    //        id: btnId
    //    }

    ////    Text {
    ////        id: pairedDeviceTextId
    ////        text: "PAIRED DEVICE"
    ////        font.pointSize: 10
    ////        x: 20
    ////        anchors.top: btnId.bottom
    ////        anchors.topMargin: 5
    ////        visible: pairedDeviceCount === 0 ? false : true
    ////    }

    ////    Rectangle {
    ////        id: pairedDeviceId
    ////        width: rootId.width
    ////        height: pairedDeviceNameId.implicitHeight + 15
    ////        anchors.topMargin: 5
    ////        radius: 30
    ////        color: "lightgrey"
    ////        border.color: "white"
    ////        visible: pairedDeviceTextId.visible
    ////        anchors.top: pairedDeviceTextId.bottom
    ////        Text {
    ////            id: pairedDeviceNameId
    ////            x: 20
    ////            anchors.verticalCenter: parent.verticalCenter
    ////            font.pointSize: 15
    ////        }
    ////        MouseArea {
    ////            anchors.fill: parent
    ////            onClicked: {
    ////                bluetoothAvailableList.append({"name":pairedDeviceNameId.text})
    ////                pairedDeviceNameId.text = ""
    ////                pairedDeviceCount--
    ////            }
    ////        }
    ////    }

    //    Text {
    //        id: availableDeviceTextId
    //        x: 20
    //        visible: isOn ? true : false
    //        text: "AVAILABLE DEVICES"
    //        anchors.top: pairedDeviceTextId.visible ? pairedDeviceId.bottom : btnId.bottom
    //        anchors.topMargin: pairedDeviceTextId.visible ? 5 : 10
    //        font.pointSize: 10
    //    }

    //    ListView {
    //        id: bluetoothAvailableView
    //        width: parent.width
    //        height: parent.height
    //        anchors.top: availableDeviceTextId.bottom
    //        anchors.topMargin: 5
    //        clip: true
    //        visible: availableDeviceTextId.visible
    //        model: bluetoothAvailableList
    //        delegate: RowLayout {
    //            spacing: 20
    //            Rectangle {
    //                width: rootId.width
    //                height: deviceNameId.implicitHeight + 15
    //                radius: 30
    //                color: "lightgrey"
    //                border.color: "white"
    //                Text {
    //                    id: deviceNameId
    //                    x: 20
    //                    anchors.verticalCenter: parent.verticalCenter
    //                    text: name
    //                    font.pointSize: 15
    //                }
    //                MouseArea {
    //                    anchors.fill: parent
    //                    onClicked: {
    //                        if(pairedDeviceCount === 0) {
    //                            bluetoothScannerId.disconnecToDevice()
    //                            pairedDeviceCount++
    //                            pairedDeviceNameId.text = name
    //                            Functions.removeDevice()
    //                            bluetoothScannerId.connectToDevice(pairedDeviceNameId.text)
    //                        } else {
    //                            bluetoothScannerId.disconnecToDevice()
    //                            bluetoothAvailableList.append({"name":pairedDeviceNameId.text})
    //                            pairedDeviceNameId.text = name
    //                            Functions.removeDevice()
    //                            bluetoothScannerId.connectToDevice(pairedDeviceNameId.text)
    //                        }
    //                    }
    //                }
    //            }
    //        }
    //    }

    //    ListModel {
    //        id: bluetoothAvailableList
    //    }

    Component.onCompleted: {
        bluetoothId.bluetoothScannerId.startDeviceDiscovery()
    }
}
