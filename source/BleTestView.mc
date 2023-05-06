import Toybox.Graphics;
import Toybox.WatchUi;

class BleTestView extends WatchUi.View {
  var scanStatusDesc = "NOT SCANNING";
  var connectionStatusDesc = "NOT CONNECTED";
  var scanning = false;

  function initialize() {
    View.initialize();
  }
  function onLayout(dc as Dc) as Void {}

  function onShow() as Void {}

  function onUpdate(dc as Dc) as Void {
    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
    dc.clear();

    dc.drawText(
      dc.getWidth() / 2,
      dc.getHeight() / 2 - 30,
      Graphics.FONT_SMALL,
      "SCAN STATUS: " + scanStatusDesc,
      Graphics.TEXT_JUSTIFY_CENTER
    );

    dc.drawText(
      dc.getWidth() / 2,
      dc.getHeight() / 2,
      Graphics.FONT_SMALL,
      "CONNECTION: " + connectionStatusDesc,
      Graphics.TEXT_JUSTIFY_CENTER
    );

    if (scanning == false) {
      dc.drawText(
        dc.getWidth() / 2,
        dc.getHeight() / 2 + 50,
        Graphics.FONT_SYSTEM_XTINY,
        "TAP TO START SCANNING",
        Graphics.TEXT_JUSTIFY_CENTER
      );
    } else {
      dc.drawText(
        dc.getWidth() / 2,
        dc.getHeight() / 2 + 50,
        Graphics.FONT_SYSTEM_XTINY,
        "TAP TO STOP SCANNING",
        Graphics.TEXT_JUSTIFY_CENTER
      );
    }
  }

  function onHide() as Void {}
}
