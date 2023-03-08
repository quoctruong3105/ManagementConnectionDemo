import QtQuick 2.15
import QtQuick.Controls 2.5
import "function.js" as Functions

Item {
    width: loadingId.implicitWidth
    height: width
    anchors.top: availableDeviceTextId.bottom
    anchors.topMargin: 10
    anchors.horizontalCenter: parent.horizontalCenter
    property alias busyIndicatorRunning: loadingId.running
    property alias timerId: timer
    BusyIndicator {
        id: loadingId
        running: false
    }
    Timer {
        id: timer
        interval: 1000
        repeat: false
        onTriggered: {
            loadingId.running = false
            Functions.showAll()
        }
    }
}
