import Toybox.Lang;
import Toybox.WatchUi;

class PetanqueDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new PetanqueMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}