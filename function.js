function showAll() {
    var length = bluetoothScannerId.getListLength()
    for(var i = 0; i < length; i ++) {
        bluetoothAvailableList.append({"name" : bluetoothScannerId.getBluetoothDeviceName(i)})
    }
}

function removeDevice() {
    for (var i = 0; i < bluetoothAvailableList.count; i++) {
        if (bluetoothAvailableList.get(i).name === pairedDeviceNameId.text) {
            bluetoothAvailableList.remove(i);
            break;
        }
    }
}

function startScanning() {
    loadingDataId.busyIndicatorRunning = true
    loadingDataId.timerId.start()
}
