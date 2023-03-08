#include "BluetoothScanner.h"

BluetoothScanner::BluetoothScanner(QObject *parent)
    : QObject{parent}
{
    mSocket = new QBluetoothSocket(this);
}

void BluetoothScanner::startDeviceDiscovery()
{
    QBluetoothLocalDevice localDevice;
    if (localDevice.isValid()) {
        if (localDevice.hostMode() == QBluetoothLocalDevice::HostPoweredOff) {
            // Enable Bluetooth
            localDevice.powerOn();
            qDebug() << "Bluetooth turned on";

            // Wait for Bluetooth to be enabled
            QEventLoop loop;
            QObject::connect(&localDevice, SIGNAL(hostModeStateChanged(QBluetoothLocalDevice::HostMode)),
                             &loop, SLOT(quit()));
            loop.exec();
        } else {
            qDebug() << "Bluetooth already enabled";
        }
        QBluetoothDeviceDiscoveryAgent *discoveryAgent = new QBluetoothDeviceDiscoveryAgent(this);
        //discoveryAgent->setInquiryType(QBluetoothDeviceDiscoveryAgent::GeneralUnlimitedInquiry);
        connect(discoveryAgent, &QBluetoothDeviceDiscoveryAgent::deviceDiscovered,
                this, &BluetoothScanner::deviceDiscovered);
        // Start a discovery
        discoveryAgent->start();
    } else {
        qDebug() << "Bluetooth not available on this device";
    }
}

QString BluetoothScanner::getBluetoothDeviceName(int i)
{
    return availableDevices[i].name();
}

int BluetoothScanner::getListLength() {
    return availableDevices.length();
}

void BluetoothScanner::clearAllDevice()
{
    availableDevices.clear();
}

void BluetoothScanner::deviceDiscovered(const QBluetoothDeviceInfo &device)
{
    if(device.minorDeviceClass() != QBluetoothDeviceInfo::AudioVideoDevice) {
        return;
    }
    if (device.name().contains("Bluetooth ")) {
        return;
    }
    for(int i = 0; i < availableDevices.count(); i++) {
        if(device.name() == availableDevices.at(i).name()) {
            return;
        }
    }
    availableDevices.append(device);
}

void BluetoothScanner::connectToDevice(QString deviceName)
{
    if(mSocket) {
        mSocket->disconnectFromService();
        delete mSocket;
        mSocket = nullptr;
    }

    mSocket = new QBluetoothSocket(QBluetoothServiceInfo::RfcommProtocol, this);
    //QBluetoothUuid serviceUuid = QBluetoothUuid::AudioSink;
    QBluetoothUuid serviceUuid(QStringLiteral("0000110B-0000-1000-8000-00805F9B34FB"));
    connect(mSocket, &QBluetoothSocket::connected, this, &BluetoothScanner::socketConnected);
    connect(mSocket, &QBluetoothSocket::disconnected, this, &BluetoothScanner::socketDisconnected);
    for(int i = 0; i < availableDevices.count(); i++) {
        if(deviceName == availableDevices.at(i).name()) {
            mSocket->connectToService(QBluetoothAddress(availableDevices.at(i).address()), serviceUuid,
                                      QIODevice::WriteOnly);
            break;
        }
    }
}

void BluetoothScanner::disconnecToDevice()
{
    mSocket->disconnectFromService();
    delete mSocket;
    mSocket = nullptr;
    //connect(mSocket, &QBluetoothSocket::disconnected, this, &BluetoothScanner::socketDisconnected);
}

void BluetoothScanner::socketConnected()
{
    qDebug() << "Bluetooth socket connected";
}

void BluetoothScanner::socketDisconnected()
{
    qDebug() << "Bluetooth socket disconnected";
}




