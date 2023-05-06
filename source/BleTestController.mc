import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
using Toybox.BluetoothLowEnergy as Ble;

class BleTestController extends WatchUi.BehaviorDelegate {
  hidden var bleDelegate;
  hidden var view;

  function initialize(view) {
    BehaviorDelegate.initialize();
    self.view = view;
  }

  function onSelect() {
    if (view.scanning == false) {
      System.println("BleTestController.onSelect. Start scanning");

      Ble.setScanState(Ble.SCAN_STATE_SCANNING);
      view.scanning = true;
      view.scanStatusDesc = "SCANNING ...";
      WatchUi.requestUpdate();
    } else {
      System.println("BleTestController.onSelect. Stop scanning");

      Ble.setScanState(Ble.SCAN_STATE_OFF);
      view.scanning = false;
      view.scanStatusDesc = "NOT SCANNING";
      WatchUi.requestUpdate();
    }
    return true;
  }
}
