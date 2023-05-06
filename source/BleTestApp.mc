import Toybox.Application;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
using Toybox.BluetoothLowEnergy as Ble;

class BleTestApp extends Application.AppBase {
  hidden var view;
  hidden var controller;
  hidden var bleDelegate;

  function initialize() {
    AppBase.initialize();

    view = new BleTestView();
    controller = new BleTestController(view);
    bleDelegate = new BleDelegate(view);
    Ble.setDelegate(bleDelegate);
  }

  function onStart(state as Dictionary?) as Void {
    System.println("BleTestApp.onStart");
  }

  function onStop(state as Dictionary?) as Void {}

  function getInitialView() as Array<Views or InputDelegates>? {
    return [view, controller] as Array<Views or InputDelegates>;
  }
}

function getApp() as BleTestApp {
  return Application.getApp() as BleTestApp;
}
