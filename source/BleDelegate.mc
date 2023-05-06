import Toybox.WatchUi;
import Toybox.System;
using Toybox.BluetoothLowEnergy as Ble;

class BleDelegate extends Ble.BleDelegate {
  hidden var serv_uuid = "9623EFF8-6174-3BF6-A090-37D94FB97421";
  hidden var char_uuid = "99B34054-4E07-4224-863C-F3CB513E40EB";
  hidden var serv_uuid_obj = Ble.stringToUuid(serv_uuid);
  hidden var char_uuid_obj = Ble.stringToUuid(char_uuid);
  hidden var view;

  function initialize(view) {
    BleDelegate.initialize();
    self.view = view;
  }

  function onConnectedStateChanged(device, state) {
    System.println("BleDelegate.onConnectedStateChanged");

    if (state == Ble.CONNECTION_STATE_CONNECTED) {
      System.println(
        "BleDelegate.onConnectedStateChanged. Connection is successfully established"
      );

      view.connectionStatusDesc = "CONNECTED!";
      WatchUi.requestUpdate();
    }
  }

  function onScanResults(scanResults) {
    System.println("BleDelegate.onScanResults");
    for (
      var result = scanResults.next() as Toybox.BluetoothLowEnergy.ScanResult;
      result != null;
      result = scanResults.next()
    ) {
      if (contains(result.getServiceUuids(), serv_uuid_obj)) {
        System.println(
          "BleDelegate.onScanResults. Device with the required UUID found"
        );

        Ble.setScanState(Ble.SCAN_STATE_OFF);
        view.scanning = false;
        view.scanStatusDesc = "DEVICE FOUNDED";
        view.connectionStatusDesc = "WAITING FOR CONNECTION";

        System.println("BleDelegate.onScanResults. Request for pairing");
        Ble.pairDevice(result);
        WatchUi.requestUpdate();
        return;
      }
    }
  }

  private function contains(iter, serv_uuid) {
    for (var uuid = iter.next(); uuid != null; uuid = iter.next()) {
      if (uuid.equals(serv_uuid)) {
        return true;
      }
    }
    return false;
  }
}
